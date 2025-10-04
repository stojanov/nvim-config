local group = vim.api.nvim_create_augroup("GlobalSignColumn", { clear = true })
local state = require "state"
local themes = require "theme_defaults"

vim.api.nvim_create_autocmd("BufEnter", {
    group = group,
    callback = function()
        vim.wo.signcolumn = "yes"
        vim.o.signcolumn = "yes"
    end,
})

vim.api.nvim_create_autocmd("WinEnter", {
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

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        themes.apply_telescope_highlight()
    end,
})
