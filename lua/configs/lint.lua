local lint = require "lint"

lint.linters_by_ft = {
    markdown = { "vale" },
    json = { "jsonlint" },
    yaml = { "actionlint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        lint.try_lint()
    end,
})
