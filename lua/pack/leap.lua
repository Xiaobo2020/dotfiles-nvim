local G = require("G")
local M = {}

M.config = function()
end

M.setup = function()
  require("leap").add_default_mappings()
end

return M