local G = require("G")
local M = {}

M.config = function()
end

M.setup = function()
  require('Comment').setup {
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  }
end

return M