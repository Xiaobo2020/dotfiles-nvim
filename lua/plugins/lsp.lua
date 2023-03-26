local status, mason = pcall(require, "mason")
if (not status) then return end

local status2, masonlspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true,
  ensure_installed = {
    "lua_ls",
  },
})

