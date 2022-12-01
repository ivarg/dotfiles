-- Global settings
------------------
vim.g.mapleader = ","
vim.g.maplocalleader = "_"

vim.b.match_ignorecase = 1

vim.g.autoclose_vim_commentmode = 1

local opts = { noremap = true }

-- Escape
vim.keymap.set('i', 'jj', '<Esc>', opts)
vim.keymap.set('i', 'jk', '<Esc>', opts)

vim.keymap.set('', ';', ':', opts)

-- Swedish keyboard convenience
vim.keymap.set('', 'ö', ':', opts)
vim.keymap.set('', '+', '/', opts)

-- Wrapped lines goes down/up to next row, rather than next line in file.
vim.keymap.set('', 'j', 'gj', opts)
vim.keymap.set('', 'k', 'gk', opts)

-- Yank from the cursor to the end of the line, to be consistent with C and D.
vim.keymap.set('n', 'Y', 'y$', opts)

-- Toggle search element highlight
vim.keymap.set('n', '<leader>/', ':set invhlsearch<cr>', {})

-- Find merge conflict markers
vim.keymap.set('', '<leader>fc', [[/\v^[<\|=>]{7}( .*\|$)<cr>]], {})

-- Visual shifting (does not exit Visual mode)
vim.keymap.set('v', '<', '<gv', opt)
vim.keymap.set('v', '>', '>gv', opt)

-- Allow using the repeat operator with a visual selection (!)
-- http://stackoverflow.com/a/8064607/127816
vim.keymap.set('v', '.', ':normal .<cr>', opt)

-- close buffers
vim.keymap.set('n', '<C-W><C-W>', ':bd<CR>', opts)

vim.keymap.set('c', '<C-H>', '<Left>', opts)
vim.keymap.set('c', '<C-L>', '<Right>', opts)
vim.keymap.set('c', '<C-A>', '<Home>', opts)
vim.keymap.set('c', '<C-D>', '<Del>', opts)

vim.keymap.set('i', '<C-H>', '<Left>', opts)
vim.keymap.set('i', '<C-L>', '<Right>', opts)
vim.keymap.set('i', '<C-A>', '<Home>', opts)
vim.keymap.set('i', '<C-D>', '<Del>', opts)

-- Shortcuts to quickly exit and reload .vimrc
-- (maybe use vimpeccable to really unload and reload?)
vim.keymap.set('n', '<leader>av', ':vsplit $MYVIMRC<cr>', opts)
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<cr>', opts)

-- Shortcut for opening file
vim.keymap.set('n', '<leader>ew', ':e ', opts)

-- navigate location list 
vim.keymap.set('n', '<C-n>', ':lne<cr>', opts)
vim.keymap.set('n', '<C-m>', ':lp<cr>', opts)


vim.opt_global.completeopt = { 'menuone', 'noinsert', 'noselect' }
vim.opt_global.shortmess:remove('F')

-- Mappings.
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>fmt", vim.lsp.buf.format, opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)


-- Load plugins
require('plugins')

