------------
-- Install [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep) and 
-- [sharkdp/fd](https://github.com/sharkdp/fd)


-- Global key mappings for Telescope
vim.api.nvim_set_keymap('n', '<C-p><C-p>', '<cmd>Telescope<cr>', {})
vim.api.nvim_set_keymap('n', '<C-p><C-f>', '<cmd>Telescope buffers<cr>', {})

vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>Telescope<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope fd<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>fz', '<cmd>Telescope current_buffer_fuzzy_find<cr>', {})


local M = {
    -- enabled = false,
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require("telescope.builtin")
        local themes = require("telescope.themes")
        builtin.lsp_references(themes.get_ivy())
        require("telescope").setup({
            defaults = {
                layout_strategy = "vertical",
                layout_config = {
                    height = 0.3,
                },
                preview = false,
            },
            pickers = {
                git_commits = {
                    preview = true,
                    layout_config = {
                        height = 0.8,
                    },
                },
            },
        })
    end,

}

return M
