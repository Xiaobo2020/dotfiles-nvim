if true then
  return {}
end

return {
  -- library used by other plugins
  { "nvim-lua/popup.nvim", lazy = true },

  -- media files previewer
  {
    "telescope.nvim",
    opts = {
      extensions = {
        media_files = {
          -- filetypes whitelist
          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          filetypes = { "png", "webp", "jpg", "jpeg" },
          -- find command (defaults to `fd`)
          -- find_cmd = "rg",
          find_cmd = "fd",
        },
      },
    },
    dependencies = {
      {
        "nvim-telescope/telescope-media-files.nvim",
        event = "VeryLazy",
        keys = {
          -- add a keymap to browse media files
          {
            "<leader>fm",
            function()
              require("telescope").extensions.media_files.media_files()
            end,
            desc = "Find Media Files",
          },
        },
        config = function()
          require("telescope").load_extension("media_files")
        end,
      },
    },
  },
}
