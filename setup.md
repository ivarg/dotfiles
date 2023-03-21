# Setup

- Some manual steps
    - Add US input source (can this be automated?)
    - Terminal > run git > Install Command Line Tools

- `cd ~; git clone https://github.com/ivarg/dotfiles.git .dotfiles`

- Install Karabiner to fix keymap stuff
    - make karabiner

- make brew
    - Install Homebrew and the initial set of programs and applications

- make git
    - Link global gitignore and gitconfig

- make vim
-- TODO: fix deoplete

- make zsh

- make iterm

- make tmux

- Generate new personal access token for github
    - To be able to push to https remotes


## JVM stuff

jenv is listed in Brewfile but sdkman needs its own installation


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

- setup mattn/gist-vim, see :h gist-vim-setup

## Neovim

- alias vim=nvim
- link vim/vimrc to ~/.config/nvim/init.vim
- set ctrl-h to send escape sequence in iterm prefs (https://github.com/neovim/neovim/issues/2048#issuecomment-98307896) [workaround for bug]
- For Python development with pyright: install the `pyenv-pyright` [plugin](https://github.com/alefpereira/pyenv-pyright) for pyenv

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

