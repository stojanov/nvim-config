local lsp = require "configs.lspconfig"

return lsp.make_config({
    capabilities = lsp.capabilities,
    filetypes = { "haskell", "lhaskell", "cabal" },
})
