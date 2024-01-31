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
        parser = require('lint.parser').from_errorformat(
            '%f:%l:%c:%m',
            {
                severity = vim.diagnostic.severity.INFO,
                source = 'codespell'
            }
        )
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
