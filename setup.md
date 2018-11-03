# Setup

1. Terminal > run git > Install Command Line Tools
2. git clone https://github.com/ivarg/dotfiles.git .dotfiles
3. Install Karabiner to fix keymap stuff
	- make karabiner
4. Setup OSX (anything else besides Karabiner?)
	- Add US input source
5. make brew
	- This should install all brew stuff, incl. cask applications
6. Generate new ssh key for github
	- 
6. Applications to install (with brew cask?)
	- Evernote
	- Todoist
	- 1Password


## 1Password



## Ruby / RVM

Needed for some scripting (don't remember which now)

```
export PATH="$PATH:$HOME/.rvm/bin"
```

## osx

## How to enable double tap and drag?

http://www.tech-recipes.com/rx/46308/mac-os-x-maverick-re-enable-tap-and-drag-on-a-trackpad-or-touchpad/

## Zsh

```
cd ~/dotfiles/prezto
git checkout ivar
git submodule update --init

ln -s dotfiles/prezto/runcoms/zlogin .zlogin
ln -s dotfiles/prezto/runcoms/zlogout .zlogout
ln -s dotfiles/prezto/runcoms/zpreztorc .zpreztorc
ln -s dotfiles/prezto/runcoms/zprofile .zprofile
ln -s dotfiles/prezto/runcoms/zshenv .zshenv
ln -s dotfiles/prezto/runcoms/zshrc .zshrc
```

Extract API keys from 1password and add them to `.zshenv`.

## Vim

- compile youcompleteme
- install ctags
- install powerline font
- setup mattn/gist-vim, see :h gist-vim-setup

## Neovim

- alias vim=nvim
- link vim/vimrc to ~/.config/nvim/init.vim
- curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
- set ctrl-h to send escape sequence in iterm prefs (https://github.com/neovim/neovim/issues/2048#issuecomment-98307896) [workaround for bug]

## tmux

`brew install tmux`

Set TERM=xterm-256color in iTerm2
In vim, `:TmuxlineSnapshot ~/.tmux/tmuxline`

### plugin manager

`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

## homebrew

brew installs
- vim
- ack
- tmux
- reattach-to-user-namespace

