local G = require("G")

local ensure_packer = function()
  local fn = G.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    G.cmd("packadd packer.nvim")
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- 启动时间分析
  use { "dstein64/vim-startuptime", cmd = "StartupTime" }

  -- 启动界面
  use("mhinz/vim-startify")

  -- 主题
  require("pack/everforest").config()
  use({'sainnhe/everforest', config = "require('pack/everforest').setup()"})

  -- 快速跳转
  require("pack/leap").config()
  use({ "ggandor/leap.nvim", config = "require('pack/leap').setup()" })

  -- Surround
  require("pack/surround").config()
  use({
    "tpope/vim-surround",
    config = "require('pack/surround').setup()",
    event = { "CursorMoved" }
  })

  -- 快速多行操作
  use ({"mg979/vim-visual-multi", event = {"CursorHold"}})

  -- 语法高亮
  require('pack/treesitter').config()
  use {
    'nvim-treesitter/nvim-treesitter',
    config = "require('pack/treesitter').setup()",
    -- run = ':TSUpdate',
    -- event = 'BufRead'
  }
  use { 'nvim-treesitter/playground', after = 'nvim-treesitter' }

	-- 括号等自动补全 --
  require("pack/autopairs").config()
	use({
    "windwp/nvim-autopairs",
    config = "require('pack/autopairs').setup()",
    event = { "InsertEnter" }
  })
  -- TODO:
  require("pack/ts-autotag").config()
	use({
    "windwp/nvim-ts-autotag",
    config = "require('pack/ts-autotag').setup()",
    after = "nvim-treesitter",
    event = { "InsertEnter", }
  })

  -- 浮动终端
  require('pack/floaterm').config()
  use { 'voldikss/vim-floaterm', config = "require('pack/floaterm').setup()" }

  -- markdown预览插件 导航生成插件
  -- require('pack/markdown').config()
  -- use { 'mzlogin/vim-markdown-toc', ft = 'markdown' }
  -- use {
  --   'iamcco/markdown-preview.nvim',
  --   config = "require('pack/markdown').setup()",
  --   run = 'cd app && npm install',
  --   cmd = 'MarkdownPreview',
  --   ft = 'markdown'
  -- }

  -- 注释
  use({ "numToStr/Comment.nvim", after = "nvim-treesitter" })
  require("pack/comment").config()
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "Comment.nvim",
    config = "require('pack/comment').setup()"
  }

  -- 通用图标
  require("pack/web-devicons").config()
  use({"nvim-tree/nvim-web-devicons", config = "require('pack/web-devicons').setup()"})

  -- 状态栏
  require("pack/lualine").config()
  use({
    "nvim-lualine/lualine.nvim",
    config = "require('pack/lualine').setup()",
    event = { "BufRead" }
  })

  -- 高亮{}范围
  require("pack/hlchunk").config()
  use {
    "shellRaining/hlchunk.nvim",
    config = "require('pack/hlchunk').setup()",
    event = { "CursorMoved", "CursorMovedI" },
  }

  -- 文件管理器
  require('pack/nvim-tree').config()
  use { 'nvim-tree/nvim-tree.lua', config = "require('pack/nvim-tree').setup()", cmd = { 'NvimTreeToggle', 'NvimTreeFindFileToggle' } }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)

