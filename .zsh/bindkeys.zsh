# bindkey '^[[A' up-line-or-search
# bindkey '^[[B' down-line-or-search
# bindkey '^R' history-incremental-pattern-search-backward
bindkey -M viins 'jj' vi-cmd-mode

# bind UP and DOWN arrow keys
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down]]']]'
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
