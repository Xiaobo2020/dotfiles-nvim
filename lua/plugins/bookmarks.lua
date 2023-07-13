return {
  {
    "crusj/bookmarks.nvim",
    opts = {
      storage_dir = "",
      width = 0.90,
      height = 0.90,
      preview_ext_enable = true,
      fix_enable = true,
      virt_text = "",
      virt_pattern = {},
    },
    keys = {
      {
        "<leader>fm",
        "<Cmd>Telescope bookmarks<CR>",
        desc = "Find All Bookmarks",
      },
      {
        "<leader>ma",
        function()
          require("bookmarks").add_bookmarks()
        end,
        desc = "Bookmark add",
      },
      {
        "<leader>ml",
        function()
          require("bookmarks").toggle_bookmarks()
        end,
        desc = "Bookmark list",
      },
    },
    branch = "main",
    dependencies = { "nvim-web-devicons" },
    config = function(_, opts)
      require("bookmarks").setup(opts)
      require("telescope").load_extension("bookmarks")
    end,
  },
}