-- Vimscript remnants
vim.cmd([[
colorscheme jellybeans

" Use system clipboard
set clipboard+=unnamedplus
set undofile                                   " So is persistent undo ...
set cursorline                                 " Highlight current line
set number                                     " Line numbers on
set winminheight=0                             " Windows can be 0 line high
set ignorecase                                 " Case insensitive search
set smartcase                                  " Case sensitive when uc present
set wildmode=list:longest,full                 " Command mode <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]                  " Backspace and cursor keys wrap too
set scrolloff=3                                " Minimum lines to keep above and below cursor
set list                                       " Display whitespaces
set shiftwidth=4                               " Use indents of 4 spaces
set tabstop=4                                  " An indentation every four columns
set softtabstop=4                              " Let backspace delete indent
set expandtab                                  " Tabs are spaces, not tabs
set nojoinspaces                               " Prevents inserting two spaces after punctuation on a join (J)
set splitright                                 " Puts new vsplit windows to the right of the current
set splitbelow                                 " Puts new split windows to the bottom of the current
set hidden                                     " Allow buffer switching without saving
set statusline+=%#warningmsg#
set statusline+=%*

" Autocommands & functions
" Create non-existing directory on save
function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

" Restore cursor to file position in previous editing session
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

" Strip whitespace
function! StripTrailingWhitespace()
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" do the business:
	%s/\s\+$//e
	" clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction

" Write buffer when losing focus
autocmd BufLeave,FocusLost * silent! wall

" Strip trailing whitespace when writing buffer
" FileType matlab,markdown,c,cpp,java,go,javascript,python,rust,xml,yml
autocmd FileType matlab,markdown,c,cpp,java,go,javascript,javascipt.jsx,rust,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()

" Always switch to the current file directory
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
autocmd FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Javascript and Java files use indentation of 2
autocmd FileType javascript,java,json setlocal shiftwidth=2 tabstop=2

" Restore cursor to file position in previous editing session
augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
]])



-------------
-- Plugins --
-------------

-- Telescope
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


-- Mason
require('mason').setup()

-- nvim-lspconfig
require('lspconfig')['pyright'].setup{
 on_attach = on_attach,
 flags = lsp_flags,
}


-- nvim-cmp
local cmp = require("cmp")
cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
  },
  snippet = {
    expand = function(args)
      -- Comes from vsnip
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- None of this made sense to me when first looking into this since there
    -- is no vim docs, but you can't have select = true here _unless_ you are
    -- also using the snippet stuff. So keep in mind that if you remove
    -- snippets you need to remove this select
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    -- I use tabs... some say you should stick to ins-completion but this is just here as an example
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  }),
})


-- vim-airline
vim.cmd([[
" vim-airline
"
" Set configuration options for the statusline plugin vim-airline.
" Use the powerline theme and optionally enable powerline symbols.
" To use the symbols , , , , , , and .in the statusline
" segments add the following to your .vimrc.before.local file:
"   let g:airline_powerline_fonts=1
" If the previous symbols do not render for you then install a
" powerline enabled font.

" See `:echo g:airline_theme_map` for some more choices
" Default in terminal vim is 'dark'
let g:airline_powerline_fonts=1
let g:airline_theme = 'jellybeans'
"let g:airline_theme='dark'
" Short mode indicators
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
" No tabs
"let g:airline#extensions#tabline#enabled = 1

let g:tmuxline_powerline_separators = 1
]])

-- NERDTree
vim.cmd([[
map <C-e> :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

" Keep NERDTree open after opening a file
let NERDShutUp=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

" This is to solve a nerd-fonts rendering problem
autocmd FileType nerdtree setlocal nolist
]])

-- CtrlP
vim.cmd([[
let g:ctrlp_max_depth = 10
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\.git$\|\.hg$\|\.svn$',
	\ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

" CtrlP extensions
"let g:ctrlp_extensions = ['funky']
"funky
nnoremap <Leader>fu :CtrlPFunky<Cr>

]])

-- Undotree
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<cr>', {})
-- If undotree is opened, it is likely one wants to interact with it.
vim.g.undotree_SetFocusWhenToggle = 1


-- Scala
metals_config = require("metals").bare_config()
metals_config.init_options.statusBarProvider = "on"
metals_config.settings = {
    serverVersion = 'latest.snapshot',
    showImplicitArguments = true,
--    showImplicitConversionsAndClasses = true,
--    showInferredType = true,
}
-- metals_config.on_attach = on_attach

-- local metals = require('telescope').extensions.metals
-- vim.keymap.set('n', '<leader>cc', metals.commands, {})

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt" },
  callback = function()
    require("metals").initialize_or_attach({ metals_config })
  end,
  group = nvim_metals_group,
})


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
