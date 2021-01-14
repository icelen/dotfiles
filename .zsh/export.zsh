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
export EVENT_NOKQUEUE=1
export RANGER_LOAD_DEFAULT_RC=true
### LESS ###
# Enable syntax-highlighting in less.
# brew install source-highlight
# First, add these two lines to ~/.bashrc
export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS=" -R "

export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin:/opt/twitter_mde/bin" # Add RVM to PATH for scripting
export PATH="/Users/lcen/.rvm/gems/ruby-2.6.3/bin:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Use ripgrep for FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
