local G = require("G")

local ensure_packer = function()
  local fn = G.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    G.cmd([[
      packadd packer.nvim
    ]])
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
  -- require("pack/everforest").config()
  -- use({'sainnhe/everforest', config = "require('pack/everforest').setup()"})

  -- 快速跳转
  require("pack/leap").config()
  use({ "ggandor/leap.nvim", config = "require('pack/leap').setup()" })

  -- Surround
  use("tpope/vim-surround")

  -- 快速多行操作
  use("mg979/vim-visual-multi")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)

