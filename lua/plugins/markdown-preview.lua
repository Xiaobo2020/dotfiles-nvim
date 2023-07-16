local function map(mode, l, r, desc)
  vim.keymap.set(mode, l, r, { silent = true, noremap = true, desc = desc })
end

return {
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
      vim.g.mkdp_browser = "Google Chrome"
      vim.g.mkdp_markdown_css = "~/.config/nvim/colors/markdown.css"
      vim.g.mkdp_page_title = "${name}"
      vim.g.mkdp_preview_options = { hide_yaml_meta = 1, disable_filename = 1 }
      vim.g.vmt_fence_text = "markdown-toc"
      -- vim.g.mkdp_theme = 'dark'

      map("n", "<leader>mp", "<Cmd>MarkdownPreview<CR>", "MarkdownPreview start")
      map("n", "<leader>ms", "<Cmd>MarkdownPreviewStop<CR>", "MarkdownPreview stop")

      map("n", "<leader>mth", "<Cmd>GenTocGFM<CR>", "Generate toc in GitHub")
      map("n", "<leader>mtl", "<Cmd>GenTocGitLab<CR>", "Generate toc in GitLab")
      map("n", "<leader>mtm", "<Cmd>GenTocMarked<CR>", "Generate toc in Markded")
    end,
    ft = "markdown",
  },
}
