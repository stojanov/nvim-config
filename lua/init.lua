
vim.wo.relativenumber = true
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 12
vim.opt.incsearch = true
vim.opt.wrap = false

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args) 
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        --client.server_capabilities.semanticTokensProvider = nil
    end
});

require'nvim-treesitter.configs'.setup {
  indent = {
    enable = false
  }
}



