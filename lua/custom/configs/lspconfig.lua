local base_config = require("plugins.configs.lspconfig")
local on_attach = base_config.on_attach
local capabilities = base_config.capabilities

local lspconfig = require("lspconfig")

-- C & C++ lspconfig
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
