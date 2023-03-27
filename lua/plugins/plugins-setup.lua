vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- 主题 --
  use 'sainnhe/everforest'

  -- 状态栏 --
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Nvim Tree --
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  -- Tmux navigator --
  use 'christoomey/vim-tmux-navigator'

  -- 语法高亮 --
  use 'nvim-treesitter/nvim-treesitter'

  -- 使用Mason插件统一管理LSP服务 --
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- 自动补全 --
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"

  -- 括号等自动补全 --
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- 注释 --
  use {
    'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }

  -- Tab分隔 --
  use 'akinsho/bufferline.nvim'

  -- 颜色显示 --
  use 'norcalli/nvim-colorizer.lua'

  -- Git --
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse

  -- Telescope --
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim'
    }
  }

  -- LSP UIs --
  use 'glepnir/lspsaga.nvim'

  -- Leap And Surround And Multi --
  use "ggandor/leap.nvim"
  use "tpope/vim-surround"
  use 'mg979/vim-visual-multi'
end)
