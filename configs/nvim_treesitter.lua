return {
    -- highlight = {
    --     enable = true,
    -- },
    indent = {
        enable = true
    },
    ensure_installed = {
        "arduino",
        "json",
        "regex",
        "lua",
        -- some error with ts/js sitter causes save fails E13
        -- "javascript",
        -- "typescript",
        "python",
        "rust",
        "html",
        "markdown",
        "markdown_inline",
        "c",
        "vim",
        "vimdoc"
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            scope_incremental = false
        }
    }

}
