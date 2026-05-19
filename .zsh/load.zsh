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

# Go version — auto-switch based on go.mod, only when in a Go project
_gvm_auto_switch() {
  [[ -f go.mod ]] || return
  local go_ver target
  go_ver=$(awk '/^go /{print $2}' go.mod | grep -oE '^[0-9]+\.[0-9]+')
  target="go${go_ver}"
  if gvm use "$target" >/dev/null 2>&1; then
    echo "gvm use $target"
  else
    gvm use go1.24.13 >/dev/null 2>&1
    echo "gvm use $target (not found, fell back to go1.24.13)"
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd _gvm_auto_switch
_gvm_auto_switch
