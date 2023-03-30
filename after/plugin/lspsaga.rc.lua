local status, lspsaga = pcall(require, "lspsaga")
if not status then
	return
end

lspsaga.setup({
	ui = {
		winblend = 10,
		border = "rounded",
		colors = {
			normal_bg = "#002b36",
		},
	},
	lightbulb = {
		enable = false,
	},
	rename = {
		quit = "<C-c>",
		exec = "<CR>",
		confirm = "<CR>",
		in_select = true,
	},
})

local diagnostic = require("lspsaga.diagnostic")