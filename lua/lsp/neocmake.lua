local lsp = require "configs.lspconfig"

return {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
}
