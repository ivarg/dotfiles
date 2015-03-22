# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

unalias rm
unalias gcc

## Set CDPATH
cdpath=( . $GOPATH/src/github.com $GOPATH/src/github.com/ivarg $GOPATH/src )
export CDPATH

# My emacs aliases
alias emacs="emacsclient -nc &"
alias emacsd="/Applications/Emacs.app/Contents/MacOS/Emacs --daemon &"
alias emacsc="/Applications/Emacs.app/Contents/MacOS/Emacs &"
alias killemacs='emacsclient -e "(kill-emacs)"'

## Why would I want shared session history?
unsetopt share_history

