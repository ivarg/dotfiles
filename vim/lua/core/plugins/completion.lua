--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error 
-- Show inlay_hints more frequently 
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])



return {

    -- Completion framework:
    { 
        "hrsh7th/nvim-cmp",
        lazy = false,
        dependencies = { "L3MON4D3/LuaSnip", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-nvim-lua", "hrsh7th/cmp-nvim-lsp-signature-help" },
        config = function()

            -- Completion Plugin Setup
            local cmp = require'cmp'
            cmp.setup({
                -- Enable LSP snippets
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    -- Add tab support
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    })
                }),

                -- Installed sources:
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
                    { name = 'nvim_lsp_signature_help'},               -- display function signatures with current parameter emphasized
                    { name = 'nvim_lua'},                              -- complete neovim's Lua runtime API such vim.lsp.*
                },
                formatting = {
                    fields = {'menu', 'abbr', 'kind'},
                    format = function(entry, item)
                        local menu_icon ={
                            nvim_lsp = 'λ',
                            luasnip = '⋗',
                            buffer = 'Ω',
                            path = '🖫',
                        }
                        item.menu = menu_icon[entry.source.name]
                        return item
                    end,
                },
            })

        end,
    }, 

}