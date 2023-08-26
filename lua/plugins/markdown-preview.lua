local map = require("util.utils").map

return {
  {
    "iamcco/markdown-preview.nvim",
    dependencies = {
      {
        "mzlogin/vim-markdown-toc",
        ft = "markdown",
      },
    },

    -- build = "cd app && npm install",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    cmd = "MarkdownPreview",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_browser = "Google Chrome"
      vim.g.mkdp_markdown_css = "~/.config/nvim/colors/markdown.css"
      vim.g.mkdp_page_title = "${name}"
      vim.g.mkdp_preview_options = { hide_yaml_meta = 1, disable_filename = 1 }
      vim.g.vmt_fence_text = "markdown-toc"
      -- vim.g.mkdp_theme = 'dark'

      map(
        "n",
        "<leader>mp",
        "<Cmd>MarkdownPreview<CR>",
        { desc = "MarkdownPreview start", silent = true, noremap = true }
      )
      map(
        "n",
        "<leader>ms",
        "<Cmd>MarkdownPreviewStop<CR>",
        { desc = "MarkdownPreview stop", silent = true, noremap = true }
      )
      map("n", "<leader>mth", "<Cmd>GenTocGFM<CR>", { desc = "Generate toc in GitHub", silent = true, noremap = true })
      map(
        "n",
        "<leader>mtl",
        "<Cmd>GenTocGitLab<CR>",
        { desc = "Generate toc in GitLab", silent = true, noremap = true }
      )
      map(
        "n",
        "<leader>mtm",
        "<Cmd>GenTocMarked<CR>",
        { desc = "Generate toc in Markded", silent = true, noremap = true }
      )
    end,
    ft = "markdown",
  },
}
