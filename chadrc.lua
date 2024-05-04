local highlights = require "custom.highlights"
local M = {}

M.ui = {
    theme = 'decay',
    -- transparency = true,
    statusline = {
        theme = "vscode_colored",
        -- modules arg here is the default table of modules
        overriden_modules = function(modules)
            -- modules[1] = (function()
            --    return "MODE!"
            -- end)()

            local actived_venv = function()
                local venv_name = require('venv-selector').get_active_venv()
                if venv_name ~= nil then
                    venv_name = string.gsub(venv_name, '.*/pypoetry/virtualenvs/', '(poetry) ')
                    return '  ' .. venv_name .. ' '
                else
                    return ''
                end
            end
            table.insert(
                modules,
                13,
                actived_venv()
            )
        end,
    },
    telescope = {
        style = "bordered"
    }, -- borderless / bordered
    nvdash = {
        load_on_startup = true,
        header = {
            "                                                                       ",
            "                                                                     ",
            "       ████ ██████           █████      ██                     ",
            "      ███████████             █████                             ",
            "      █████████ ███████████████████ ███   ███████████   ",
            "     █████████  ███    █████████████ █████ ██████████████   ",
            "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
            "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
            " ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
            "                                                                       ",
            -- "     ++01100101 01110101++             =ඏ=             ++10101110 10100110++      ",
            -- "    +011100110110   01001111000      0♢0Ŧ0♢0      00011110010   011011001110+     ",
            -- "+0110010001100101 0110000101100100   000卄000   0010011010000110 1010011000100110+",
            -- " +01101101011000010111001001101011++00+0卄00++++11010110010011101000011010110110+ ",
            -- "     0111001101100  0010110111001100100`⁆⁅´0010011001110110100  0011011001110     ",
            -- "           011001100 110000101110010++=`⁆⁅´=++010011101000011 001100110           ",
            -- "             +01 10100001100101011 10010ʞk01001 11010100110000101 10+             ",
            -- "                  +0111010001101111  +01ʞk10+  1111011000101110+                  ",
            -- "                      +110101011011  00.∴.00  110110101011+                       ",
            -- "                       +01100101     0+1ʞk1+0    10100110+                        ",
            -- "                       +1100101     +0+.∴.+0+     1010011+                        ",
            -- "                         +1110010   +0+.∴.+0+   0100111+                          ",
            -- "                           +1110100  01 ∴ 10  0010111+                            ",
            -- "                                     10 ∴ 01                                      ",
            -- "                                     10`∵´01                                      ",
            -- "                                      00.00                                       ",
            -- "                                       : :                                        ",
            --     "███╗░░██╗██╗░░░██╗░█████╗░██╗░░██╗░█████╗░██████╗░",
            --     "████╗░██║██║░░░██║██╔══██╗██║░░██║██╔══██╗██╔══██╗",
            --     "██╔██╗██║╚██╗░██╔╝██║░░╚═╝███████║███████║██║░░██║",
            --     "██║╚████║░╚████╔╝░██║░░██╗██╔══██║██╔══██║██║░░██║",
            --     "██║░╚███║░░╚██╔╝░░╚█████╔╝██║░░██║██║░░██║██████╔╝",
            --     "╚═╝░░╚══╝░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░",
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
    },
    hl_override = highlights.override,
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

vim.api.nvim_create_autocmd('VimEnter', {
    desc = 'Auto select virtualenv',
    pattern = '*',
    callback = function()
        local venv = (
            vim.fn.findfile('pyproject.toml', vim.fn.getcwd() .. ';')
            or vim.fn.findfile('Pipfile', vim.fn.getcwd() .. ';')
        )
        if venv then
            require('venv-selector').retrieve_from_cache()
        end
    end,
    once = true,
})

return M
