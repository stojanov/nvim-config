local M = {}

M.apply_telescope_highlight = function()
    vim.cmd "highlight TelescopeSelection guibg=#44475a guifg=#ffffff"
    vim.cmd "highlight TelescopeSelectionCaret guifg=#ff79c6 guibg=#44475a"
end

M.change_theme = function(theme)
    vim.cmd("colorscheme " .. theme)
end

return M
