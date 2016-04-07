alias vim=nvim
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias rcd='ranger-cd'
alias rg='ranger'
alias bk='cd $OLDPWD'
alias by='byobu-tmux'
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -AF'
alias lt='ls -t'
alias l='ls -CF'
alias lc='ls -l | wc -l'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert

alias matlabno="matlab -nodesktop -nosplash -nojvm"
alias python="ipython"
# alias shortcut='gnome-desktop-item-edit ~/Desktop/ --create-new'
# alias tmux="TERM=screen-256color-bce tmux -2"
alias howdoi="howdoi -c -n 3"
alias -g L="|less" # Write L after a command to page through the output.
alias -g NULL="> /dev/null 2>&1" # You get the idea.
alias -s py=vim
alias -s m=vim
alias -s txt=vim
alias -s log=vim
# alias v='f -e vim'
# alias a='fasd -a'        # any
# alias s='fasd -si'       # show / search / select
# alias d='fasd -d'        # directory
# alias f='fasd -f'        # file
# alias sd='fasd -sid'     # interactive directory selection
# alias sf='fasd -sif'     # interactive file selection
# alias z='fasd_cd -d'     # cd, same functionality as j in autojump
# alias zz='fasd_cd -d -i'
alias fe='vim -p $(fzf -m)'
# servers
alias chicago="ssh lcen@chicago.cs.purdue.edu -t 'cd /scratch8/lcen;zsh'"
alias km="ssh lcen@kunming.cs.purdue.edu -t 'cd /scratch8/lcen;zsh'"
alias nb="ssh lcen@ningbo.cs.purdue.edu -t 'cd /scratch8/lcen;zsh'"
alias sj="ssh lcen@sanjose.cs.purdue.edu -t 'cd /scratch8/lcen;zsh'"
alias mc18="ssh lcen@mc18.cs.purdue.edu -t 'zsh'"
alias nest="ssh -R 22088:localhost:22 lcen@hadoopnest1"
alias abusenest="ssh -R 22288:localhost:22 -t abuse@hadoopnest1"
alias vnote='vim -c Geeknote'
alias marked='open -a Marked\ 2'

# trash
# alias rm=trash
# alias remove='/bin/rm'
