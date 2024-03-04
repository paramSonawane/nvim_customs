local M = {}

M.ui = {
    theme = 'decay',
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
    telescope = {
        style = "bordered"
    }, -- borderless / bordered
    nvdash = {
        load_on_startup = true,
        header = {
            "███╗░░██╗██╗░░░██╗░█████╗░██╗░░██╗░█████╗░██████╗░",
            "████╗░██║██║░░░██║██╔══██╗██║░░██║██╔══██╗██╔══██╗",
            "██╔██╗██║╚██╗░██╔╝██║░░╚═╝███████║███████║██║░░██║",
            "██║╚████║░╚████╔╝░██║░░██╗██╔══██║██╔══██║██║░░██║",
            "██║░╚███║░░╚██╔╝░░╚█████╔╝██║░░██║██║░░██║██████╔╝",
            "╚═╝░░╚══╝░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░",
        },

        buttons = {
            { "  Find File", "Spc f f", "Telescope find_files" },
            { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
            { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
            { "  Bookmarks", "Spc m a", "Telescope marks" },
            { "  Themes", "Spc t h", "Telescope themes" },
            { "  Mappings", "Spc c h", "NvCheatsheet" },
            { "  Quit", "ZZ", ":q!" },
        }
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
