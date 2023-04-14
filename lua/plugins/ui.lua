return {
  -- Better `vim.notify()`
  {
    "rcarriga/nvim-notify",
    enabled = false,
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Delete all Notifications",
      },
    },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    init = function()
      -- when noice is not enabled, install notify on VeryLazy
      local Util = require("lazyvim.util")
      if not Util.has("noice.nvim") then
        Util.on_very_lazy(function()
          vim.notify = require("notify")
        end)
      end
    end,
  },

  -- disable indent-blankline.nvim
  { "lukas-reineke/indent-blankline.nvim", enabled = false },

  -- indent guides for Neovim hlchunk
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
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
          "*.c",
          "*.cpp",
          "*.rs",
          "*.h",
          "*.hpp",
          "*.lua",
          "*.vue",
        },
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = ">",
        },
        style = "#6fa8dc",
      },

      indent = {
        enable = true,
        use_treesitter = false,
        chars = {
          "│",
        },
        exclude_filetype = {
          dashboard = true,
          help = true,
          lspinfo = true,
          packer = true,
          checkhealth = true,
          man = true,
          mason = true,
          NvimTree = true,
          plugin = true,
          ["neo-tree"] = true,
        },
      },

      line_num = {
        enable = false,
        style = "#6fa8dc",
      },

      blank = {
        enable = false,
      },
    },
  },

  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      "*",
    },
  },
}
