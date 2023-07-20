-- Write buffer when losing focus
vim.api.nvim_create_autocmd({"BufLeave", "FocusLost"}, { command = "wall" })

-- Strip trailing whitespace when writing buffer
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = {"*.rs", "*.c", "*.go", "*.py"},
    callback = function()
        crsr = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", crsr)
    end,
})

-- Change local working directory to currently open file
vim.api.nvim_create_autocmd({"BufEnter"}, {
    command = "lcd %:p:h"
})


