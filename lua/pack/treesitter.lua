local G = require("G")
local M = {}

function M.parser_bootstrap()
    local parsers = require("nvim-treesitter.parsers")
    local lang = parsers.ft_to_lang(G.api.nvim_eval('&ft'))
    local has_parser = parsers.has_parser(lang)
    if not has_parser then
        G.cmd("try | call execute('TSInstall " .. lang .. "') | catch | endtry")
    end
end

M.config = function ()
  -- G.hi({
  --   ["@variable"] = { fg = "NONE" };
  --   ["@function"] = { fg = 32 };
  --   ["@function.call"] = { fg = 32 };
  --   ["@operator"] = { fg = 166 };
  --   ["@keyword.operator"] = { fg = 166 };

  --   ["@property"] = { fg = 172 };
  --   ["@field"] = { fg = 150 };
  --   ["@method"] = { fg = 166 };
  --   ["@method.call"] = { fg = 9 };
  --   ["@parameter"] = { fg = 9 };

  --   ["@keyword"] = { fg = 1 };
  --   ["@keyword.function"] = { fg = 32 };
  --   ["@exception"] = { fg = 32 };

  --   ["@statement"] = { fg = 166 };
  --   ["@special"] = { fg = 172 };
  --   ["@comment"] = { fg = 71, italic = true };
  --   ["@include"] = { fg = 1 };
  --   ["@type"] = { fg = 179 };
  --   ["@type.builtin"] = { fg = 150 };
  --   ["@punctuation.bracket"] = { fg = 151 };

  --   ["@constructor"] = { fg = 172 };
  --   ["@namespace"] = { fg = 172 };

  --   ["@string"] = { fg = 37 };
  --   ["@number"] = { fg = 37 };
  --   ["@boolean"] = { fg = 37 };

  --   ["@tag"] = { fg = 172 };
  --   ["@tag.attribute"] = { fg = 166 };
  --   ["@tag.delimiter"] = { fg = 150 };
  --   ["@conditional.ternary"] = { fg = 1 };
  --   ["@punctuation.special"] = { fg = 166 };

  --   ["@text.literal"] = { fg = 7 };

  --   ["@text.todo.unchecked"] = { fg = 172 };
  --   ["@text.todo.checked"] = { fg = 37 };
  -- })
  G.map({
    { 'n', 'H', ':TSHighlightCapturesUnderCursor<CR>', { silent = true, noremap = true } },
    { 'n', 'R', ':write | edit | TSBufEnable highlight<CR>', { silent = true, noremap = true } },
  })

  -- some custom highlights
  G.hi({
    Todo = { fg = 234, bg = 38, bold = true };
    -- TodoText = { fg = 38, bg = 'NONE', bold = true };
    -- Note = { fg = 234, bg = 78, bold = true };
    -- NoteText = { fg = 78, bg = 'NONE', bold = true };
  })
  G.cmd("call matchadd('Todo', 'TODO:')")
  -- G.cmd([[call matchadd('TodoText', 'TODO:\{0,1\}\zs.*')]])
  -- G.cmd([[call matchadd('Note', 'NOTE:\{0,1\}')]])
  -- G.cmd([[call matchadd('NoteText', 'NOTE:\{0,1\}\zs.*')]])
end

M.setup = function ()
  require("nvim-treesitter.configs").setup({
    highlight = {
      enable = true,
      disable = {},
    },
    indent = {
      enable = true,
      disable = {},
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
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
    sync_install = false,
    auto_install = true,
    autotag = {
      enable = true,
    },
  })

  -- M.parser_bootstrap()
  -- G.cmd([[ au FileType * lua require('pack/treesitter').parser_bootstrap() ]])
end

return M