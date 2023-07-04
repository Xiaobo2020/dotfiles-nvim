return {
  {
    "crusj/bookmarks.nvim",
    opts = {
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

  -- {
  --   "tomasky/bookmarks.nvim",
  --   branch = "main",
  --   keys = {
  --     {
  --       "<leader>fm",
  --       "<Cmd>Telescope bookmarks list<CR>",
  --       desc = "Find All Bookmarks",
  --     },
  --     {
  --       "<leader>mm",
  --       function()
  --         require("bookmarks").bookmark_toggle()
  --       end,
  --       desc = "Bookmark toggle",
  --     },
  --     {
  --       "<leader>mi",
  --       function()
  --         require("bookmarks").bookmark_ann()
  --       end,
  --       desc = "Bookmark edit annotation",
  --     },
  --     {
  --       "<leader>mc",
  --       function()
  --         require("bookmarks").bookmark_clean()
  --       end,
  --       desc = "Bookmark clean",
  --     },
  --     {
  --       "<leader>ml",
  --       function()
  --         require("bookmarks").bookmark_list()
  --       end,
  --       desc = "Bookmark list",
  --     },
  --   },
  --   config = function()
  --     require("bookmarks").setup()
  --     require("telescope").load_extension("bookmarks")
  --   end,
  -- },
}
