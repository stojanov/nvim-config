local conform = require "conform"

local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        cpp = { "clang_format" },
        go = { "goimports", "gofmt" },
        python = { "black" },
        cmake = { "cmake_format" },
        haskell = { "fourmolu" },
        elixir = { "mix" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        rust = { "rustfmt" },
    },

    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },

    notify_on_error = true,
    notify_no_formatters = true,
}

conform.setup(options)

local state = require "state"

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        if state().format_on_save then
            conform.format { bufnr = args.buf }
        end
    end,
})
