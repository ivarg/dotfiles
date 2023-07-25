-- Write buffer when losing focus
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, { command = "wall" })

-- Strip trailing whitespace when writing buffer
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.rs", "*.c", "*.go", "*.py" },
    callback = function()
        local crsr = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", crsr)
    end,
})

-- Call LSP format on save
-- This will invoke registered formatting sources via the 'null-ls' plugin
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    callback = function()
        vim.lsp.buf.format()
    end,
})
