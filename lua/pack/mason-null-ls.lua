local G = require("G")
local M = {}

M.config = function()
end

M.setup = function()
  require("mason-null-ls").setup({
    automatic_installation = true,
    ensure_installed = {
      "stylua", -- lua formatter
    },
  })
end

return M