return {
  -- :copilot setup
  -- :help copilot
  {
    "github/copilot.vim",
    config = function()
      -- lua
      vim.g.copilot_node_command = "~/.local/share/nvm/v16.14.0/bin/node"

      vim.g.copilot_no_tab_map = true
      vim.g.copilot_filetypes = {
        ["*"] = false,
        ["css"] = true,
        ["scss"] = true,
        ["html"] = true,
        ["javascript"] = true,
        ["javascriptreact"] = true,
        ["jsx"] = true,
        ["typescript"] = true,
        ["typescriptreact"] = true,
        ["tsx"] = true,
        ["lua"] = true,
        ["md"] = true,
      }
      vim.api.nvim_set_keymap("i", "<C-g>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
      vim.api.nvim_set_keymap("i", "<C-]>", "copilot#Next()", { silent = true, expr = true })
      vim.api.nvim_set_keymap("i", "<C-[>", "copilot#Previous()", { silent = true, expr = true })
      vim.api.nvim_set_keymap("i", "<C-x>", "copilot#Dismiss()", { silent = true, expr = true })
    end,
  },
}
