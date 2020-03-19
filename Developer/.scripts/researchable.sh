# Researchable
MVP_PATH="${HOME}/Developer/base-platform"
alias mvp="cd ${MVP_PATH}"
alias drails="${MVP_PATH}/bin/be rails"
alias dbundle="${MVP_PATH}/bin/bundle"
alias dbe="${MVP_PATH}/bin/be"
alias rspec="dbe rspec"
alias jest="dbe yarn run jest"
alias rubocop="dbe rubocop -a"
alias nuke="drails db:drop && drails db:create && drails db:migrate && drails db:seed"

alias miniserver="python -m SimpleHTTPServer 8000"

update_kb_token() {
    cp ~/Downloads/artifacts/output/config ~/.kube
    token=$(cat ~/Downloads/artifacts/gitlab/service_token | tail -n 1 | cut -f 7 -d ' ')
    echo $token | pbcopy
    echo $token
    rm -rf ~/Downloads/artifacts
}

export PATH=$PATH:$MVP_PATH/bin
