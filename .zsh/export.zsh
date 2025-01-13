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


export PROG=hertztool;source /opt/homebrew/Cellar/zplug/2.4.2/autoload/hertztool

# Path
export TEXBIN=/Library/TeX/texbin
export GOPATH=$HOME/go
export GOROOT=/opt/homebrew/opt/go/libexec
export GOBIN=$GOPATH/bin
export GOPRIVATE="*.byted.org,*.everphoto.cn,git.smartisan.com"
export PYTHONBIN=/opt/homebrew/opt/python@3.11/libexec/bin
export JAVA_HOME=$(/usr/libexec/java_home)
export PKG_CONFIG_PATH=/Users/bytedance/.pyenv/versions/3.7.17/lib/pkgconfig
export PATH=$GOROOT/bin:$GOBIN:$PATH
export PATH=$JAVA_HOME/bin:$GOPATH/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$TEXBIN:$PATH
export PATH=$PYTHONBIN:$PATH
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH=/Users/bytedance/.local/bin:$PATH
export PATH="/opt/homebrew/opt/protobuf@3/bin:$PATH"
