local M = {}

M.general = {
    n = {
        ["<leader>I"] = {
            "<cmd> Lazy sync <CR>",
            "Update plugins"
        },
        ["<C-h"] = {
            "<cmd> TmuxNavigateLeft <CR>",
            "Window Left"
        },
        ["<C-j"] = {
            "<cmd> TmuxNavigateDown <CR>",
            "Window Down"
        },
        ["<C-k"] = {
            "<cmd> TmuxNavigateUp <CR>",
            "Window Up"
        },
        ["<C-l"] = {
            "<cmd> TmuxNavigateRight <CR>",
            "Window Right"
        },
    }
}

M.dap = {
    n = {
        ["<leader>db"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Toggle Breakpoint"
        },
        ["<leader>dr"] = {
            "<cmd> RustDebuggables <CR>",
            "Start debugger"
        },
        ["<leader>dn"] = {
            "<cmd> DapStepOver <CR>",
            "Debugger Step Over"
        },
        ["<leader>dt"] = {
            "<cmd> DapTerminate <CR>",
            "Debugger Stop"
        },
        ["<leader>dsi"] = {
            "<cmd> DapStepIn <CR>",
            "Debugger Step In"
        },
        ["<leader>dso"] = {
            "<cmd> DapStepOut <CR>",
            "Debbuger Step Out"
        },
            -- ["<leader>dus"] = {
            --     function()
            --         local widgets = require('dap.ui.widgets');
            --         local sidebar = widgets.sidebar(widgets.scopes);
            --         sidebar.open();
            --     end,
            --     "Open Debugging Sidebar"
            -- }
    }
}

M.rust = {
    n = {
        ["<leader>rcu"] = {
            function()
                require("crates").upgrade_all_crates()
            end,
            "Update all crates"
        },
        ["<leader>k"] = {
            function()
                local rt = require('rust-tools')
                rt.hover_actions.hover_actions()
            end,
            "Run/Debug/Info"
        },
        ["<leader>a"] = {
            function()
                local rt = require('rust-tools')
                rt.code_action_group.code_action_group()
            end,
            "Refactor/Actions"
        }
    }
}

M.telescope = {
    n = {
        ["<leader>fs"] = {
            function()
                require("telescope").extensions.live_grep_args.live_grep_args()
            end,
            "Live Grep Args"
        }
    }
}

M.nvimtree = {
    n = {
        ["<leader>gs"] = {
            require('custom.mapping_functions').git_stage,
            "Git stage"
        },
        ["<leader>gus"] = {
            require('custom.mapping_functions').git_unstage,
            "Git unstage"
        }
    }
}

M.glow = {
    n = {
        ["<leader>md"] = {
            require('custom.mapping_functions').preview_md,
            "Preview Markdown File"
        }
    }
}

M.conform = {
    n = {
        ["<leader>fr"] = {
            require('custom.mapping_functions').format_pretty,
            "Format Range"
        }
    }
}
return M
