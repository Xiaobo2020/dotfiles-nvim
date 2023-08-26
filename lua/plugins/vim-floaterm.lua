local map = require("util.utils").map

return {
  {
    "voldikss/vim-floaterm",
    cmd = { "FloatermNew", "FloatermToggle", "FloatermPrev", "FloatermNext" },
    init = function()
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
      vim.g.floaterm_autoclose = 0
      vim.g.floaterm_opener = "edit"

      map("n", "<C-t>", "<Cmd>FloatermToggle<CR>", { desc = "Float terminal toggle", silent = true, noremap = true })
      map("t", "<C-t>", "<Cmd>FloatermToggle<CR>", { desc = "Float terminal toggle", silent = true, noremap = true })
    end,
  },
}
