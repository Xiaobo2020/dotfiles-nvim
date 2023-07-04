return {
  {
    "tomasky/bookmarks.nvim",
    branch = "main",
    keys = {
      {
        "<leader>fm",
        "<Cmd>Telescope bookmarks list<CR>",
        desc = "Find All Bookmarks",
      },
      {
        "<leader>mm",
        function()
          require("bookmarks").bookmark_toggle()
        end,
        desc = "Bookmark toggle",
      },
      {
        "<leader>mi",
        function()
          require("bookmarks").bookmark_ann()
        end,
        desc = "Bookmark edit annotation",
      },
      {
        "<leader>mc",
        function()
          require("bookmarks").bookmark_clean()
        end,
        desc = "Bookmark clean",
      },
      {
        "<leader>ml",
        function()
          require("bookmarks").bookmark_list()
        end,
        desc = "Bookmark list",
      },
    },
    config = function()
      require("bookmarks").setup()
      require("telescope").load_extension("bookmarks")
    end,
  },

  -- {
  --   "crusj/bookmarks.nvim",
  --   keys = {
  --     { "<tab><tab>", mode = { "n" } },
  --   },
  --   branch = "main",
  --   dependencies = { "nvim-web-devicons" },
  --   config = function()
  --     require("bookmarks").setup()
  --     require("telescope").load_extension("bookmarks")
  --   end,
  -- },

  -- {
  --   "telescope.nvim",
  --   dependencies = {
  --     "crusj/bookmarks.nvim",
  --     config = function()
  --       require("telescope").load_extension("bookmarks")
  --     end,
  --   },
  -- },
}
