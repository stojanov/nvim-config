local state = {
    format_on_save = true,
    current_colorscheme = "obscure",
}

local perstore = require "perstore"

return perstore.add_store {
    name = "state",
    on_loaded = function(got_state)
        vim.cmd("colorscheme " .. got_state.current_colorscheme)

        local format_state = "enabled"

        if not got_state.format_on_save then
            format_state = "disabled"
        end

        vim.notify("Autoformatting " .. format_state)
    end,
    load_on_close = true,
    save_on_close = true,
    data_ref = state,
}
