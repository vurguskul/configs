# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Custom theme: ~/.oh-my-zsh/custom/themes/configs.zsh-theme
# (setup.sh symlinks it from this repo). Shows folder, git branch, time.
ZSH_THEME="configs"

# Plugins live in ~/.oh-my-zsh/plugins/* and ~/.oh-my-zsh/custom/plugins/*
plugins=(git tmux)

source "$ZSH/oh-my-zsh.sh"

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt share_history

# Editor
export EDITOR="vim"
export VISUAL="vim"

# Local overrides, not tracked in the repo
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
