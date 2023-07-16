return {
    {
        "folke/tokyonight.nvim",
--        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd[[colorscheme tokyonight-night]]
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- Lua
            require("lualine").setup({
                options = {
                    theme = 'tokyonight',
                },
                sections = {
                    lualine_b = { 
                        { 'branch' },
                        { 
                            'diagnostics', 
                            -- symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
                            colored = true,           -- Displays diagnostics status in color if set to true.
                        }
                    },
                    lualine_c = { 
                        { 'filename', path = 1 } -- display file with relative path
                    }
                }
            })
        end,
    },
    --[[
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
            ]]--
    {
        "tpope/vim-commentary",
	lazy = false,
        config = function()
            vim.keymap.set('', '<leader>c<space>', ':Commentary<cr>')
        end
    },
            --[[
    {
        "kylechui/nvim-surround",
        version = "2.*",
        config = function()
            require("nvim-surround").setup()
        end,
    },

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
        "junegunn/gv.vim",
    },
    {
        "airblade/vim-gitgutter",
    },
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set('n', '<leader>u', ':UndotreeToggle<cr>')
        end
    },
    {
        "edkolev/tmuxline.vim"
    },
    {
        -- Disabled, can be removed?
        "easymotion/vim-easymotion",
        enabled = false,
        config = function()
            vim.keymap.set('', '<leader>f', '<Plug>(easymotion-bd-f)')
            vim.keymap.set('n', '<leader>f', '<Plug>(easymotion-overwin-f)')
        end
    },
    ]]--
}
