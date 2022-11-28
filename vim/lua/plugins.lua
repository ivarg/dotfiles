
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd([[packadd packer.nvim]])

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end


local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Plugins can have post-install/update hooks
  --use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  --use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use { 'williamboman/mason.nvim' }
  use {
      'neovim/nvim-lspconfig',
      --config = function() require'lspconfig'.pyright.setup{} end
  }

  use 'nanotech/jellybeans.vim'
  use {
      'preservim/nerdtree',
      requires = {{'Xuyuanp/nerdtree-git-plugin'}, {'ryanoasis/vim-devicons'}}
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

