local lsp = require "configs.lspconfig"

return {
    on_attach = function (bufnr)
    vim.keymap.set("n", "<leader>ko", function()

    bufnr = vim.api.nvim_get_current_buf()
    local params = { uri = vim.uri_from_bufnr(bufnr) }

    vim.lsp.buf_request(
        bufnr,
        "textDocument/switchSourceHeader",
        params,
        function(err, result)
            if err then error(tostring(err)) end
            if not result then print ("Corresponding file can’t be determined") return end
            -- vim.notify("RESULT " .. tostring(result))
            vim.api.nvim_command('edit '..vim.uri_to_fname(result))
        end
    )

    lsp.on_attach(bufnr)
end, { buffer = bufnr })
    end,
    capabilities = lsp.capabilities,
    cmd = {
        "clangd --background-index --clang-tidy --completion-style=detailed --all-scopes-completion --header-insertion=never --header-insertion-decorators=0 -j=24",
        -- "--experimental-modules-support",
    },
    root_markers = { ".clangd", "compile_commands.json" },
    single_file_support = false,
    filetypes = { "c", "cpp", "cxx" },
}
