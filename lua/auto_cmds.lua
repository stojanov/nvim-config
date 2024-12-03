local group = vim.api.nvim_create_augroup("GlobalSignColumn", { clear = true })
local state = require "state"

vim.api.nvim_create_autocmd("BufEnter", {
    group = group,
    callback = function()
        vim.wo.signcolumn = "yes"
    end,
})

vim.api.nvim_create_autocmd("ColorSchemePre", {
    callback = function(args)
        local s = state()

        if s then
            s.current_colorscheme = args.match
        end
    end,
})
