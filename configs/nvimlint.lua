return function()
    local lint = require("lint")
    lint.linters_by_ft = {
        -- javascript = { "eslint_d" },
        -- typescript = { "eslint_d" },
        json = { "jsonlint" },
        -- javascriptreact = { "eslint_d" },
        -- typescriptreact = { "eslint_d" },

        python = {
            -- "mypy",
            "ruff",
            -- "pylint"
        },
        -- lua = {"luacheck"},
        markdown = { "markdownlint" },
    }

    lint.linters.codespell_columns = {
        name = "codespell",
        cmd = 'codespell',
        stdin = false,
        ignore_exitcode = true,
        parser = function(output)
            local efm = '%f:%l:%c:%m'
            local lines = vim.split(output, '\n')
            local qflist = vim.fn.getqflist({ efm = efm, lines = lines })
            local result = {}
            for _, item in pairs(qflist.items) do
                if item.valid == 1 then
                    local message = item.text
                    local word = message:match('%f[%a](%w+) ==>')
                    local lnum = math.max(0, item.lnum - 1)
                    local col = math.max(0, item.col - 1)
                    local end_lnum = item.end_lnum > 0 and (item.end_lnum - 1) or lnum
                    local end_col = col + word:len() or col
                    local diagnostic = {
                        col = col,
                        end_lnum = end_lnum,
                        end_col = end_col,
                        lnum = lnum,
                        message = message,
                        severity = vim.diagnostic.severity.INFO,
                        source = 'codespell'
                    }
                    table.insert(result, diagnostic)
                end
            end
            return result
        end
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true });
    vim.api.nvim_create_autocmd(
        {
            "BufEnter", "BufWritePost",
            -- "InsertLeave", "TextChanged",
        },
        {
            group = lint_augroup,
            callback = function()
                local buf = vim.api.nvim_get_current_buf()
                if vim.fn.getbufvar(buf, "&modifiable") == 1
                -- and utils.not_in(fn.getbufvar(buf, "&filetype"), {})
                then
                    lint.try_lint()
                    lint.try_lint("codespell_columns")
                end
            end
        }
    )
end
