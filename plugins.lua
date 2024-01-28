local Plugins = {
    {
        "williamboman/mason.nvim",
        opts = require "custom.configs.mason"
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false
    },
    {
        "ThePrimeagen/vim-be-good",
        lazy = false
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = require "custom.configs.nvimtree"
    },
    {
        "neovim/nvim-lspconfig",
        config = function(_)
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end
    },
    {
        "mfussenegger/nvim-dap"
    },
    {
        "rcarriga/nvim-dap-ui",
        init = function()
            local dap, dapui = require('dap'). require('dapui')
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },
    {
        "stevearc/conform.nvim",
        event=  {"BufReadPre", "BufNewFile"},
        opts = require("custom.config.conform"),
    },
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        dependencies = "neovim/nvim-lspconfig",
        opts = require "custom.configs.rust-tools"
        config = function(_, opts)
            require('rust-tools').setup(opts)
        end
    },
    {
        "saecki/crates.nvim",
        ft = {"rust", "toml"},
        config = function(_, opts)
            local crates = require("crates")
            crates.setup(opts)
            crates.show()
        end
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function()
            local M = require "plugins.configs.cmp"
            table.insert(M.sources, {name = "crates"})
            return M
        end
    },
    {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    },
    {
        "ellisonleao/glow.nvim",
        opts = requrie("custom.configs.glow"),
        ft = "markdown",
        config = function(_, opts)
            require('glow').setup(opts)
        end,
    },
    {
        "pocco81/auto-save.nvim",
        lazy = false,
        opts = require('custom.configs.autosave'),
        config = function(_, opts)
            require('auto-save').setup(opts)
        end,
    },
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require('lsp_lines').setup()
        end,
        lazy = false
    }
}

return Plugins
