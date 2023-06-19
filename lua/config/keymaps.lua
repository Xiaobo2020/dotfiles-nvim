-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- select all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all", silent = true, noremap = true })

-- ESC
map("i", "jk", "<ESC>", { desc = "ESC", silent = true, noremap = true })

-- LSP Finder
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { desc = "LSP Finder", silent = true, noremap = true })
