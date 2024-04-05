
vim.wo.relativenumber = 1
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 12
vim.opt.incsearch = true

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args) 
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil
    end
});
