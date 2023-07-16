return {
  -- fuzzy finder: change some telescope options
  {
    "nvim-telescope/telescope.nvim",
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          -- prompt_position = "top",
          width = 0.90,
          height = 0.90,
        },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
}
