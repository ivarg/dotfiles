#!/usr/bin/env bash

# This script sets up the zsh environment.
# Requires git to be installed.


#DOT_HOME=$HOME
DOT_HOME=$HOME/dot_test

DOTFILES=$DOT_HOME/dotfiles
#DOTFILES_REPO=https://github.com/ivarg/dotfiles.git
DOTFILES_REPO=git@github.com:ivarg/dotfiles.git
PREZTO_HOME=$DOTFILES/zsh/prezto

set -e

function clone_dotfiles {
    if [[ ! -d $DOTFILES ]]; then
        git clone $DOTFILES_REPO $DOTFILES
        git submodule update --init
    fi
}

function init_submodules {
    cd $DOTFILES
    git submodule update --init
}

function check_dotfiles {
    cd $DOT_HOME
    if [[ -h ".zshrc" || -e ".zshrc" ]]; then
        echo ".zshrc already exists"
        return 1
    fi
}

function setup_prezto {
    cd $PREZTO_HOME
    git checkout ivar
    git submodule update --init

    ln -s $PREZTO_HOME/runcoms/zlogin $DOT_HOME/.zlogin
    ln -s $PREZTO_HOME/runcoms/zlogout $DOT_HOME/.zlogout
    ln -s $PREZTO_HOME/runcoms/zpreztorc $DOT_HOME/.zpreztorc
    ln -s $PREZTO_HOME/runcoms/zprofile $DOT_HOME/.zprofile
    ln -s $PREZTO_HOME/runcoms/zshenv $DOT_HOME/.zshenv
    ln -s $PREZTO_HOME/runcoms/zshrc $DOT_HOME/.zshrc
}


clone_dotfiles
check_dotfiles
init_submodules
setup_prezto


