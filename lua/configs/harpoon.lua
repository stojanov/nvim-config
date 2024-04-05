local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

vim.keymap.set("n", "<C-8>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-9>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-0>", function() harpoon:list():select(3) end)
