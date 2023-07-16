-----------------------------------
-- Global settings and key mappings
-----------------------------------

vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct

vim.opt.smarttab = true
vim.opt.expandtab = true -- Tabs are spaces, not tabs
vim.opt.tabstop = 4 -- An indentation every four columns
vim.opt.softtabstop = 4 -- Let backspace delete indent
vim.opt.shiftwidth = 4 -- Use indents of 4 spaces
vim.opt.number = true -- Line numbers on

vim.opt.clipboard:append('unnamedplus')
vim.opt.cursorline = true -- Highlight current line
vim.opt.winminheight = 0 -- Windows can be 0 line high
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case sensitive when uc present
--vim.opt.wildmode = 'list:longest,full' -- Command mode <Tab> completion, list matches, then longest common part, then all
vim.opt.whichwrap = 'b,s,h,l,<,>,[,]' -- Backspace and cursor keys wrap too
vim.opt.scrolloff = 2 -- Minimum lines to keep above and below cursor
vim.opt.list = true -- Display whitespaces
vim.opt.shortmess = 'filmnrxoOtF' -- Abbrev. of messages (avoids 'hit enter')
vim.opt.virtualedit = 'onemore' -- Allow for cursor beyond last character
vim.opt.showmatch = true -- Show matching brackets/parenthesis

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

vim.keymap.set('i', 'jj', '<esc><esc>')
vim.keymap.set('i', 'jk', '<esc><esc>')

-- Close current buffer without closing window
vim.keymap.set('n', '<C-W><C-W>', ':bd<cr>')

-- Shortcut for opening file
vim.keymap.set('n', '<leader>ew', ':e ')

-- Move between windows
vim.keymap.set('n', '<C-H>', '<C-W><Left>')
vim.keymap.set('n', '<C-L>', '<C-W><Right>')
vim.keymap.set('n', '<C-J>', '<C-W><Down>')
vim.keymap.set('n', '<C-K>', '<C-W><Up>')

-- Movement in input and command modes
vim.keymap.set({'i', 'c'}, '<C-H>', '<Left>')
vim.keymap.set({'i', 'c'}, '<C-L>', '<Right>')
vim.keymap.set({'i', 'c'}, '<C-A>', '<Home>')
vim.keymap.set({'i', 'c'}, '<C-E>', '<End>')
vim.keymap.set({'i', 'c'}, '<C-D>', '<Del>')

-- Shortcuts to quickly exit and reload .vimrc
vim.keymap.set('n', '<leader>av', ':vsplit $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<cr>')

-- Enter command and search mode quickly and when in SE input mode
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', 'ö', ':')
vim.keymap.set('n', '-', '/')

-- Wrapped lines goes down/up to next row, rather than next line in file.
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Yank from the cursor to the end of the line, to be consistent with C and D.
vim.keymap.set('n', 'Y', 'y$')

-- Toggle search element highlight
vim.keymap.set('n', '<leader>/', ':set invhlsearch<cr>')

-- Visual shifting (does not exit Visual mode)
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Allow using the repeat operator with a visual selection (!)
-- http://stackoverflow.com/a/8064607/127816
vim.keymap.set('v', '.', ':normal .<cr>')

-- Adjust viewports to the same size
vim.keymap.set('n', '<leader>=', '<C-w>=')

