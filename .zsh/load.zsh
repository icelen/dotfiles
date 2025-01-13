source ~/.zsh/colors.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/basic.zsh
source ~/.zsh/history.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/export.zsh
source ~/.zsh/zplug.zsh
# Tmuxinator complete file
# source ~/bin/tmuxinator.zsh
source ~/.zsh/setopt.zsh

# eval
eval "$(/opt/homebrew/bin/pyenv init -)"
eval "$(zoxide init zsh)"
eval "$(thefuck --alias)"
eval "$(starship init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
