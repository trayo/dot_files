source ~/.profile

export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# support for postgres
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

# git auto-completion
source ~/.git-completion.bash

# load my aliases
source ~/.aliases.bash

# enables 'git hub'
eval "$(hub alias -s)"

# Load nvm so you can access 'node'
source ~/.nvm/nvm.sh

# Load bin on path
export PATH="bin:$PATH"

# Go path
export GOROOT=$HOME/go
export GOPATH=/usr/local/go/
export PATH=$PATH:$GOPATH/bin

# Take you to the dir of a file in a gem. e.g. `2gem rspec`
2gem () {
  cd "$(dirname $(gem which $1))"
}

# give the fullpaths of files passed in argv or piped through stdin
function fullpath {
  ruby -e '
    $stdin.each_line { |path| puts File.expand_path path }  if ARGV.empty?
    ARGV.each { |path| puts File.expand_path path }         unless ARGV.empty?
  ' "$@"
}

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

