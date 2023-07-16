return {
  -- fuzzy finder: change some telescope options
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          preview_cutoff = 0,
          width = 0.90,
          height = 0.90,
        },
      },
    },
  },
}
