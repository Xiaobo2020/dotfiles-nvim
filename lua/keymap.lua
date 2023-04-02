local G = require("G")

-- 主键
G.g.mapleader = " "

local opts = { silent = true, noremap = true }
G.map({
	-- Insert mode --
	{ "i", "jk", "<ESC>", opts },

	-- Visual mode --
	-- 单行或多行移动
	{ "v", "J", ":m '>+1<CR>gv=gv", opts },
	{ "v", "K", ":m '<-2<CR>gv=gv", opts },

	-- Normal mode
	-- 窗口
	{ "n", "<leader>sv", "<C-w>v", opts }, -- 水平分屏
	{ "n", "<leader>sh", "<C-w>s", opts }, -- 垂直分屏

	-- 取消高亮
	{ "n", "<leader>nh", ":nohl<CR>", opts },

	-- 全选
	{ "n", "<C-a>", "gg<S-v>G", opts },

	-- 插件 --
	-- nvim-tree
	{ "n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts },
	-- <Tab> 展开文件内容，注意光标还是在tree中
	-- <Return> 展开文件夹或打开文件，注意关闭tree并光标移动到文件中

	-- Move window
	{ "n", "<C-h>", "<C-w>h", opts },
	{ "n", "<C-k>", "<C-w>k", opts },
	{ "n", "<C-j>", "<C-w>j", opts },
	{ "n", "<C-l>", "<C-w>l", opts },
	-- Resize window
	{ "n", "<C-w><left>", "<C-w><", opts },
	{ "n", "<C-w><right>", "<C-w>>", opts },
	{ "n", "<C-w><up>", "<C-w>+", opts },
	{ "n", "<C-w><down>", "<C-w>-", opts },

	-- bufferline配置的Tab
	{ "n", "<leader>te", "<Cmd>tabedit<CR>", opts },
	{ "n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts },
	{ "n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts },

	-- Git
	{ "n", "<leader>do", "<Cmd>DiffviewOpen<CR>", opts }, -- open
	{ "n", "<leader>dc", "<Cmd>DiffviewClose<CR>", opts }, -- close
	{ "n", "<leader>dh", "<Cmd>DiffviewFileHistory %<CR>", opts }, -- current file
	{ "n", "<leader>db", "<Cmd>DiffviewFileHistory<CR>", opts }, -- current branch

	-- Keymaps in telescope.lua
	-- Find file
	-- {"n", "<leader>ff", function()
	-- 	builtin.find_files({
	-- 		no_ignore = false,
	-- 		hidden = true,
	-- 	})
	-- end, opts},

	-- Find from content
	-- {"n", "<leader>fg", builtin.live_grep ,opts},

	-- Find from buffers
	-- {"n", "<leader>fb", builtin.buffers ,opts},

	-- Show help tags
	-- {"n", "<leader>fh", builtin.help_tags,opts},

	-- -- Find from directory
	-- {"n", "<leader>fd", function()
	-- 	require("telescope").extensions.file_browser.file_browser({
	-- 		path = "%:p:h",
	-- 		cwd = telescope_buffer_dir(),
	-- 		respect_gitignore = false,
	-- 		hidden = true,
	-- 		grouped = true,
	-- 		previewer = false,
	-- 		initial_mode = "normal",
	-- 		layout_config = { height = 40 },
	-- 	})
	-- end,opts},

	-- Keymaps in lspconfig.lua
	-- -- Floating terminal
	-- {"n", "<leader>tt", "<Cmd>Lspsaga term_toggle<CR>", opts},

	-- -- Jump to previous diganostic in buffer
	-- {"n", "<leader>jp", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts},

	-- -- Jump to next diganostic in buffer
	-- {"n", "<leader>jn", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts},

	-- -- Show diagnostic in current line
	-- {"n", "<leader>l", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts},

	-- -- Show hover doc
	-- {"n", "<leader>h", "<Cmd>Lspsaga hover_doc<CR>", opts},

	-- -- Show code action
	-- {"n", "<leader>ca", "<Cmd>Lspsaga code_action<CR>", opts},

	-- -- Show outline on the right hand side
	-- {"n", "<leader>ol", "<Cmd>Lspsaga outline<CR>", opts},

	-- -- Go to definition
	-- {"n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts},

	-- -- Go to type definition
	-- {"n", "gt", "<cmd>Lspsaga goto_type_definition<CR>",opts},

	-- -- Peek definition
	-- {"n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts},

	-- -- Rename variable
	-- {"n", "gr", "<Cmd>Lspsaga rename<CR>", opts},

	-- -- Show definitions & implements & references
	-- {"n", "gf", "<Cmd>Lspsaga lsp_finder<CR>", opts},

	-- -- Typescript - Rename file and update imports
	-- {"n", "<leader>rf", "<Cmd>TypescriptRenameFile<CR>",opts},

	-- Markdown previewe
	{ "n", "<leader>mp", "<Cmd>MarkdownPreview<CR>", opts }, -- Start markdown preview
	{ "n", "<leader>ms", "<Cmd>MarkdownPreviewStop<CR>", opts }, -- Stop markdown preview
})
