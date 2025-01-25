local keymap = vim.api.nvim_set_keymap

keymap("", "<leader>cg", ":CMakeGenerate<cr>", {})
keymap("", "<leader>cb", ":CMakeBuild<cr>", {})
keymap("", "<leader>cc", ":CMakeClean<cr>", {})
keymap("", "<leader>cq", ":CMakeClean<cr>", {})

keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
keymap("n", "<C-u>", "<C-u>zz", { noremap = true })
keymap("n", "<leader>ko", "<cmd>lua vim.cmd.ClangdSwitchSourceHeader()<CR>", {})

local map = vim.keymap.set

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
--
-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
    "n",
    "<leader>fa",
    "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    { desc = "telescope find all files" }
)

map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>")
map("n", "<leader>fS", "<cmd>Telescope lsp_dynamic_workspace symbols<CR>")
map("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<leader>th", "<cmd>Telescope colorscheme<CR>")

map("n", "<leader>z", "<cmd>ZenMode<CR>")

map("n", "<leader>fo", function()
    local state = require "state"()

    state.format_on_save = not state.format_on_save

    local ministate = "enabled"
    if state.format_on_save == false then
        ministate = "disabled"
    end

    vim.notify("Auto formatting " .. ministate, vim.log.levels.INFO, {
        title = "State",
    })
end)

map("n", "<leader>n", function()
    MiniFiles.open()
end)

local dap = require "dap"
local dapui = require "dapui"

map("n", "<leader>db", function()
    dap.toggle_breakpoint()
end)

map("n", "<leader>dc", function()
    dap.continue()
end)

map("n", "<leader>ds", function()
    dap.step_over()
end)

map("n", "<leader>di", function()
    dap.step_into()
end)

map("n", "<leader>de", function()
    dapui.eval()
end)

map("n", "<leader>do", function()
    dap.focus_frame()
end)

map("n", "<leader>du", function()
    dap.up()
end)

map("n", "<leader>dd", function()
    dap.down()
end)

map("n", "<leader>Ds", function()
    dapui.float_element("stacks", { enter = true, position = "center" })
end)

map("n", "<leader>Dc", function()
    dapui.float_element("scopes", { enter = true, position = "center" })
end)
