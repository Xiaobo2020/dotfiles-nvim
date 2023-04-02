local G = require("G")
local M = {}

M.config = function ()
  -- do nothing
end

M.setup = function ()
  require("hlchunk").setup({
    chunk = {
      enable = true,
      support_filetypes = {
        "*.ts",
        "*.tsx",
        "*.js",
        "*.jsx",
        "*.html",
        "*.json",
        "*.go",
        "*.cpp",
        "*.lua",
        "*.vue",
        },
    },
    indent= {
      enable= false,
    },
    line_num= {
      enable= true 
    },
    blank= {
      enable= false
    }
  })
end

return M
