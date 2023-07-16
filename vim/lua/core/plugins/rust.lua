-- LSP Diagnostics Options Setup 
--[[
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end
]]--

-- sign({name = 'DiagnosticSignError', text = ''})
-- sign({name = 'DiagnosticSignWarn', text = ''})
-- sign({name = 'DiagnosticSignHint', text = ''})
-- sign({name = 'DiagnosticSignInfo', text = ''})

--[[
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})
]]--

-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

-- For debugging: (https://github.com/simrat39/rust-tools.nvim/wiki/Debugging)
-- local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.9.2/'
-- local codelldb_path = extension_path .. 'adapter/codelldb'
-- local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'


return {
    enabled = true,
    "simrat39/rust-tools.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    lazy = false,
    config = function()
        local rt = require("rust-tools")
        rt.setup({
            server = {
                on_attach = function(_, bufnr)
                    -- Hover actions
                    -- vim.keymap.set("n", "<C-h>", rt.hover_actions.hover_actions, { buffer = bufnr })
                    -- Code action groups
                    vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                end,
            },
            -- dap = {
            --     adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
            -- }
        })

    end,
}
