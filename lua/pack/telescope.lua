local G = require("G")
local M = {}

M.config = function() end

M.setup = function()
	local telescope = require("telescope")
	local fb_actions = telescope.extensions.file_browser.actions
	local actions = require("telescope.actions")
	local builtin = require("telescope.builtin")
	local keymap = G.keymap
	local function telescope_buffer_dir()
		return G.fn.expand("%:p:h")
	end

	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-u"] = actions.preview_scrolling_up,
					["<C-d"] = actions.preview_scrolling_down,
				},
				n = {
					["q"] = actions.close,
				},
			},
		},
		extensions = {
			file_browser = {
				theme = "dropdown",
				-- disables netrw and use telescope-file-browser in its place
				hijack_netrw = true,
				mappings = {
					-- your custom insert mode mappings
					["i"] = {
						["<C-w>"] = function()
							G.cmd("normal vbd")
						end,
					},
					["n"] = {
						-- your custom normal mode mappings
						["a"] = fb_actions.create, -- same with create in Nvimtree
						["h"] = fb_actions.goto_parent_dir,
						["/"] = function()
							G.cmd("startinsert")
						end,
					},
				},
			},
		},
	})

	telescope.load_extension("file_browser")

	-- Keymaps
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
end

return M
