return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local tokyonight = require("tokyonight")
            tokyonight.setup({ style = "night" })
            tokyonight.load()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "tokyonight",
            },
            sections = {
                lualine_c = {
                    { "filename", newfile_status = true, path = 1 }, -- display file with relative path
                },
            },
        },
    },
    --[[

    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set('n', '<leader>gs', ':Git status<cr>')
            vim.keymap.set('n', '<leader>gd', ':Git diff<cr>')
            vim.keymap.set('n', '<leader>gb', ':Git blame<cr>')
            vim.keymap.set('n', '<leader>gi', ':Git add -p %<cr>')
        end
    },
    {
        "edkolev/tmuxline.vim"
    },
    ]]
    --
}
