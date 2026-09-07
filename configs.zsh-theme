# configs.zsh-theme
# Current folder name, git branch (if any), 24h time with seconds.
# The final prompt char (❯) turns red when the last command exited non-zero.

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{$fg[cyan]%}%1~%{$reset_color%}$(git_prompt_info) %F{242}%*%f %(?.%{$fg[green]%}.%{$fg[red]%})❯%{$reset_color%} '
