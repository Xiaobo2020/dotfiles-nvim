local G = require("G")
local M = {}

M.config = function() end

M.setup = function()
	require("nvim-ts-autotag").setup()
end

return M
