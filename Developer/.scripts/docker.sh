docker-bash() {
    docker exec -it $1 bash
}

ros() {
    docker-compose exec ros $*
}

alias ros="~/Developer/.scripts/ros"
alias dc=docker-compose
alias dcl="dc logs -f"
alias dcu="dc up -d"
