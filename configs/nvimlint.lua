return function()
    local lint = require("lint")
    lint.linters_by_ft = {
        javascript = { "eslint_d" },
        -- lua = {"luacheck"},
        markdown = { "markdownlint" },
    }

    lint.linters.codespell_columns = {
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
                lint.try_lint()
                lint.try_lint("codespell_columns")
            end
        }
    )
end
