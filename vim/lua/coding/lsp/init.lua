return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true,
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
            require("coding.lsp.keymaps").register_on_attach()
            -- 2. go through opts
            require("coding.lsp.servers").setup(plugin, opts)
        end,
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = function()
            local null_ls = require("null-ls")
            return {
                sources = {
                    null_ls.builtins.diagnostics.luacheck.with({
                        extra_args = { "--read-globals", "vim" },
                    }),
                    null_ls.builtins.diagnostics.ruff,
                    null_ls.builtins.diagnostics.mypy,

                    null_ls.builtins.formatting.autoflake,

                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.isort,

                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.stylua,
                },
                diagnostics_format = "[#{c}] #{m} (#{s})",
            }
        end,
    },

    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = { "jose-elias-alvarez/null-ls.nvim", "williamboman/mason.nvim" },
        opts = {
            automatic_installation = true,
        },
    },

    -- {
    --     "rcarriga/nvim-notify"
    -- },

    {
        "ray-x/lsp_signature.nvim",
        opts = {
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
                border = "rounded",
            },
        },
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        opts = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local compare = require("cmp.config.compare")

            local source_names = {
                nvim_lsp = "(LSP)",
                luasnip = "(Snippet)",
                buffer = "(Buffer)",
                path = "(Path)",
            }

            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
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

                sources = cmp.config.sources({
                    { name = "nvim_lsp_signature_help", group_index = 1 },
                    { name = "nvim_lsp", group_index = 1 },
                    { name = "luasnip", group_index = 1 },
                    { name = "buffer", group_index = 2 },
                    { name = "path", group_index = 2 },
                }),

                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, item)
                        -- local menu_icon ={
                        --     nvim_lsp = 'λ',
                        --     luasnip = '⋗',
                        --     buffer = 'Ω',
                        --     path = '🖫',
                        -- }
                        -- item.menu = menu_icon[entry.source.name]
                        item.menu = source_names[entry.source.name]
                        return item
                    end,
                },
                window = {
                    documentation = {
                        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                        winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
                    },
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
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
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
                            if cmp.get_active_entry() == nil or cmp.get_entries().length() == 1 then
                                cmp.select_next_item({ count = 0 })
                            else
                                cmp.select_next_item()
                            end
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
            }
        end,

        config = function(_, opts)
            require("cmp").setup(opts)

            -- TODO: figure out why this doesn't work
            -- local capabilities = vim.lsp.protocol.make_client_capabilities()
            -- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
            -- print(capabilities)
            -- require("lspconfig").pyright.setup({
            --     capabilities = capabilities,
            -- })
        end,
    },

    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            {
                "rafamadriz/friendly-snippets",
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
            },
        },
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
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
                expr = true,
                remap = true,
                silent = true,
                mode = "i",
            },
            {
                "<C-j>",
                function()
                    require("luasnip").jump(1)
                end,
                mode = "s",
            },
            {
                "<C-k>",
                function()
                    require("luasnip").jump(-1)
                end,
                mode = { "i", "s" },
            },
        },
        config = function(_, opts)
            require("luasnip").setup(opts)
        end,
    },
}
