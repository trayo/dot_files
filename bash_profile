# load rbenv
# export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

# load bins
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# support for postgres
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

# git auto-completion
source ~/.git-completion.bash

# load my aliases
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

# load prompt
PROMPT_COMMAND='build_mah_prompt'

# load direnv
eval "$(direnv hook bash)"

# load bash-completion from brew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# load fasd
eval "$(fasd --init auto)"
# unset s so that `brew install s` will still work
unalias s

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
