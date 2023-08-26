local map = require("util/utils").map

-- select all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all", silent = true, noremap = true })

-- ESC
map("i", "jk", "<ESC>", { desc = "ESC", silent = true, noremap = true })

-- LSP Finder
map("n", "gh", "<cmd>Lspsaga finder def+ref<CR>", { desc = "LSP Finder", silent = true, noremap = true })

-- Tmux Navigator
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Navigate Left", silent = true, noremap = true })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Navigate Right", silent = true, noremap = true })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Navigate Down", silent = true, noremap = true })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Navigate Up", silent = true, noremap = true })
map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "Navigate Previous", silent = true, noremap = true })
