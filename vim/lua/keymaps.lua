local keymap = vim.keymap.set

keymap('i', 'jj', '<esc><esc>')
keymap('i', 'jk', '<esc><esc>')

-- Close current buffer without closing window
keymap('n', '<C-W><C-W>', ':bd<cr>')

-- Shortcut for opening file
keymap('n', '<leader>ew', ':e ')

-- Move between windows
keymap('n', '<C-H>', '<C-W><Left>')
keymap('n', '<C-L>', '<C-W><Right>')
keymap('n', '<C-J>', '<C-W><Down>')
keymap('n', '<C-K>', '<C-W><Up>')

-- Movement in input and command modes
keymap({'i', 'c'}, '<C-H>', '<Left>')
keymap({'i', 'c'}, '<C-L>', '<Right>')
keymap({'i', 'c'}, '<C-A>', '<Home>')
keymap({'i', 'c'}, '<C-E>', '<End>')
keymap({'i', 'c'}, '<C-D>', '<Del>')

-- Shortcuts to quickly exit and reload .vimrc
keymap('n', '<leader>av', ':vsplit $MYVIMRC<cr>')
keymap('n', '<leader>sv', ':source $MYVIMRC<cr>')

-- Enter command and search mode quickly and when in SE input mode
keymap('n', ';', ':')
keymap('n', 'ö', ':')
keymap('n', '-', '/')

-- Wrapped lines goes down/up to next row, rather than next line in file.
keymap('n', 'j', 'gj')
keymap('n', 'k', 'gk')

-- Yank from the cursor to the end of the line, to be consistent with C and D.
keymap('n', 'Y', 'y$')

-- Toggle search element highlight
keymap('n', '<leader>/', ':set invhlsearch<cr>')
--
-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP')

-- Visual shifting (does not exit Visual mode)
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- Allow using the repeat operator with a visual selection (!)
-- http://stackoverflow.com/a/8064607/127816
keymap('v', '.', ':normal .<cr>')

-- Adjust viewports to the same size
keymap('n', '<leader>=', '<C-w>=')

