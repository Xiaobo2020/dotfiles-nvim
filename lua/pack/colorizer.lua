local G = require("G")
local M = {}

M.config = function() end

M.setup = function()
	require("colorizer").setup({
		"*",
	})
end

return M
