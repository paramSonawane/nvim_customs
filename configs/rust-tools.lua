local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local options = {
    server = {
        on_attach = on_attach,
        capabilities = capabilities
    },
    tools = {
        hover_actions = {
            auto_focus = true
        }
    }
}
return options
