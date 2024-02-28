local M = {}

M.ui = {
    theme = 'catppuccin',
    -- transparency = true,
    statusline = {
        theme = "vscode_colored",
        -- modules arg here is the default table of modules
        -- overriden_modules = function(modules)
        -- modules[1] = (function()
        --    return "MODE!"
        -- end)()
        -- table.insert(
        --    modules,
        --    4,
        --    require('nvchad.statusline.vscode_colored').gitchanges()
        -- )
        -- end,
    },
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
