local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "javascript",
    "html",
    "css",
    "scss",
    "fish",
    "markdown",
    "markdown_inline",
    "lua",
    "dart",
    "yaml",
    "json",
    "python",
    "rust",
  },
  autotag = {
    enable = true,
  },
}

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

