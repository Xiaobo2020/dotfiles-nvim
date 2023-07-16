return {
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
}
