local G = require("G")

local ensure_packer = function()
	local fn = G.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		G.cmd("packadd packer.nvim")
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- 启动时间分析
	use({ "dstein64/vim-startuptime", cmd = "StartupTime" })

	-- 启动界面
	use("mhinz/vim-startify")

	-- 主题
	require("pack.everforest").config()
	use({
		"sainnhe/everforest",
		config = function()
			require("pack.everforest").setup()
		end,
	})

	-- 快速跳转
	require("pack.leap").config()
	use({
		"ggandor/leap.nvim",
		config = function()
			require("pack.leap").setup()
		end,
	})

	-- Surround
	require("pack.surround").config()
	use({
		"tpope/vim-surround",
		config = function()
			require("pack.surround").setup()
		end,
		event = { "CursorMoved" },
	})

	-- 快速多行操作
	use({ "mg979/vim-visual-multi", event = { "CursorHold" } })

	-- 语法高亮
	require("pack.treesitter").config()
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("pack.treesitter").setup()
		end,
		-- run = ':TSUpdate',
		-- event = 'BufRead'
	})
	use({ "nvim-treesitter/playground", after = "nvim-treesitter" })

	-- 括号等自动补全 --
	require("pack.autopairs").config()
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("pack.autopairs").setup()
		end,
		event = { "InsertEnter" },
	})
	require("pack.ts-autotag").config()
	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("pack.ts-autotag").setup()
		end,
		after = "nvim-treesitter",
	})

	-- 浮动终端
	require("pack.floaterm").config()
	use({
		"voldikss/vim-floaterm",
		config = function()
			require("pack.floaterm").setup()
		end,
	})

	-- -- markdown预览插件 导航生成插件
	-- require("pack.markdown").config()
	-- use({ "mzlogin/vim-markdown-toc", ft = "markdown" })
	-- use({
	-- 	"iamcco/markdown-preview.nvim",
	-- 	config = function()
	-- 		require("pack.markdown").setup()
	-- 	end,
	-- 	run = "cd app && npm install",
	-- 	cmd = "MarkdownPreview",
	-- 	ft = "markdown",
	-- })

	-- 注释
	use({ "numToStr/Comment.nvim", after = "nvim-treesitter" })
	require("pack.comment").config()
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		after = "Comment.nvim",
		config = function()
			require("pack.comment").setup()
		end,
	})

	-- 通用图标
	require("pack.web-devicons").config()
	use({
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("pack.web-devicons").setup()
		end,
	})

	-- 状态栏
	require("pack.lualine").config()
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("pack.lualine").setup()
		end,
		event = { "BufRead" },
	})

	-- 高亮{}范围
	require("pack.hlchunk").config()
	use({
		"shellRaining/hlchunk.nvim",
		config = function()
			require("pack.hlchunk").setup()
		end,
		event = { "CursorMoved", "CursorMovedI" },
	})

	-- 文件管理器
	require("pack.nvim-tree").config()
	use({
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("pack.nvim-tree").setup()
		end,
		-- cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
	})

	-- 自动补全 --
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("L3MON4D3/LuaSnip")
	-- use("rafamadriz/friendly-snippets")
	require("pack.nvim-cmp").config()
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("pack.nvim-cmp").setup()
		end,
	})

	-- mason
	require("pack.mason").config()
	use({
		"williamboman/mason.nvim",
		config = function()
			require("pack.mason").setup()
		end,
	})

	-- lspconfig
	use("jose-elias-alvarez/typescript.nvim")
	require("pack.lspconfig").config()
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("pack.lspconfig").setup()
		end,
		requires = {
			"jose-elias-alvarez/typescript.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		after = {
			"mason-lspconfig.nvim",
		},
	})

	-- mason-lspconfig
	require("pack.mason-lspconfig").config()
	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("pack.mason-lspconfig").setup()
		end,
		requires = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		after = {
			"mason.nvim",
		},
	})

	-- null-ls
	use("nvim-lua/plenary.nvim")
	require("pack.null-ls").config()
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("pack.null-ls").setup()
		end,
	})

	-- mason-null-ls
	require("pack.mason-null-ls").config()
	use({
		"jay-babu/mason-null-ls.nvim",
		config = function()
			require("pack.mason-null-ls").setup()
		end,
		requires = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		after = {
			"mason.nvim",
		},
	})

	-- 颜色显示 --
	require("pack.colorizer").config()
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("pack.colorizer").setup()
		end,
	})

	-- Tab分隔 --
	require("pack.bufferline").config()
	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("pack.bufferline").setup()
		end,
	})

	-- Git --
	require("pack.gitsigns").config()
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("pack.gitsigns").config()
		end,
	})

	-- Git Diff
	require("pack.diffview").config()
	use({
		"sindrets/diffview.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("pack.diffview").setup()
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
