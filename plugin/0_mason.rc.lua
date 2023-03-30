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
		"eslint",
		"html",
		"cssls",
		"tailwindcss",
	},
})

mason_null_ls.setup({
	automatic_installation = true,
	ensure_installed = {
		"stylua", -- lua formatter
	},
})
