return function()
    require('lspsaga').setup({
        ui = {
            border = 'rounded',
            code_action = ""
        },
        definition = {
            keys = {
                edit = '<C-c>e',
                split = '<C-c>h',
            }
        },
        finder = {
            keys = {
                vsplit = '<C-c>v',
                split = '<C-c>i'
            }
        },
        rename = {
            keys = {
                quit = '<ESC>'
            }
        }
    })
end
