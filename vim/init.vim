lua require("core.lazy")

""""""""""""""""""""""""""""
"" Settings

" Leader
let mapleader = ','

set smarttab
set expandtab                                  " Tabs are spaces, not tabs
set tabstop=4                                  " An indentation every four columns
set softtabstop=4                              " Let backspace delete indent
set shiftwidth=4                               " Use indents of 4 spaces
set number                                     " Line numbers on
set clipboard+=unnamedplus " Use system clipboard
set cursorline                                 " Highlight current line
set winminheight=0                             " Windows can be 0 line high
set ignorecase                                 " Case insensitive search
set smartcase                                  " Case sensitive when uc present
set wildmode=list:longest,full                 " Command mode <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]                  " Backspace and cursor keys wrap too
set scrolloff=2                                " Minimum lines to keep above and below cursor
set list                                       " Display whitespaces
set shortmess+=filmnrxoOt                      " Abbrev. of messages (avoids 'hit enter')
set virtualedit=onemore                        " Allow for cursor beyond last character
set showmatch                                  " Show matching brackets/parenthesis

" Escape
imap jj <esc><esc>
imap jk <esc><esc>

" Close current buffer without closing window
nnoremap <C-W><C-W> :bd<CR>

" Shortcut for opening file
map <leader>ew :e 

" Normal buffer movements
nnoremap <C-H> <C-W><Left>
nnoremap <C-L> <C-W><Right>
nnoremap <C-J> <C-W><Down>
nnoremap <C-K> <C-W><Up>


" Command buffer movements
cnoremap <C-H> <Left>
cnoremap <C-L> <Right>
cnoremap <C-A> <Home>
cnoremap <C-D> <Del>

" Input mode movements
inoremap <C-H> <Left>
inoremap <C-L> <Right>
inoremap <C-A> <Home>
inoremap <C-D> <Del>

" Shortcuts to quickly exit and reload .vimrc
nmap <leader>av :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" No shift when doing ex commands
nnoremap ; :

" Swedish keyboard convenience
nnoremap ö :
nnoremap - /

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Toggle search element highlight
nmap <silent> <leader>/ :set invhlsearch<CR>

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<cr>

" Adjust viewports to the same size
map <Leader>= <C-w>=

"" Autocommands
""""""""""""""""

" Write buffer when losing focus
autocmd BufLeave,FocusLost * silent! wall

" Strip trailing whitespace when writing buffer
autocmd FileType matlab,markdown,c,cpp,java,go,javascript,javascipt.jsx,rust,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()

" Always switch to the current file directory
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

