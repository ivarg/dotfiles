
## Golang stuff
## Homebrew way
GOVERSION=$(brew list go | head -n 1 | cut -d '/' -f 6)
export GOROOT=$(brew --prefix)/Cellar/go/$GOVERSION/libexec
## Source way
## export GOROOT=~/Utveckling/go-tip

export GOPATH=$HOME
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH:

## Ruby gems
export PATH=$PATH:/usr/local/Cellar/ruby/2.0.0-p247/bin

## Haskell Cabal
export PATH=$PATH:$HOME/Library/Haskell/bin

## Docker host URL
export DOCKER_HOST=tcp://192.168.59.103:2375

