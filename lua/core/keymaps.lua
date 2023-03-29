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
keymap.set("n", "<C-a>", "gg<S-v>G")

-- 插件 --
-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
-- <Tab> 展开文件内容，注意光标还是在tree中
-- <Return> 展开文件夹或打开文件，注意关闭tree并光标移动到文件中

-- Move window
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-l>", "<C-w>l")
-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

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

-- Keymaps in lspconfig.lua
-- -- Floating terminal
-- keymap.set("n", "<leader>tt", "<Cmd>Lspsaga term_toggle<CR>", opts)

-- -- Jump to previous diganostic in buffer
-- keymap.set("n", "<leader>jp", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

-- -- Jump to next diganostic in buffer
-- keymap.set("n", "<leader>jn", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)

-- -- Show diagnostic in current line
-- keymap.set("n", "<leader>l", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)

-- -- Show hover doc
-- keymap.set("n", "<leader>h", "<Cmd>Lspsaga hover_doc<CR>", opts)

-- -- Show code action
-- keymap.set("n", "<leader>ca", "<Cmd>Lspsaga code_action<CR>", opts)

-- -- Show outline on the right hand side
-- keymap.set("n", "<leader>ol", "<Cmd>Lspsaga outline<CR>", opts)

-- -- Go to definition
-- keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)

-- -- Go to type definition
-- keymap.set("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")

-- -- Peek definition
-- keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)

-- -- Rename variable
-- keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)

-- -- Show definitions & implements & references
-- keymap.set("n", "gf", "<Cmd>Lspsaga lsp_finder<CR>", opts)

-- -- Typescript - Rename file and update imports
-- keymap.set("n", "<leader>rf", "<Cmd>TypescriptRenameFile<CR>")

-- -- Typescript - Organize imports
-- keymap.set("n", "<leader>oi", "<Cmd>TypescriptOrganizeImports<CR>")

-- -- Typescript - Remove unused variables
-- keymap.set("n", "<leader>ru", "<Cmd>TypescriptRemoveUnused<CR>")

-- Markdown previewe
keymap.set("n", "<leader>mp", "<Cmd>MarkdownPreview<CR>") -- Start markdown preview
keymap.set("n", "<leader>ms", "<Cmd>MarkdownPreviewStop<CR>") -- Stop markdown preview
