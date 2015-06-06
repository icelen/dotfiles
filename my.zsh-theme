local ret_status="%(?:%{$fg_bold[green]%}@ :%{$fg_bold[red]%}@ %s)"

function get_nr_jobs() {
    jobs | wc -l
}

if [ -n "$RANGER_LEVEL" ]; then RANGERPROMPT='R'; else RANGERPROMPT=''; fi
function prompt_ranger() {
  %{$fg[red]%}${RANGERPROMPT}%{$reset_color%}
}

if [[ -n $SSH_CONNECTION ]]; then
    me="[%m] %n"
elif [[ $LOGNAME != $USER ]]; then
    me="%n"
else
    me="%n"
fi


VIMODE='⚔'
function zle-keymap-select {
    VIMODE="${${KEYMAP/vicmd/⬡}/(main|viins)/⚔}"
    zle reset-prompt
}
zle -N zle-keymap-select

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚑ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%}◒ "

RPROMPT='%{$fg_bold[red]%}[$(get_nr_jobs)] %{$fg_bold[green]%}%*%{$reset_color%}'
PROMPT='%{$fg[yellow]%}${me}${ret_status}%{$fg_bold[green]%}%p %{$fg[red]%}${RANGERPROMPT}%{$fg_bold[blue]%}%~%{$fg_bold[blue]%} $(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}
${VIMODE} ➜  '
