# Some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# I often use Ruff
ruff_typechecking() {
    ruff check "$@" --select=TCH --exclude=tests
}

ruff_annotations() {
    ruff check "$@" --select=ANN,RUF012 --ignore=ANN101,ANN102,ANN401 --exclude=tests
}

ruff_imports() {
    ruff check "$@" --select=I001,F401 --exclude=tests
}

ruff_docstrings() {
    ruff check "$@" --select=D --ignore=D203,D212 --exclude=tests
}

alias commit="git commit"
alias amend="git add . && git commit --am --no-edit"
alias push="git push"

retreat() {
    backoff "HEAD~$1"
}

backoff() {
    git push --force-with-lease origin "$1:$(git rev-parse --abbrev-ref HEAD)"
}
