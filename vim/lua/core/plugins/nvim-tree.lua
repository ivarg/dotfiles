vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_set_keymap('n', '<C-e>', '<cmd>NvimTreeToggle<cr>', {})

return {
    'nvim-tree/nvim-tree.lua',
    name = "nvim-tree",
    cmd = { 'NvimTreeToggle', 'NvimTreeOpen' },
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {
      sort_by = "case_sensitive",
      renderer = {
        group_empty = true
      },
    },
    config = function()
        local M = {}
        local api = require("nvim-tree.api")
        local function opts(desc, bufnr)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        function M.on_attach(bufnr)
            api.config.mappings.default_on_attach(bufnr)

            vim.keymap.set('n', '<C-e>', api.tree.toggle, opts('Close tree', bufnr))
            vim.keymap.set('c', '<C-c>', '<Nop>', opts('Close tree', bufnr))
        end
        require("nvim-tree").setup({
            on_attach = M.on_attach,
        })
    end,
}

