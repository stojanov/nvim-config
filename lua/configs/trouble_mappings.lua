local M = {
    {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
    },
    {
        "<leader>xf",
        "<cmd>Trouble diagnostics toggle filter=buf=0<cr>"
    },
    {
        "<leader>xs",
        "<cmd>Trouble symbols toggle focus=true pinned=true win.relative=win win.position=left<cr>"
    }
}

return M;
