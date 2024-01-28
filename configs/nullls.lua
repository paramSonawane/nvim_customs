local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
    sources = {
        -- null_ls.builtins.formatting.gofmt,
        -- null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.gofumpt,
        -- strict version of go fmt
        -- make sure to go install mvdan.cc/gofumpt@latest
        null_ls.builtins.formatting.goimports_revier,
        -- better version of go imports
        -- make sure to go install github.com/incu6us/goimports-reviser/v3@latest
        null_ls.builtins.formatting.golines,
        -- make sure to go install github.com/segmentio/golines@latest
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group=augroup,
                buffer=bufnr
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group=augroup,
                buffer=bufnr,
                callback = function()
                    vim.lsp.buf.format({bufnr=bufnr})
                end
            })
        end
    end
}
return opts
