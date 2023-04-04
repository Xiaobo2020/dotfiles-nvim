local G = require("G")
local M = {}

M.config = function() end

M.setup = function()
	require("mason-lspconfig").setup({
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
end

return M
