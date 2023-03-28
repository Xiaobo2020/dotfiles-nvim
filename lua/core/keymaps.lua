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

-- 全选
keymap.set("n", "<c-a>", "gg<S-v>G")

-- 插件 --
-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
-- <Tab> 展开文件内容，注意光标还是在tree中
-- <Return> 展开文件夹或打开文件，注意关闭tree并光标移动到文件中

-- vim-tmux-navigator --
-- <C-h> - 左移
-- <C-j> - 下移
-- <C-k> - 上移
-- <C-l> - 右移
-- Move window
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-l>", "<C-w>l")

-- bufferline配置的Tab
keymap.set("n", "<leader>te", "<Cmd>tabedit<CR>")
keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})

-- Git
keymap.set("n", "<leader>do", "<Cmd>DiffviewOpen<CR>") -- open
keymap.set("n", "<leader>dc", "<Cmd>DiffviewClose<CR>") -- close
keymap.set("n", "<leader>dh", "<Cmd>DiffviewFileHistory %<CR>") -- current file
keymap.set("n", "<leader>db", "<Cmd>DiffviewFileHistory<CR>") -- current branch

-- Telescope
local builtin = require("telescope.builtin")
local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end
keymap.set("n", "<leader>ff", function()
	builtin.find_files({
		no_ignore = false,
		hidden = true,
	})
end, {})
keymap.set("n", "<leader>fg", builtin.live_grep, {})
keymap.set("n", "<leader>fb", builtin.buffers, {})
keymap.set("n", "<leader>fh", builtin.help_tags, {})
keymap.set("n", "<leader>fd", function()
	require("telescope").extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 40 },
	})
end)

-- -- Lspsaga --
-- local opts = { noremap = true, silent = true }
-- keymap.set("n", "[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
-- keymap.set("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
-- keymap.set("n", "<leader>k", "<Cmd>Lspsaga hover_doc<CR>", opts)
-- keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
-- -- <C-c> - quit rename
-- -- <CR> - exec rename
-- -- <CR> - confirm rename
-- keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)
-- keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)

-- Markdown previewe
keymap.set("n", "<leader>mp", "<Cmd>MarkdownPreview<CR>") -- Start markdown preview
keymap.set("n", "<leader>ms", "<Cmd>MarkdownPreviewStop<CR>") -- Stop markdown preview
