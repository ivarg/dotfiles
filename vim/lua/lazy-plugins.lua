local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "core.plugins" },
        { import = "coding"},
    },
})

vim.keymap.set("n", "<leader>z", "<cmd>:Lazy<cr>", { desc = "Plugin Manager" })

--[[
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Plugins can have post-install/update hooks
  --use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  --use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use 'nanotech/jellybeans.vim'
  use {
      'preservim/nerdtree',
      requires = {{'Xuyuanp/nerdtree-git-plugin'}, {'ryanoasis/vim-devicons'}}
  }

  use 'williamboman/mason.nvim'

  use {
      'neovim/nvim-lspconfig',
      --config = function() require'lspconfig'.pyright.setup{} end
  }

  use 'ctrlpvim/ctrlp.vim'
  use 'tacahiroy/ctrlp-funky'

  use 'mbbill/undotree' -- TODO configure
  use 'airblade/vim-gitgutter'

  use {
      'vim-airline/vim-airline',
      requires = { 'vim-airline/vim-airline-themes' }
  }

  use 'christoomey/vim-tmux-navigator'
  use 'scrooloose/nerdcommenter'


  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('treesitter') end,
    run = ':TSUpdate'
  }

  -- To revisit
  -- use 'easymotion/vim-easymotion'
  -- use 'mhinz/vim-signify'

  if packer_boostrap then
      require('packer').sync()
  end
end)


"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'vim-scripts/restore_view.vim'

"Plug 'mhinz/vim-signify'

" Text selection
Plug 'gcmt/wildfire.vim'
Plug 'terryma/vim-expand-region'

" General Programming
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

"Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'

" Go
" Plug 'fatih/vim-go'

" Rust
Plug 'rust-lang/rust.vim'

" Julia
Plug 'JuliaLang/julia-vim'

" React stuff
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'


" API Blueprint
Plug 'kylef/apiblueprint.vim'

Plug 'stephpy/vim-yaml'


]]--


