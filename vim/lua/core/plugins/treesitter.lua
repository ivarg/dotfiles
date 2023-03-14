

local M = {
    'nvim-treesitter/nvim-treesitter',
    -- enabled = false,
    config = function()
        require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "help", "query",
        "python" },
        sync_install = false,
        auto_install = true,
        build = ":TSUpdate",
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = true,
        },
        indent = {
            enable = true,
        },
    })
    end,
}

return M
