local M = {}

M.ui = {
    theme = 'catppuccin',
    -- transparency = true,
    statusline = {
        theme = "vscode_colored",
    }
}

M.plugins = 'custom.plugins'
M.mappings = require 'custom.mappings'

vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = {
        only_current_line = true,
        highlight_whole_line = true,
    }
})
--
return M
