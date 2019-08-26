# load rbenv
# export PATH="$HOME/.rbenv/shims:$PATH"
# eval "$(rbenv init -)"

# load bins
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# support for postgres
# export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

# git auto-completion
source ~/.git-completion.bash

# load my aliases
export CUSTOM_SCRIPTS="$HOME/workspace/dot_files/custom_scripts"
source "$CUSTOM_SCRIPTS/source_all"

# enables 'git hub'
eval "$(hub alias -s)"

# vim4life
export EDITOR="vim"

# load prompt
PROMPT_COMMAND='build_prompt'

# load direnv
eval "$(direnv hook bash)"

# fast key repeat rate, requires reboot to take effect
# defaults write ~/Library/Preferences/.GlobalPreferences KeyRepeat -int 1
# defaults write ~/Library/Preferences/.GlobalPreferences InitialKeyRepeat -int 15

# load z
source /usr/local/etc/profile.d/z.sh
