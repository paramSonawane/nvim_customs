return {
    formatters_by_ft = {
        -- css = {"prettier"},
        -- go = {"goimports", "gofmt", "golines"},
        -- graphql = {"prettier"},
        -- html = {"prettier"},
        -- lua = {"stylua"},
        -- -- will first run isort then black. use nested list for either or
        -- python = { "isort", "black"},
        -- rust = {"rustfmt"},
        -- ["*"] = {"codespell"},
        -- * for all file types, _ for filetypes without formatters
        arduino = { "clang_format" },
        c = { "clang_format" },
        json = { "jq" },
        toml = { "taplo" },
        ["_"] = { "trim_whitespace" },
    },
    format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500
    },
    formatters = {
        clang_format = {
            args = { "-style={IndentWidth: 4}" }
        }
    }
}
