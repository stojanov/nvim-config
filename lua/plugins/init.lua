return {
    {
        "nvim-tree/nvim-web-devicons",
    },
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "stevearc/overseer.nvim",
        opts = {},
        lazy = false,
        config = true,
    },
    {
        "stevearc/conform.nvim",
        event = "VeryLazy", -- uncomment for format on save
        opts = function()
            require "configs.conform"
        end,
    },
    {
        "nvim-neotest/nvim-nio",
    },
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        config = function()
            require "configs.lspconfig"
        end,
        dependencies = { "saghen/blink.cmp" },
    },
    {
        "echasnovski/mini.files",
        version = false,
        lazy = false,
        opts = {},
    },
    {
        "echasnovski/mini.cursorword",
        version = false,
        lazy = false,
        opts = {
            delay = 350,
        },
    },
    {
        "stojanov/perstore",
        lazy = false,
        opts = {},
        dependencies = { "nvim-neotest/nvim-nio" },
    },
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        opts = function()
            vim.notify = require "notify"

            return {
                timeout = 1000,
            }
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        cmd = "Telescope",
        opts = function()
            return require "configs.telescope"
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = "ibl",
        opts = {},
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = function()
            require("gitsigns").setup {
                signcolumn = true,
            }
        end,
    },
    {
        "nvim-focus/focus.nvim",
        version = "*",
        event = "VeryLazy",
        opts = function()
            require("focus").setup()
        end,
    },
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        opts = function()
            return {
                window = {
                    width = 0.7,
                },
            }
        end,
    },
    {
        "smjonas/inc-rename.nvim",
        event = "VeryLazy",
        config = function()
            require "configs.increname"
        end,
    },
    {
        "mfussenegger/nvim-lint",
        event = "VeryLazy",
        config = function()
            require "configs.lint"
        end,
    },
    { "rafamadriz/friendly-snippets" },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    {
        "nvim-telescope/telescope-frecency.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
        version = "^0.9.0",
        config = function()
            require("telescope").load_extension "frecency"
        end,
    },
    {
        "saghen/blink.cmp",
        dependencies = "rafamadriz/friendly-snippets",

        version = "1.*",

        opts = {
            keymap = { preset = "enter" },

            completion = {
                accept = {
                    auto_brackets = {
                        enabled = true,
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 20,
                    update_delay_ms = 50,
                },

                ghost_text = {
                    enabled = false,
                },
                list = {
                    selection = {
                        preselect = function(ctx)
                            return ctx.mode ~= "cmdline"
                        end,
                        auto_insert = function(ctx)
                            return ctx.mode ~= "cmdline"
                        end,
                    },
                },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },

            signature = {
                enabled = true,
            },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
        },
        opts_extend = { "sources.default" },
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            require "configs.dapui"
        end,
    },
    {
        "jvgrootveld/telescope-zoxide",
        event = "VeryLazy",
        config = function()
            require "configs.zoxide"
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "milliamboman/mason.nvim",
            "mfussenergger/nvim-dap",
        },
        opts = {
            handlers = {},
        },
    },
    {
        "mfussenegger/nvim-dap",
        config = function(_, _)
            require "configs.dap"
            -- require("core.utils").load_mappings("dap")
        end,
    },
    {
        "Civitasv/cmake-tools.nvim",
        enabled = true,
        lazy = false,
        dependencies = {
            "stevearc/overseer.nvim",
        },
        config = function()
            require "configs.cmake_tools"
        end,
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = false,
        config = function()
            require "configs.harpoon"
        end,
    },
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        opts = function()
            return require "configs.mason"
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        opts = function()
            return require "configs.nvimtree"
        end,
    },
    -- {
    --   'mrcjkb/rustaceanvim',
    --   version = '^4', -- Recommended
    --   ft = { 'rust' },
    --   lazy = false
    -- },
    -- {
    --     "ray-x/lsp_signature.nvim",
    --     event = "VeryLazy",
    --     opts = {},
    --     config = function(_, opts)
    --         require("lsp_signature").setup(opts)
    --     end,
    -- },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        init = function()
            vim.g.mkdp_browser = { "/bin/firefox" }
        end,
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "VeryLazy",
        config = function(_, opts)
            require("treesitter-context").setup()
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        opts = function()
            return require "configs.treesitter"
        end,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "Civitasv/cmake-tools.nvim",
            "nvim-tree/nvim-web-devicons",
            "arkav/lualine-lsp-progress",
        },
        event = "VeryLazy",
        config = function(_, opts)
            local config = require "configs.lualine"

            require("lualine").setup(config)
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        opts = function()
            require "configs.trouble"
        end,
        keys = require "configs.trouble_mappings",
    },
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
    },
    {
        "arkav/lualine-lsp-progress",
    },
    -- themes
    {
        "killitar/obscure.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "rebelot/kanagawa.nvim",
    },
    {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        priority = 1000,
        config = true,
    },
    {
        "sainnhe/sonokai",
        lazy = false,
        priority = 1000,
    },
    { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
    {
        "nyoom-engineering/oxocarbon.nvim",
    },
    {
        "vague2k/vague.nvim",
        config = true,
    },
    {
        "cdmill/neomodern.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("neomodern").setup {}
            require("neomodern").load()
        end,
    },
    {
        "mellow-theme/mellow.nvim",
        lazy = false,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile = { enabled = true },
            dashboard = { enabled = false },
            explorer = { enabled = false },
            indent = { enabled = false },
            input = { enabled = true },
            picker = { enabled = false },
            notifier = { enabled = false },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = false },
            statuscolumn = { enabled = false },
            words = { enabled = true },
            zen = { enabled = false },
        },
    },
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
    },
}
