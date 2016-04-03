# load rbenv
eval "$(rbenv init -)"

# load bins
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# support for postgres
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

# git auto-completion
source ~/.git-completion.bash

# load my aliases
source ~/.aliases.bash
export CUSTOM_SCRIPTS="$HOME/workspace/dot_files/custom_scripts"
source "$CUSTOM_SCRIPTS/source_all"

# enables 'git hub'
eval "$(hub alias -s)"

# Load bin on path
export PATH="bin:$PATH"

# Go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# vim4life
export EDITOR="vim"

# load fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Prompt
function parse_git_branch {
  branch=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
  if [ "HEAD" = "$branch" ]; then
    echo "(no branch)"
  else
    echo "$branch"
  fi
}

function prompt_segment {
  # for colours: http://en.wikipedia.org/wiki/ANSI_escape_code#Colors
  # change the 37 to change the foreground
  # change the 45 to change the background
  if [[ ! -z "$1" ]]; then
    echo "\[\033[${2:-37};45m\]${1}\[\033[0m\]"
  fi
}

function build_mah_prompt {
  # time
  ps1="$(prompt_segment " \@ ")"

  # cwd
  ps1="${ps1} $(prompt_segment " \w ")"

  # git branch
  git_branch=`parse_git_branch`
  if [[ ! -z "$git_branch" ]]
  then
    ps1="${ps1} $(prompt_segment " $git_branch " 32)"
  fi

  # next line
  ps1="${ps1}\n🚀  "

  # set prompt output
  PS1="$ps1"
}

PROMPT_COMMAND='build_mah_prompt'

# load direnv
eval "$(direnv hook bash)"

# load fasd
eval "$(fasd --init auto)"
# unset s so that `brew install s` will still work
unalias s
