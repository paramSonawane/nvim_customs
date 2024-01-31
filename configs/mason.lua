return {
    ensure_installed = {
        "codespell_columns",
        -- "cspell",
        -- "gopls",
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
    }
}
