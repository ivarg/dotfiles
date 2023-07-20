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

