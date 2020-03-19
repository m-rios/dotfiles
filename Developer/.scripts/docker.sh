docker-bash() {
    docker exec -it $1 bash
}

alias ros="~/Developer/.scripts/ros"
alias dc="docker-compose -f $HOME/Developer/base-platform/docker-compose.yml"
alias dcl="dc logs -f --tail=100"
alias dcu="dc up -d"
alias dcub="dcu --build"
alias dcd="dc down"
alias docker-prune="docker system prune -a --volumes"
alias docker-clean="docker rmi $(docker images -f "dangling=true" -q)"
