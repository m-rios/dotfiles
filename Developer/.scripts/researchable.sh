# Researchable
WORKSPACE="${HOME}/Developer/researchable"
MVP_PATH="${WORKSPACE}/sdv/base-platform"
alias sdv="cd ${MVP_PATH}"
alias drails="bin/be rails"
alias dbundle="bin/bundle"
alias dbe="bin/be"
alias rspec="dbe rspec"
alias jest="dbe yarn run jest"
alias rubocop="dbe rubocop -a"
# alias kmaster="kubectl -n=sdv-mvp-master"
# alias kdevelop="kubectl -n=sdv-mvp-develop"
alias kmaster="k config use-context sdv-master"
alias kdefault="k config use-context do-ams3-sdv-k8s"
alias kdevelop="k config use-context sdv-develop"
alias svcdata='cd ${WORKSPACE}/sdv/svc-data-integrations'
alias umo='cd ${WORKSPACE}/umo'

alias miniserver="python -m SimpleHTTPServer 8000"

update_kb_token() {
    cp ~/Downloads/artifacts/output/config ~/.kube
    token=$(cat ~/Downloads/artifacts/gitlab/service_token | tail -n 1 | cut -f 7 -d ' ')
    echo $token | pbcopy
    echo $token
    rm -rf ~/Downloads/artifacts
}

alias k-current-namespace="kubectl config view --minify --output 'jsonpath={..namespace}'; echo"

k-prompt() {
  k_namespace=$(k-current-namespace)
  if [[ $k_namespace == sdv-mvp-master ]]; then
    echo "\033[0;31mDANGER: ${k_namespace}\033[0m $ "
  else
    echo "($(k-current-namespace))$PS1"
  fi
}

# PS1="\$(k-prompt)"




export PATH=$PATH:$MVP_PATH/bin
export PAPERTRAIL_API_KEY=yRUTSbacNRWcsSeM67b
