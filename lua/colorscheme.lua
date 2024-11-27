local themefile = vim.fn.stdpath "config" .. "/selected-color-scheme"
local state = require "state"

-- very simple for now in the future if i extend this i should probably add storing of the whole state
local colorscheme = {
    save = function(name)
        local file = io.open(themefile, "w")

        if file then
            file:write(name)
            file:close()
            return true
        else
            return false
        end
    end,

    load = function()
        local file = io.open(themefile, "r")

        if file then
            local read = file:read "*all"
            file:close()

            read = vim.trim(read)

            return read
        else
            return ""
        end
    end,
}

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function(args)
        state.current_colorscheme = args.match
    end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        if not colorscheme.save(state.current_colorscheme) then
            vim.notify "Cannot save colorscheme"
        end
    end,
})

local loaded_colorscheme = colorscheme.load()

if loaded_colorscheme ~= "" then
    state.current_colorscheme = loaded_colorscheme
end

vim.cmd("colorscheme " .. state.current_colorscheme)
