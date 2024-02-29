return {
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                -- assignments
                ["a="] = { query = "@assignment.outer", desc = "Select outer assignment" },
                ["i="] = { query = "@assignment.inner", desc = "Select inner assignment" },
                ["l="] = { query = "@assignment.lhs", desc = "Select lhs assignment" },
                ["r="] = { query = "@assignment.rhs", desc = "Select rhs assignment" },

                ["aa"] = { query = "@parameter.outer", desc = "Select outer parameter/argument" },
                ["ia"] = { query = "@parameter.inner", desc = "Select inner parameter/argument" },

                ["ai"] = { query = "@conditional.outer", desc = "Select outer conditional" },
                ["ii"] = { query = "@conditional.inner", desc = "Select inner conditional" },

                ["al"] = { query = "@loop.outer", desc = "Select outer loop" },
                ["il"] = { query = "@loop.inner", desc = "Select inner loop" },

                ["af"] = { query = "@call.outer", desc = "Select outer function call" },
                ["if"] = { query = "@call.inner", desc = "Select inner function call" },

                ["am"] = { query = "@function.outer", desc = "Select outer function def" },
                ["im"] = { query = "@function.inner", desc = "Select inner function def" },

                ["ac"] = { query = "@class.outer", desc = "Select outer class def" },
                ["ic"] = { query = "@class.inner", desc = "Select inner class def" },
            }
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["[f"] = { query = "@call.outer", desc = "Next function call start" },
                ["[m"] = { query = "@function.outer", desc = "Next method/func def start" },
                ["[c"] = { query = "@class.outer", desc = "Next class start" },
                ["[i"] = { query = "@conditional.outer", desc = "Next conditional start" },
                ["[l"] = { query = "@loop.outer", desc = "Next loop start" },

            },
            goto_previous_start = {
                ["[F"] = { query = "@call.outer", desc = "Prev function call start" },
                ["[M"] = { query = "@function.outer", desc = "Prev method/func def start" },
                ["[C"] = { query = "@class.outer", desc = "Prev class start" },
                ["[I"] = { query = "@conditional.outer", desc = "Next conditional start" },
                ["[L"] = { query = "@loop.outer", desc = "Prev loop start" },
            },
            goto_next_end = {
                ["]f"] = { query = "@call.outer", desc = "Next function call end" },
                ["]m"] = { query = "@function.outer", desc = "Next method/func def end" },
                ["]c"] = { query = "@class.outer", desc = "Next class end" },
                ["]i"] = { query = "@conditional.outer", desc = "Next conditional end" },
                ["]l"] = { query = "@loop.outer", desc = "Next loop end" },

            },
            goto_previous_end = {
                ["]F"] = { query = "@call.outer", desc = "Prev function call end" },
                ["]M"] = { query = "@function.outer", desc = "Prev method/func def end" },
                ["]C"] = { query = "@class.outer", desc = "Prev class end" },
                ["]I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
                ["]L"] = { query = "@loop.outer", desc = "Prev loop end" },
            },
        }
    }
}
