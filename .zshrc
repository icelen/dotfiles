source ~/.zsh/colors.zsh
source ~/.zsh/setopt.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/history.zsh
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.utf8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# eval "$(fasd --init auto)"

ZSH_THEME="my2"



ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(vi-mode python zsh-syntax-highlighting cp screen vundle web-search command-not-found history-substring-search)

source $ZSH/oh-my-zsh.sh

# User configuration
DEFAULT_USER=icelen
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
autoload select-word-style
select-word-style shell
# PS1='[%T] %n@%m:%~# '
REPORTTIME=10
export PATH="$HOME/bin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/texlive/2014/bin/universal-darwin:."

# from .bashrc
# case $- in
#     *i*) ;;
#       *) return;;
# esac



# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
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

export EDITOR='vim'
export VISUAL='vim'
CDPATH=:$HOME
export CDPATH

