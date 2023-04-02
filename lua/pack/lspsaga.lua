local G = require("G")
local M = {}

M.config = function() end

M.setup = function()
	local lspsaga = require("lspsaga")

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
end

return M
