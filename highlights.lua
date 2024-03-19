-- NOTE: NvChad Related Highlights
-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsListreturn

M.override = {
    Comment = {
        italic = true,
    },
    NvDashAscii = { bg = "NONE", fg = "blue" },
    NvDashButtons = { bg = "NONE" },
}

return M
