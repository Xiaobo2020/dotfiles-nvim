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

