return {
  -- :copilot setup
  -- :help copilot
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_filetypes = {
        ["*"] = false,
        ["javascript"] = true,
        ["javascriptreact"] = true,
        ["jsx"] = true,
        ["typescript"] = true,
        ["typescriptreact"] = true,
        ["tsx"] = true,
        ["lua"] = false,
      }
      vim.api.nvim_set_keymap("i", "<C-g>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
      vim.api.nvim_set_keymap("i", "<C-]>", "copilot#Next()", { silent = true, expr = true })
      vim.api.nvim_set_keymap("i", "<C-[>", "copilot#Previous()", { silent = true, expr = true })
      vim.api.nvim_set_keymap("i", "<C-x>", "copilot#Dismiss()", { silent = true, expr = true })
    end,
  },
}
