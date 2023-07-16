local function map(mode, l, r, desc)
  vim.keymap.set(mode, l, r, { silent = true, noremap = true, desc = desc })
end

return {
  {
    "voldikss/vim-floaterm",
    cmd = { "FloatermNew", "FloatermToggle", "FloatermPrev", "FloatermNext" },
    init = function()
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
      vim.g.floaterm_autoclose = 0
      vim.g.floaterm_opener = "edit"
      -- vim.cmd(
      --   "au BufEnter * if &buftype == 'terminal' | :call timer_start(50, { -> execute('startinsert!') }, { 'repeat': 3 }) | endif"
      -- )

      map("n", "<C-t>", "<Cmd>FloatermToggle<CR>", "Float terminal toggle")
      map("t", "<C-t>", "<Cmd>FloatermToggle<CR>", "Float terminal toggle")
    end,
  },
}
