#!/bin/bash

if [ -f $HOME/.tmux.conf ]; then
    echo "Existing .tmux.conf was found. Moving to .tmux.conf_bak ...!"
    mv ~/.tmux.conf ~/.tmux.conf_bak
fi

if [ -f $HOME/.vimrc ]; then
    echo "Existing .vimrc  was found. Moving to .vimrc_bak ...!"
    mv $HOME/.vimrc $HOME/.vimrc_bak
fi

if [ -f $HOME/.zshrc ]; then
    echo "Existing .zshrc  was found. Moving to .zshrc_bak ...!"
    mv $HOME/.zshrc $HOME/.zshrc_bak
fi

echo "Installing zsh..."
if ! command -v zsh >/dev/null 2>&1; then
    if command -v pacman >/dev/null 2>&1; then
        sudo pacman -S --needed --noconfirm zsh
    elif command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update && sudo apt-get install -y zsh
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y zsh
    elif command -v brew >/dev/null 2>&1; then
        brew install zsh
    else
        echo "No supported package manager found. Please install zsh manually."
    fi
else
    echo "zsh is already installed."
fi

echo "Installing oh-my-zsh..."
if [ ! -d $HOME/.oh-my-zsh ]; then
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh-my-zsh is already installed."
fi

echo "Creating links..."
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s $DIR/tmux.conf ~/.tmux.conf
ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR/zshrc ~/.zshrc

echo "Installing plugin managers..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if command -v zsh >/dev/null 2>&1 && [ "$SHELL" != "$(command -v zsh)" ]; then
    echo "Setting zsh as the default shell..."
    chsh -s "$(command -v zsh)"
fi
