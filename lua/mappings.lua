require "nvchad.mappings"

local keymap = vim.api.nvim_set_keymap

keymap('', '<leader>cg', ':CMakeGenerate<cr>', {})
keymap('', '<leader>cb', ':CMakeBuild<cr>', {})
keymap('', '<leader>cc', ':CMakeClean<cr>', {})
keymap('', '<leader>cq', ':CMakeClean<cr>', {})

keymap('n', '<C-d>', '<C-d>zz', { noremap = true })
keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
keymap('', '<leader>ko', '<cmd>lua vim.cmd.ClangdSwitchSourceHeader()<CR>', {})
