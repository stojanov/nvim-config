
local base = require("nvchad.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities
local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.clangd.setup {
    on_attach = function(client, bufnr)
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        on_attach(client, bufnr)
    end,
    capabilities = capabilities
}

lspconfig.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            analyses = {
                unusedparams = true
            }
        }
    }
}

lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.rust_analyzer.setup {
    on_attach = function(client, bufnr)
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })    
        on_attach(client, bufnr)
    end,
    capabilities = capabilities,

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
                enable = true
            },
            checkOnSave = false
        }
    }
}

-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(args)
--         local bufnr = args.buf
--
--         require("lsp_signature").on_attach({
--             bind = true
--         }, bufnr)
--     end
-- })
