
## Golang stuff
## Homebrew way
GOVERSION=$(brew list go | head -n 1 | cut -d '/' -f 6)
export GOROOT=$(brew --prefix)/Cellar/go/$GOVERSION/libexec
## Source way
## export GOROOT=~/Utveckling/go-tip

export GOPATH=~/Utveckling/golang
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

## Ruby gems
export PATH=$PATH:/usr/local/Cellar/ruby/2.0.0-p247/bin

## Docker host URL
export DOCKER_HOST=tcp://localhost:4243

