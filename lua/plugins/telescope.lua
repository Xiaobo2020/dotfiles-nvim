local status, telescope = pcall(require, "telescope")
if (not status) then return end

local actions = require('telescope.actions')

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-u"] = actions.preview_scrolling_up,
        ["<C-d"] = actions.preview_scrolling_down,
      },
      n = {
        ["q"] = actions.close
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
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["a"] = fb_actions.create, -- same with create in Nvimtree 
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
})

telescope.load_extension("file_browser")

