local G = require("G")
local M = {}

M.config = function()
end

M.setup = function()
  local null_ls = require("null-ls")
  local formatting = null_ls.builtins.formatting -- to setup formatters
  local diagnostics = null_ls.builtins.diagnostics -- to setup linters

  local augroup = G.api.nvim_create_augroup("LspFormatting", {})
  local lsp_formatting = function(bufnr)
    G.lsp.buf.format({
      filter = function(client)
        return client.name == "null-ls"
      end,
      bufnr = bufnr,
    })
  end

  null_ls.setup({
    -- setup formatters & linters
    sources = {
      formatting.stylua, -- lua formatter
      diagnostics.fish,
    },
    -- configure format on save
    on_attach = function(current_client, bufnr)
      if current_client.supports_method("textDocument/formatting") then
        G.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        G.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            lsp_formatting(bufnr)
          end,
        })
      end
    end,
  })

  G.api.nvim_create_user_command("DisableLspFormatting", function()
    G.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end, { nargs = 0 })

end

return M