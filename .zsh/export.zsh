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
export XDG_CONFIG_HOME=$HOME/.config
### LESS ###
# Enable syntax-highlighting in less.
# brew install source-highlight
# First, add these two lines to ~/.bashrc
export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS=" -R "

# Use ripgrep for FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# CONSUL local
# export CONSUL_HTTP_HOST=10.231.233.242
# export CONSUL_HTTP_PORT=2280

# monorepo local test
export IS_UNIT_TEST_ENV=1

# Path
export TEXBIN=/Library/TeX/texbin
export GOPATH=$HOME/go
export GOROOT=/opt/homebrew/opt/go/libexec
export GOBIN=$GOPATH/bin
export GOPRIVATE="*.byted.org,*.everphoto.cn,git.smartisan.com"
export PYTHONBIN=/opt/homebrew/Cellar/python@3.13/3.13.1/bin
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH=/usr/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$GOROOT/bin:$GOBIN:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$TEXBIN:$PATH
export PATH=$PYTHONBIN:$PATH
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH=/Users/bytedance/.local/bin:$PATH
export PATH="/opt/homebrew/opt/protobuf@3/bin:$PATH"
export PATH="/opt/homebrew/opt/go@1.20/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH
