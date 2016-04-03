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

# load prompt
PROMPT_COMMAND='build_mah_prompt'

# load direnv
eval "$(direnv hook bash)"

# load fasd
eval "$(fasd --init auto)"
# unset s so that `brew install s` will still work
unalias s
