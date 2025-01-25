return {
    {
        "nvim-tree/nvim-web-devicons",
    },
    {
        "nvim-lua/plenary.nvim",
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
    { "rafamadriz/friendly-snippets" },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    {
        "saghen/blink.cmp",
        dependencies = "rafamadriz/friendly-snippets",

        version = "v0.*",

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
                    auto_show_delay_ms = 0,
                    update_delay_ms = 0,
                },

                ghost_text = {
                    enabled = false,
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
                cmdline = {},
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
            -- require("core.utils").load_mappings("dap")
        end,
    },
    -- {
    --     "Civitasv/cmake-tools.nvim",
    --     enabled = true,
    --     lazy = false,
    -- },
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
            "nvim-tree/nvim-web-devicons",
            "arkav/lualine-lsp-progress",
        },
        event = "VeryLazy",
        config = function(_, opts)
            require("lualine").setup {
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "filename" },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "lsp_progress" },
                    lualine_z = { "location" },
                },
            }
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
        "arkav/lualine-lsp-progress",
    },
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
}
