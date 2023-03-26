-- 主键
vim.g.mapleader = " "

local keymap = vim.keymap

-- Insert mode --
keymap.set("i", "jk", "<ESC>")

-- Visual mode --
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Normal mode
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平分屏
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直分屏

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 插件 --
-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
-- <Tab> 展开文件内容，注意光标还是在tree中
-- <Return> 展开文件夹或打开文件，注意关闭tree并光标移动到文件中

-- vim-tmux-navigator --
-- <C-h/j/k/l> 在上下左右分屏间切换光标,包括Nvim-tree

-- comment
-- gcc单行注释,gc多行注释


