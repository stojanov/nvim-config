
local zoxide = require('telescope').extensions.zoxide;

vim.keymap.set("n", "<leader>cd", zoxide.list)
