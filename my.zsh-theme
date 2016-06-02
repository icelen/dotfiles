local ret_status="%(?:%{$fg_bold[green]%}@ :%{$fg_bold[red]%}@ %s)"

EMOJI=(💩 🐦 🚀 🐞 🎨 🍕 🐭 👽 ☕️ 🔬 💀 🐷 🐼 🐶 🐸 🐧 🐳 🍔 🍣 🍻 🔮 💰 💎 💾 💜 🍪 🌞 🌍 🐌 🐓 🍄 )

function random_emoji {
  echo -n "$EMOJI[$RANDOM%$#EMOJI+1] "
}

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


# Vim Mode indicator from http://paulgoscicki.com/archives/2012/09/vi-mode-indicator-in-zsh-prompt/
vim_ins_mode="%{$fg[cyan]%}⚔%{$reset_color%}"
vim_cmd_mode="%{$fg[green]%}⚓%{$reset_color%}"
VIMODE=$vim_ins_mode
function zle-keymap-select {
    VIMODE="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
    zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
      VIMODE=$vim_ins_mode
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode indicator, while in fact you would be in INS mode
# Fixed by catching SIGINT (C-c), set vim_mode to INS and then repropagate the SIGINT, so if anything else depends on it, we will not break it
# Thanks Ron! (see comments)
function TRAPINT() {
      vim_mode=$vim_ins_mode
        return $(( 128 + $1 ))
}

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
PROMPT='$(random_emoji)%{$fg[yellow]%}${me}${ret_status}%{$fg_bold[green]%}%p %{$fg[red]%}${RANGERPROMPT}%{$fg_bold[blue]%}%~%{$fg_bold[blue]%} $(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}
${VIMODE} ➜  '
