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
                theme = 'tokyonight',
            },
            sections = {
                lualine_c = {
                    { "filename", newfile_status = true, path = 1 } -- display file with relative path
                }
            }
        }
    },
    --[[
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
            ]]--
    {
        "tpope/vim-commentary",
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
