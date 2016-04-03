# rerun ruby scripts
function reruby {
  command rerun $1 -cb
}

# rerun for running lua tests
function relua {
  command rerun busted $1 -cbp "**/*.lua"
}

# rerun for running go tests
function rego {
  command rerun 'ginkgo -r' -cbp "**/*.go"
}

function regink {
  command rerun ginkgo -cbp "**/*.go"
}
