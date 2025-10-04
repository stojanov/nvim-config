local signcolumgroup = vim.api.nvim_create_augroup("GlobalSignColumn", { clear = true })
local lspgroup = vim.api.nvim_create_augroup('my.lsp', {})
local state = require "state"
local themes = require "theme_defaults"

vim.api.nvim_create_autocmd("BufEnter", {
    group = signcolumgroup,
    callback = function()
        vim.wo.signcolumn = "yes"
        vim.o.signcolumn = "yes"
    end,
})

vim.api.nvim_create_autocmd("WinEnter", {
    group = signcolumgroup,
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

vim.api.nvim_create_autocmd('LspAttach', {
    group = lspgroup,
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    vim.notify("CALLED ON")
    vim.notify("called " .. client)
  end,
})
