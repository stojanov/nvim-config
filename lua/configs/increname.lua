require("inc_rename").setup();

vim.keymap.set("n", "<leader>ra", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
