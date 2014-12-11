# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source Z
. `brew --prefix`/etc/profile.d/z.sh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias emacs="emacsclient -nc &"
alias emacsd="/Applications/Emacs.app/Contents/MacOS/Emacs --daemon &"
alias emacsc="/Applications/Emacs.app/Contents/MacOS/Emacs &"
alias killemacs='emacsclient -e "(kill-emacs)"'

alias mongod='mongod --config /usr/local/etc/mongod.conf'

## Why would I want shared session history?
unsetopt share_history

## Set CDPATH
cdpath=( . $GOPATH/src/github.com/ivarg $GOPATH/src )
export CDPATH

