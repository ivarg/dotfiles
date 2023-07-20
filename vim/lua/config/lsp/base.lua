
return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            -- automatic_installation = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        opts = {
            servers = {},
        },
        config = function(plugin, opts)
            -- 1. on attaching a server, setup general keymaps
            require("config.lsp-keymaps").on_attach()
            -- 2. go through opts
            require("config.servers").setup(plugin, opts)
        end,
    },

}
