local M = {}

M.general = {
    n = {
        ["<leader>I"] = {
            "<cmd> Lazy sync <CR>",
            "Update plugins"
        },
        ["<C-h>"] = {
            "<cmd> TmuxNavigateLeft <CR>",
            "Window Left"
        },
        ["<C-j>"] = {
            "<cmd> TmuxNavigateDown <CR>",
            "Window Down"
        },
        ["<C-k>"] = {
            "<cmd> TmuxNavigateUp <CR>",
            "Window Up"
        },
        ["<C-l>"] = {
            "<cmd> TmuxNavigateRight <CR>",
            "Window Right"
        },
    }
}

M.dap = {
    -- plugin = true,
    n = {
        ["<leader>db"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Toggle Breakpoint"
        },
        -- ["<leader>dr"] = {
        --     "<cmd> RustDebuggables <CR>",
        --     "Start debugger"
        -- },
        ["<leader>dr"] = {
            "<cmd> DapContinue <CR>",
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
            "Debugger Step Out"
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
        -- ["<leader>k"] = {
        --     function()
        --         local rt = require('rust-tools')
        --         rt.hover_actions.hover_actions()
        --     end,
        --     "Run/Debug/Info"
        -- },
        -- ["<leader>a"] = {
        --     function()
        --         local rt = require('rust-tools')
        --         rt.code_action_group.code_action_group()
        --     end,
        --     "Refactor/Actions"
        -- }
    }
}
M.lspsaga = {
    n = {
        ['<leader>gtd'] = {
            "<cmd>Lspsaga goto_definition<cr>",
            "Go to definition (Lspsaga)"
        },
        ['<leader>pd'] = {
            "<cmd>Lspsaga peek_definition<cr>",
            "Peek Definition (Lspsaga)"
        },
        ['<leader>fci'] = {
            "<cmd>Lspsaga incoming_calls<cr>",
            "Incoming Function Calls"
        },
        ['<leader>fco'] = {
            "<cmd>Lspsaga outgoing_calls<cr>",
            "Function Calls (Outgoing)"
        },
        ['<leader>fs'] = {
            "<cmd>Lspsaga finder<cr>",
            "Find Symbol Usage"
        },
        ['<leader>fsr'] = {
            "<cmd>Lspsaga finder ref<cr>",
            "Find Symbol References"
        },
        ['<leader>fsi'] = {
            "<cmd>Lspsaga finder imp<cr>",
            "Find Symbol Implementations"
        },
        ['<leader>wd'] = {
            "<cmd>Lspsaga show_workspace_diagnostics ++normal<cr>",
            "Show Workspace Problems"
        },
        ['<leader>bd'] = {
            "<cmd>Lspsaga show_buf_diagnostics ++normal<cr>",
            "Show Buffer Problems"
        },
        ['[d'] = {
            "<cmd>Lspsaga diagnostic_jump_prev<cr>",
            "Diagnostic Prev"
        },
        [']d'] = {
            "<cmd>Lspsaga diagnostic_jump_next<cr>",
            "Diagnostic Next"
        },
        ['<leader>k'] = {
            "<cmd>Lspsaga hover_doc<cr>",
            "Hover Docs"
        },
        ['<leader>ra'] = {
            "<cmd>Lspsaga rename<cr>",
            "Rename Symbol",
        },
        ['<leader>co'] = {
            "<cmd>Lspsaga outline<cr>",
            "Code Outline"
        },
        ['<leader>a'] = {
            "<cmd>Lspsaga code_action<cr>",
            "Code Actions"
        }
    }
}

-- M.telescope = {
--     n = {
--         ["<leader>fs"] = {
--             function()
--                 require("telescope").extensions.live_grep_args.live_grep_args()
--             end,
--             "Live Grep Args"
--         }
--     }
-- }

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
