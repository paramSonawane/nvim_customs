return {
    ensure_installed = {
        "arduino-language-server",
        "clangd",
        "clang_format",
        "codespell_columns",
        -- "cspell",
        -- "gopls",
        "jsonlint",
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
