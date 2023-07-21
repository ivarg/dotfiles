return {
    "nvim-treesitter/nvim-treesitter",
    -- enabled = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        ensure_installed = {
            "bash",
            "dockerfile",
            "html",
            "markdown",
            "markdown_inline",
            "org",
            "query",
            "regex",
            "latex",
            "vim",
            "vimdoc",
            "yaml",
            "lua",
            "toml",
        },
        sync_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn", -- set to `false` to disable one of the mappings
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
