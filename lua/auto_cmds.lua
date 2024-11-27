local group = vim.api.nvim_create_augroup("GlobalSignColumn", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
    group = group,
    callback = function()
        vim.wo.signcolumn = "yes"
    end,
})
