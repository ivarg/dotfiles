local M = {}

-- Do not register actions that are conditioned on client capabilities
-- see https://github.com/alpha2phi/neovim-pde/blob/01-init.lua/lua/base/lsp/keymaps.lua
local function keymaps(client, bufnr)
    local function keymap(lhs, rhs, opts)
        opts = opts or {}
        vim.keymap.set(
            opts.mode or "n",
            lhs,
            type(rhs) == "string" and ("<cmd>%s<cr>"):format(rhs) or rhs,
            { silent = true, buffer = bufnr, desc = opts.desc }
        )
    end

    keymap("gd", "Telescope lsp_definitions", { desc = "Goto Definition" })
    keymap("gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
    keymap("K", vim.lsp.buf.hover, { desc = "Hover" })
    keymap("gi", "Telescope lsp_implementations", { desc = "Goto Implementation" })
    keymap("gr", "Telescope lsp_references", { desc = "References" })
    keymap("gb", "Telescope lsp_type_definitions", { desc = "Goto Type Definition" })
end

function M.register_on_attach()
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local bufnr = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            keymaps(client, bufnr)
        end,
    })
end

return M
