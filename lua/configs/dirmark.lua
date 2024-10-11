
vim.api.nvim_set_keymap('n', '<leader>ma', '<cmd>lua require("dirmark").mark_cwd()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>mo', '<cmd>lua require("dirmark").open()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>mf', '<cmd>lua require("dirmark").open_marks_file()<cr>', { noremap = true, silent = true })
