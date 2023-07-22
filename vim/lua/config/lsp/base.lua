
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
            require("config.lsp-keymaps").register_on_attach()
            -- 2. go through opts
            require("config.servers").setup(plugin, opts)
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        opts = function()
            local cmp = require "cmp"
            local luasnip = require "luasnip"
            local compare = require "cmp.config.compare"

            -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- require('lspconfig')['pyright'].setup {
            --     capabilities = capabilities
            -- }

            local source_names = {
                nvim_lsp = "(LSP)",
                luasnip = "(Snippet)",
                buffer = "(Buffer)",
                path = "(Path)",
            }
            local duplicates = {
                buffer = 1,
                path = 1,
                nvim_lsp = 0,
                luasnip = 1,
            }
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end
            return {
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                sorting = {
                    priority_weight = 2,
                    comparators = {
                        compare.score,
                        compare.recently_used,
                        compare.offset,
                        compare.exact,
                        compare.kind,
                        compare.sort_text,
                        compare.length,
                        compare.order,
                    },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
                    ["<C-j>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "c" }),
                    ["<C-k>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "c" }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
                        -- they way you will only jump inside the snippet region
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end),
                }),
                sources = cmp.config.sources {
                    { name = "nvim_lsp", group_index = 1 },
                    { name = "luasnip", group_index = 1 },
                    { name = "buffer", group_index = 2 },
                    { name = "path", group_index = 2 },
                },
                formatting = {
                    -- fields = { "kind", "abbr", "menu" },
                    format = function(entry, item)
                        local duplicates_default = 0
                        -- item.menu = source_names[entry.source.name]
                        -- item.dup = duplicates[entry.source.name] or duplicates_default
                        return item
                    end,
                },
                -- experimental = {
                --     hl_group = "LspCodeLens",
                --     ghost_text = {},
                -- },
                window = {
                    documentation = {
                        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                        winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
                    },
                },
            }
        end,
    },

    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        opts = {
            history = true,
            delete_check_events = "TextChanged",
        },
        keys = {
            {
                "<C-j>",
                function()
                    return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<C-j>"
                end,
                expr = true, remap = true, silent = true, mode = "i",
            },
            { "<C-j>", function() require("luasnip").jump(1) end, mode = "s" },
            { "<C-k>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
        },
        config = function(_, opts)
            require("luasnip").setup(opts)
        end,
    }

}
