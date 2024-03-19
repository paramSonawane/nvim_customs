local print_warn = function(msg)
    vim.api.nvim_command('echohl WarningMsg')
    vim.api.nvim_command('echomsg "' .. msg .. '"')
    vim.api.nvim_command('echohl None')
end

local get_file_git_status = function()
    local api = require('nvim-tree.api')

    local node = api.tree.get_node_under_cursor()
    local gs = node.git_status.file

    -- If the current node is a directory get children status
    if gs == nil then
        gs = (node.git_status.dir.direct ~= nil and node.git_status.dir.direct[1])
            or (node.git_status.dir.indirect ~= nil and node.git_status.dir.indirect[1])
    end
    return gs, node, api
end

local cmd_out_vsplit = function(command)
    vim.api.nvim_command('vnew')
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    vim.api.nvim_put({ result }, 'l', true, true)
end

local cmd_out_vterm = function(command)
    vim.api.nvim_command('vnew')
    vim.api.nvim_command('call termopen("' .. command .. '")')
    -- vim.api.nvim_command('normal!v')
end

local M = {
    git_stage = function()
        local gs, node, api = get_file_git_status()
        -- If the file is untracked, unstaged or partially stageed, we stage it
        if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
            vim.cmd("silent !git add -A -- " .. node.absolute_path)
            print("Staged")
            -- If the file is staged, we unstage
        else
            print_warn("Failed to stage")
        end

        api.tree.reload()
    end,
    git_unstage = function()
        local gs, node, api = get_file_git_status()
        if gs == "M " or gs == "A " then
            vim.cmd("silent !git reset -q HEAD -- " .. node.absolute_path)
            -- vim.cmd("silent !git rm --cached -r -- " .. node.absolute_path)
            print("Unstaged")
        else
            print_warn("Failed to unstage")
        end

        api.tree.reload()
    end,
    preview_md = function()
        local file_type = vim.bo.filetype
        if file_type ~= "markdown" then
            print_warn("Markdown File Required")
        else
            local active_file_path = vim.api.nvim_buf_get_name(0)
            local glow_command = 'glow ' .. active_file_path
            cmd_out_vterm(glow_command)
        end
    end,
    cmd_out_vsplit = cmd_out_vsplit,
    cmd_out_vterm = cmd_out_vterm,
    format_pretty = function()
        require('conform').format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 500
        })
    end,
}
return M
