local lsp = require "configs.lspconfig"
local state = require "state"

return {
    on_attach = function(client, bufnr)
        -- maybe not the best place for this
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                if state().format_on_save then
                    vim.lsp.buf.format { async = true }
                end
            end,
        })

        lsp.on_attach(client, bufnr)
    end,
    capabilities = lsp.capabilities,

    settings = {
        ["rust_analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true,
            },
            checkOnSave = {
                allFeatures = true,
                command = "clippy",
                extraArgs = {
                    "--",
                    "--no-deps",
                    "-Dclippy::correctness",
                    "-Dclippy::complexity",
                    "-Wclippy::perf",
                    "-Wclippy::pedantic",
                },
            },
        },
    },
}
