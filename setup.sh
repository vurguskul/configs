#!/bin/bash

if [ -f $HOME/.tmux.conf ]; then
    echo "Existing .tmux.conf was found. Moving to .tmux.conf_bak ...!"
    mv ~/.tmux.conf ~/.tmux.conf_bak
fi

if [ -f .$HOMEvimrc ]; then
    echo "Existing .vimrc  was found. Moving to .vimrc_bak ...!"
    mv $HOME/.vimrc $HOME/.vimrc_bak
fi

echo "Creating links..."
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s $DIR/tmux.conf ~/.tmux.conf
ln -s $DIR/vimrc ~/.vimrc

echo "Installing plugin managers..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm



