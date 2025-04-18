vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
    { import = "plugins" },
}, lazy_config)

-- load theme
require "init"

vim.g.mkdp_browser = { "/bin/firefox" }
vim.g.mkdp_auto_start = 1

vim.cmd [[
  highlight TelescopeSelection guibg=#44475a guifg=#ffffff
  highlight TelescopeSelectionCaret guifg=#ff79c6 guibg=#44475a
]]
