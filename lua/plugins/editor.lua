local Util = require("lazyvim.util")

return {
  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      local keymaps = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gz"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
        ["<leader>m"] = { name = "+markdown" },
      }
      if Util.has("noice.nvim") then
        keymaps["<leader>sn"] = { name = "+noice" }
      end
      wk.register(keymaps)
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    dependencies = {
      {
        "mzlogin/vim-markdown-toc",
        ft = "markdown",
      },
    },
    build = "cd app && npm install",
    cmd = "MarkdownPreview",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.vmt_fence_text = "markdown-toc"
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { silent = true, noremap = true, desc = desc })
      end

      map("n", "<leader>mp", "<Cmd>MarkdownPreview<CR>", "MarkdownPreview start")
      map("n", "<leader>ms", "<Cmd>MarkdownPreviewStop<CR>", "MarkdownPreview stop")

      map("n", "<leader>mth", "<Cmd>GenTocGFM<CR>", "Generate toc in GitHub")
      map("n", "<leader>mtl", "<Cmd>GenTocGitLab<CR>", "Generate toc in GitLab")
      map("n", "<leader>mtm", "<Cmd>GenTocMarked<CR>", "Generate toc in Markded")
    end,
    ft = "markdown",
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "      <author>, <author_time:%Y-%m-%d> - <summary>",
    },
  },
}
