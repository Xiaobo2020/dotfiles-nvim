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

  -- Tmux navigator 使用<C-h/j/k/l>在分屏间切换
  use 'christoomey/vim-tmux-navigator'

  -- 语法高亮
  use 'nvim-treesitter/nvim-treesitter'
end)

