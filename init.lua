require("plugins.plugins-setup")

require("core.options")
require("core.colorscheme")

-- 插件 --
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.treesitter")
require("plugins.lsp.lspconfig")
require("plugins.lsp.colors")
require("plugins.cmp")
require("plugins.autopairs")
require("plugins.ts-autotag")
require("plugins.comment")
require("plugins.bufferline")
require("plugins.colorizer")
require("plugins.gitsigns")
require("plugins.telescope")
require("plugins.lspsaga")
require("plugins.leap")
require("plugins.todo-comments")

-- 按键映射 --
require("core.keymaps")
