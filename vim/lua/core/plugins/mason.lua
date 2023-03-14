
local M = {
    { 
        "williamboman/mason.nvim",
        dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
        init = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright" }
            })

            local lspconfig = require("lspconfig")
            lspconfig["pyright"].setup({
            })
        end,
        config = function()
            -- require("mason").setup()
            -- require("mason-lspconfig").setup()
            -- require("lspconfig").setup()
        end,
    },
}

return M
