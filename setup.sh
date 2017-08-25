#!/usr/bin/env bash

#set -e

# Install brew
echo "Installing Homebrew..."

if [[ -z $( which brew ) ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "  - Homebrew already installed"
fi


# Install git
echo "Installing git..."
if [[ -z $( which git ) ]]; then 
    brew install git
else
    echo "  - git already installed"
fi

# Install zsh
zsh/zsh.sh

