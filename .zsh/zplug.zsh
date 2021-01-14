export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Make sure to use double quotes
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
# zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "b4b4r07/zsh-vimode-visual", defer:3
# zplug "b4b4r07/enhancd", use:init.sh
zplug "wfxr/forgit"
zplug "mafredri/zsh-async", from:github
zplug "changyuheng/fz", defer:1
zplug "djui/alias-tips", from:github
zplug "icelen/pure", use:pure.zsh, from:github, as:theme
PURE_GIT_PULL=0

# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"

# Supports oh-my-zsh plugins and the like
zplug "plugins/vi-mode",   from:oh-my-zsh
zplug "plugins/colorize",   from:oh-my-zsh
zplug "plugins/command-not-found",   from:oh-my-zsh
zplug "plugins/osx",   from:oh-my-zsh
zplug "plugins/brew",   from:oh-my-zsh
zplug "plugins/z",   from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias tip: "