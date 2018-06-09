export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR='nvim'
export VISUAL='nvim'
CDPATH=:$HOME
export CDPATH
# by default: export WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
# # we take out the slash, period, angle brackets, dash here.
export WORDCHARS='*?_[]~=&;!#$%^(){}'
export FZF_DEFAULT_COMMAND='ag -g ""'
export GTAGSCONF=/opt/twitter/share/gtags/gtags.conf
export GTAGSLABEL=ctags
export EVENT_NOKQUEUE=1
export RANGER_LOAD_DEFAULT_RC=true
### LESS ###
# Enable syntax-highlighting in less.
# brew install source-highlight
# First, add these two lines to ~/.bashrc
export LESSOPEN="| /opt/twitter/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "
alias less='less -m -N -g -i -J --underline-special --SILENT'
alias more='less'
