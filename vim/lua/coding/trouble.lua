return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        on_attach = function() end,
    },
    config = function(_, opts)
        local trouble = require("trouble")
        trouble.setup(opts)

        vim.keymap.set("n", "<leader>xx", function()
            trouble.toggle("document_diagnostics")
        end)
        vim.keymap.set("n", "<leader>xw", function()
            trouble.toggle("workspace_diagnostics")
        end)
        vim.keymap.set("n", "<leader>xt", function()
            trouble.toggle()
        end)
        vim.keymap.set("n", "<leader>xq", function()
            trouble.toggle("quickfix")
        end)
        vim.keymap.set("n", "<leader>xl", function()
            trouble.toggle("loclist")
        end)
        vim.keymap.set("n", "gd", function()
            trouble.open("lsp_definitions")
        end)
        vim.keymap.set("n", "gr", function()
            trouble.open("lsp_references")
        end)
        vim.keymap.set("n", "gi", function()
            trouble.open("lsp_implementations")
        end)
        vim.keymap.set("n", "gb", function()
            trouble.open("lsp_type_definitions")
        end)
    end,
}
