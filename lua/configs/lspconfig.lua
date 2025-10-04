local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local map = vim.keymap.set
local state = require "state"

local function on_attach(_, bufnr)
    local function opts(desc)
        return { buffer = bufnr, desc = "LSP " .. desc }
    end

    map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
    map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
    map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
    map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

    -- map("n", "<leader>wl", function()
    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts "List workspace folders")

    map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")

    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
    map("n", "gr", vim.lsp.buf.references, opts "Show references")

    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

lspconfig.clangd.setup {
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--all-scopes-completion",
        -- "--experimental-modules-support",
        "--header-insertion=never",
        "--header-insertion-decorators=0",
        "-j=32",
    },
    root_markers = { ".clangd", "compile_commands.json" },
    single_file_support = false,
    root_dir = function(fname)
        return require("lspconfig.util").root_pattern(".clangd", "compile_commands.json", "compile_flags.txt")(fname)
            or vim.fn.getcwd()
    end,
    filetypes = { "c", "cpp", "cxx" },
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
                unusedparams = true,
            },
        },
    },
}

lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.hls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "haskell", "lhaskell", "cabal" },
}

lspconfig.elixirls.setup {
    cmd = { "/usr/lib/elixir-ls/language_server.sh" },
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.rust_analyzer.setup {
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                if state().format_on_save then
                    vim.lsp.buf.format { async = true }
                end
            end,
        })

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

lspconfig.bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.neocmake.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                },
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file("", true)
            },
        })
    end,
    settings = {
        Lua = {},
    },
}

lspconfig.ts_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
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
