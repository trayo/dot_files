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
alias fetch="git fetch origin master"
alias rebase="git rebase origin/master"
alias rebasi="git rebase -i origin/master"
alias fere="fetch && rebase"
alias feri="fetch && rebasi"
alias cont="git rebase --continue"
alias skip="git rebase --skip"
alias abort="git rebase --abort"


# projects
alias list="cd ~/turing/projects/mv_listr"
alias gamin="cd ~/workspace/where_is_denver_board_game_night"
alias gomast="cd ~/go/src/github.com/trayo/go_mastermind"


# rails
alias r="rails"
alias railsn="rails new -T --database=postgresql --skip-turbolinks"
alias rs="rails s"
alias rc="rails c"
alias routes="rake routes"
alias precom="rake assets:precompile"


# files
alias readme="vim README.md"
alias gf="vi Gemfile"
alias gemfile="vim Gemfile"
alias rf="vi Rakefile"
alias ig="vi .gitignore"


# database
alias dbreset="rake db:reset"
alias dbreste="rake db:reset"
alias dbsetup="rake db:setup"
alias dbdrop="rake db:drop"
alias dbcreate="rake db:create"
alias dbmig="rake db:migrate"
alias dbseed="rake db:seed"
alias dbroll="rake db:rollback"


# spec
alias spec="rspec"
alias spush="spec && push"


# bin spring
alias dospring="bundle exec spring binstub --all"
alias br='bin/rails'
alias brc='bin/rails c'
alias brs='bin/rails s'
alias brk='bin/rake'
alias bs='bin/rspec'


# ember
alias ems="ember server -p 3000"
alias npmbow="npm i && bower i"


# exercism
alias exer="cd ~/exercism"
alias es="exercism submit"
alias ef="exercism fetch"


# simplecov
alias cov="open coverage/index.html"
alias dcov="rm -rf coverage/"


# heroku
alias h="heroku"
alias hr="heroku run"
alias hrr="heroku run rake"
alias hp="git push heroku master"


# golang
alias gobench="go test -bench ."


# misc
alias be="bundle exec"
alias la="l -a"
alias me="open http://github.com/trayo"
alias reload="source ~/.bash_profile"
alias vimsnips="cd ~/.vim/bundle/vim-snippets/snippets"
alias fix_postgres="rm ~/Library/Application\ Support/Postgres/var-9.3/postmaster.pid"
alias vundle="vim +PluginInstall +qall"


#mame
alias domame="clear && cd ~/mame && mame -rompath ~/mame/roms -multikeyboard"
alias tet="clear && cd ~/mame && mame tgm2p -rompath ~/mame/roms -multikeyboard"


# typos
alias shh="ssh"
alias eit="exit"
alias gingko="ginkgo"


# fancy ls command
# -l  long format
# -F  / after dirs, * after exe, @ after symlink
# -G  colorize
# -g suppress owner
# -o suppress group
# -h humanize sizes
# -q print nongraphic chars as question marks
alias ll="ls -lFGgohqa"
alias l="ls -lFGgohqa"


########## functions ##########

# docker
function docker_env {
  eval $(docker-machine env)
}
alias delete_unused_images="docker images | ag -o '(<none>\s*){2}[\S]*\s' | ag -o '[a-z0-9]+(?=\s)' | xargs docker rmi -f"

# overrides default cd to send alias l afterwards
function cd {
  command cd "$@" && ll
}

# easy cd ../../.. alias
function .. {
  cd ../$1/$2/$3
}

# clone a repo and cd into it
function clone {
  git clone $1 && cd $(basename ${1%.*})
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
