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
        "hrsh7th/nvim-cmp",
        event = "VeryLazy",
        dependencies = {
            {
                -- snippet plugin
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                opts = { history = true, updateevents = "TextChanged,TextChangedI" },
                config = function(_, opts)
                    require("luasnip").config.set_config(opts)
                    require "configs.luasnip"
                end,
            },
            {
                "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                    disable_filetype = { "TelescopePrompt", "vim" },
                },
                config = function(_, opts)
                    require("nvim-autopairs").setup(opts)

                    -- setup cmp for autopairs
                    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            },
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",
            },
        },
        opts = function()
            return require "configs.cmp"
        end,
    },
    {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
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
    {
        "Civitasv/cmake-tools.nvim",
        enabled = true,
        lazy = false,
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
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts)
            require("lsp_signature").setup(opts)
        end,
    },
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
        },
        event = "VeryLazy",
        config = function(_, opts)
            require("lualine").setup()
        end,
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
        "folke/trouble.nvim",
        cmd = "Trouble",
        opts = function()
            require "configs.trouble"
        end,
        keys = require "configs.trouble_mappings",
    },
}
