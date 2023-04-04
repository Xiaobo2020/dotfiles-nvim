local G = require("G")
local M = {}

M.config = function() end

M.setup = function()
	require("nvim-web-devicons").setup({
		override = {},
		default = true,
	})
end

return M
