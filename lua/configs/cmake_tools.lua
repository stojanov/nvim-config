require("cmake-tools").setup {
    cmake_dap_configuration = { -- debug settings for cmake
        name = "cpp",
        type = "gdb",
        request = "launch",
        stopOnEntry = false,
        runInTerminal = true,
        console = "integratedTerminal",
    },
}
