
ZSH_THEME="my2"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(vi-mode python zsh-syntax-highlighting cp screen vundle web-search command-not-found history-substring-search osx brew)


# User configuration
DEFAULT_USER=icelen
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
autoload select-word-style
select-word-style shell
# PS1='[%T] %n@%m:%~# '
REPORTTIME=10

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes
set -o vi
stty -ixon
