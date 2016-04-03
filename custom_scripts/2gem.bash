# Take you to the dir of a file in a gem. e.g. `2gem rspec`
2gem () {
    cd "$(dirname $(gem which $1))"
}
