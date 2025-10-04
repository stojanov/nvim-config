local lsp = require "configs.lspconfig"

return lsp.make_config({
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
})
