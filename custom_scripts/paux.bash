# shortcut for ps aux
function paux {
  ps aux | ag $1 | sed /ag\ $1/d | ag $1
}
