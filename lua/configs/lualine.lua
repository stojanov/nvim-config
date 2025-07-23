local trouble = require "trouble"
local cmake = require "cmake-tools"

local symbols = trouble.statusline {
    mode = "lsp_document_symbols",
    groups = {},
    title = false,
    filter = { range = true },
    format = "{kind_icon}{symbol.name:Normal}",
    -- The following line is needed to fix the background color
    -- Set it to the lualine section you want to use
    hl_group = "lualine_c_normal",
}

local trouble_line = {
    symbols.get,
    cond = symbols.has,
}

local cmake_presets = {
    function()
        local c_preset = cmake.get_configure_preset()
        return "CMake: [" .. (c_preset and c_preset or "X") .. "]"
    end,
    -- icon = icons.ui.Search,
    cond = function()
        return cmake.is_cmake_project() and cmake.has_cmake_preset()
    end,
    on_click = function(n, mouse)
        if n == 1 then
            if mouse == "l" then
                vim.cmd "CMakeSelectConfigurePreset"
            end
        end
    end,
}

local cmake_build_type = {
    function()
        local type = cmake.get_build_type()
        return "CMake: [" .. (type and type or "") .. "]"
    end,
    -- icon = icons.ui.Search,
    cond = function()
        return cmake.is_cmake_project() and not cmake.has_cmake_preset()
    end,
    on_click = function(n, mouse)
        if n == 1 then
            if mouse == "l" then
                vim.cmd "CMakeSelectBuildType"
            end
        end
    end,
}

local cmake_target = {
    function()
        local b_target = cmake.get_build_target()
        return "[" .. (b_target and b_target or "X") .. "]"
    end,
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
        if n == 1 then
            if mouse == "l" then
                vim.cmd "CMakeSelectBuildTarget"
            end
        end
    end,
}

return {
    winbar = {
        lualine_b = {
            {
                "filename",
                path = 1,
            },
            -- not using this but a cool addon
        },
        lualine_a = {},
        lualine_c = {
            -- trouble_line,
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    inactive_winbar = {
        lualine_b = {
            {
                "filename",
                path = 1,
            },
        },
        lualine_a = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { cmake_presets, cmake_build_type, cmake_target, "encoding", "fileformat", "filetype" },
        lualine_y = { "lsp_progress" },
        lualine_z = { "location" },
    },
}
