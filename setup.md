# Setup

## Karabiner

Link this file to `~/Library/Application\ Support/Karabiner/private.xml`
Also, need to actually activate the settings manually

Input source shortcuts
`ln -s ~/dotfiles/KeyRemap4MacBook.xml ~/Library/Application\ Support/Karabiner/private.xml`

## osx

Remap Caps lock key to Control in SystemPreferences>Keyboard>Special Keys

## How to enable double tap and drag?

http://www.tech-recipes.com/rx/46308/mac-os-x-maverick-re-enable-tap-and-drag-on-a-trackpad-or-touchpad/

## Vim

- compile youcompleteme
- install ctags
- install powerline font
- setup mattn/gist-vim, see :h gist-vim-setup

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

