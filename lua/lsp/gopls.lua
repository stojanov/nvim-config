local lsp = require "configs.lspconfig"

return {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    -- root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            analyses = {
                unusedparams = true,
            },
        },
    },
}
