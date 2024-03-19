return {
    ensure_installed = {
        "arduino-language-server",
        "clangd",
        "clang-format",
        "codespell_columns",
        -- "eslint_d",
        "eslint-lsp",
        -- "cspell",
        -- "gopls",
        "jsonlint",
        "js-debug-adapter",
        "jq",
        "lua-language-server",
        "markdownlint",
        "rust-analyzer",
        "prettier",
        "isort",
        "black",
        "stylua",
        "taplo",
        -- "rustfmt"
    },
    ui = {
        icons = {
            package_uninstalled = ""
        }
    },
    registries = {
        "github:mason-org/mason-registry",
        "github:paramSonawane/mason-registry",
    },
}
