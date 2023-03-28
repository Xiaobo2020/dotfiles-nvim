local status, mason = pcall(require, "mason")
if not status then
	return
end

local status2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
	return
end

local status3, mason_null_ls = pcall(require, "mason-null-ls")
if not status3 then
	return
end

mason.setup()

mason_lspconfig.setup({
	automatic_installation = true,
	ensure_installed = {
		"lua_ls",
		"tsserver",
		"html",
		"cssls",
		"emmet_ls",
		"tailwindcss",
	},
})

mason_null_ls.setup({
	automatic_installation = true,
	ensure_installed = {
		"stylua", -- lua formatter
	},
})

local protocol = require("vim.lsp.protocol")
protocol.CompletionItemKind = {
	"", -- Text
	"", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

-- local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
-- local enable_format_on_save = function(_, bufnr)
-- 	vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
-- 	vim.api.nvim_create_autocmd("BufWritePre", {
-- 		group = augroup_format,
-- 		buffer = bufnr,
-- 		callback = function()
-- 			vim.lsp.buf.format({ bufnr = bufnr })
-- 		end,
-- 	})
-- end
local keymap = vim.keymap
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	keymap.set("n", "<leader>h", "<Cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "gf", "<Cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts) -- go to definition
	keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts) -- smart rename
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	keymap.set("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	keymap.set("n", "<leader>ca", "<Cmd>Lspsaga code_action<CR>", opts) -- see available code actions

	keymap.set("n", "<leader>d", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	-- keymap.set("n", "<leader>d", "<Cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	-- keymap.set("n", "<leader>o", "<Cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
	-- keymap.set("n", "<leader>tt", "<Cmd>Lspsaga term_toggle<CR>", opts) -- see outline on right hand side

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", "<Cmd>TypescriptRenameFile<CR>") -- rename file and update imports
		keymap.set("n", "<leader>oi", "<Cmd>TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		keymap.set("n", "<leader>ru", "<Cmd>TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end
end
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_configs = {
	capabilities = capabilities,
	on_attach = on_attach,
}

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup(lsp_configs)
	end,
	tsserver = function()
		require("lspconfig").tsserver.setup(vim.tbl_extend("force", lsp_configs, {
			filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
			cmd = { "typescript-language-server", "--stdio" },
		}))
		-- require("typescript").setup({
		-- 	server = vim.tbl_extend("force", lsp_configs, {
		-- 		init_options = {
		-- 			preferences = {
		-- 				importModuleSpecifierPreference = "project=relative",
		-- 				jsxAttributeCompletionStyle = "none",
		-- 			},
		-- 		},
		-- 	}),
		-- })
	end,
	eslint = function()
		require("lspconfig").eslint.setup({
			on_attach = function(_, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
		})
	end,
	emmet_ls = function()
		require("lspconfig").emmet_ls.setup(vim.tbl_extend("force", lsp_configs, {
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		}))
	end,
	lua_ls = function()
		require("lspconfig").lua_ls.setup(vim.tbl_extend("force", lsp_configs, {
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				-- Replace with stylua
				-- enable_format_on_save(client, bufnr)
			end,
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
				},
			},
		}))
	end,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	signs = {
		priority = 4,
	},
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
})
