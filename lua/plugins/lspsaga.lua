return {
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = {
      ui = {
        winblend = 10,
        border = "rounded",
        colors = {
          normal_bg = "#002b36",
        },
      },
      lightbulb = {
        enable = false,
      },
    },
    keys = {
      { "<leader>h", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover" },
      { "<leader>xc", "<cmd>Lspsaga show_cursor_diagnostics<cr>", desc = "Cursor Diagnostics (Trouble)" },
      { "<leader>xs", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Line Diagnostics (Trouble)" },
      { "[q", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Previous trouble/quickfix item" },
      { "]q", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next trouble/quickfix item" },
    },
    config = function(_, opts)
      require("lspsaga").setup(opts)
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
}
