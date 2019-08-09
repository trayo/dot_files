########## aliases ##########

# open bash profile and vimrc in vim
alias bashp="vim ~/.bash_profile"
alias vimrc="vim ~/.vimrc"
alias als="vim $CUSTOM_SCRIPTS/aliases.bash"
alias plugins="vim ~/.vim/vundle/plugins.vim"
alias vi="vim"


# git
alias gs="git status"
alias gst="git status"
alias gdi="git diff --patience --ignore-space-change"
alias gdic="git diff --cached"
alias gdc="git commit"
alias gc="git checkout"
alias gb="git branch"
alias ga="git add"
alias gaa="git add -A"
alias gap="git add -p"
alias gh="git hist"
alias fp="git push -f"
alias gcv="git commit -v"
alias gcm="git commit -m"
alias gcb="git checkout -b"
alias grv="git remote -v"
alias amend="git commit --amend"
alias pull="git pull"
alias pulreq="git pull-request"
alias master="git checkout master"


# rebase
alias continue="git rebase --continue"
alias skip="git rebase --skip"
alias abort="git rebase --abort"


# misc
alias me="open http://github.com/trayo"
alias reload="source ~/.bash_profile"
alias vimsnips="cd ~/.vim/bundle/vim-snippets/snippets"
alias vundle="vim +PluginInstall +qall"
alias de="direnv edit ."


# typos
alias shh="ssh"
alias eit="exit"
alias gingko="ginkgo"
alias cim="vim"
alias bim="vim"


# fancy ls command
# -l  long format
# -F  / after dirs, * after exe, @ after symlink
# -G  colorize
# -g suppress owner
# -o suppress group
# -h humanize sizes
# -q print nongraphic chars as question marks
alias ll="ls -lFGgohqa"
alias l="ll"


########## functions ##########

# overrides default cd to send alias l afterwards
function cd {
  command cd "$@" && ll
}

# easy cd ../../.. alias
function .. {
  cd ../$1/$2/$3
}

# call "push" in terminal to automatically push the current branch
function push {
  git push -u origin $(parse_git_branch) $1
}

# easy update dot files
alias udf=updatedotfiles
function updatedotfiles {
  # cd and preserve last location
  pushd ~/workspace/dot_files > /dev/null

  git add .

  # if there are no arguments, use a default message
  # otherwise you can supply a message with '$ updatedotfiles "your message here"'
  if [ $# -eq 0 ]; then
    git commit -m "updated dot files"
  else
    git commit -m "$1"
  fi

  git push
  popd > /dev/null
}
