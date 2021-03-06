# -------------------------------------------------------------------
# compressed file expander
# (from https://github.com/myfreeweb/zshuery/blob/master/zshuery.sh)
# -------------------------------------------------------------------
ex() {
    if [[ -f $1 ]]; then
        case $1 in
          *.tar.bz2) tar xvjf $1;;
          *.tar.gz) tar xvzf $1;;
          *.tar.xz) tar xvJf $1;;
          *.tar.lzma) tar --lzma xvf $1;;
          *.bz2) bunzip $1;;
          *.rar) unrar $1;;
          *.gz) gunzip $1;;
          *.tar) tar xvf $1;;
          *.tbz2) tar xvjf $1;;
          *.tgz) tar xvzf $1;;
          *.zip) unzip $1;;
          *.Z) uncompress $1;;
          *.7z) 7z x $1;;
          *.dmg) hdiutul mount $1;; # mount OS X disk images
          *) echo "'$1' cannot be extracted via >ex<";;
      esac
    else
        echo "'$1' is not a valid file"
    fi
}

# -------------------------------------------------------------------
# any function from http://onethingwell.org/post/14669173541/any
# search for running processes
# -------------------------------------------------------------------
any() {
    emulate -L zsh
    unsetopt KSH_ARRAYS
    if [[ -z "$1" ]] ; then
        echo "any - grep for process(es) by keyword" >&2
        echo "Usage: any " >&2 ; return 1
    else
        ps xauwww | grep -i --color=auto "[${1[1]}]${1[2,-1]}"
    fi
}

# -------------------------------------------------------------------
# display a neatly formatted path
# -------------------------------------------------------------------
path() {
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
           sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
           sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
           sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
           sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
           print }"
}

gitroot() {
    local rootdir=$(git root 2>/dev/null)
    if [[ -d "$rootdir" ]] ; then
        echo $rootdir
    else
        echo .
    fi
}

ranger-cd() {
    tempfile='/tmp/chosendir'
    ranger --choosedir="$tempfile" "${@:-$(pwd)}" < $TTY
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
    ls
}

# fzf related functions
# fh - repeat history
fh() {
    print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf -i +s -x --tac | sed 's/ *[0-9]* *//')
}

cbr() {
  local branches branch
  branches=$(git branch) &&
  branch=$(echo "$branches" | tail -r | fzf +m) &&
  git checkout $(echo "$branch" | sed "s/.* //")
}

fbr() {
  local branches branch
  branches=$(git branch) &&
  branch=$(echo "$branches" | tail -r | fzf -m) &&
  echo "$branch" | sed "s/.* //"
}
# fda() {
#   local dir
#     dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
# }
# fshow - git commit browser
fshow() {
  local out sha q
  while out=$(
      git log --graph --color=always \
          --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
      fzf --ansi --multi --no-sort --reverse --query="$q" --print-query); do
    q=$(head -1 <<< "$out")
    while read sha; do
      git show --color=always $sha | less -R
    done < <(sed '1d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
  done
}

vnest() {
    allButLast=${@:1:${#}-1}
    # echo $allButLast
    last=${@[$#]}
    # echo $last
    vim $allButLast scp://lcen@hadoopnest1/$last
}


# bash's PROMPT_COMMAND
precmd() { eval "$PROMPT_COMMAND" }

rg() {
  if [ "$1" != "" ]; then
    if [ -d "$1" ]; then
      ranger "$1"
    else
      ranger $(z -e $1)
    fi
  else
    ranger
  fi
	return $?
}
