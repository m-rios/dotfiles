# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/mario/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  osx
  docker
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Custom Functions
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi
source ~/Developer/Scripts/helm_autocomplete
# Helm admin tools, from https://medium.com/@pczarkowski/easily-install-uninstall-helm-on-rbac-kubernetes-8c3c0e22d0d7
helmins() {
 kubectl -n kube-system create serviceaccount tiller
 kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
 helm init --service-account=tiller
}
helmdel() {
 kubectl -n kube-system delete deployment tiller-deploy
 kubectl -n kube-system delete service tiller-deploy 
 kubectl delete clusterrolebinding tiller
 kubectl -n kube-system delete serviceaccount tiller
}

# Custom Aliases 
alias python=python3
alias pip=pip3
alias venvc='virtualenv .venv'
alias venva='source .venv/bin/activate'
alias vimr="open -a VimR"

alias ssh-xubuntu='ssh mario@192.168.64.2'
alias arduino='/Applications/Arduino.app/Contents/MacOS/Arduino'
alias ard=arduino
#alias vim=nvim
alias src='source ~/.zshrc'
alias zshrc='vim ~/.zshrc && src' # TODO: find the name of the shell and automate config filename
alias vimrc='vim ~/.vim/vimrc' 
alias rn=ranger
alias sp=spotify
alias ssh-stt='ssh -i ~/Developer/stt-entrypoint.pem ubuntu@ec2-18-196-186-182.eu-central-1.compute.amazonaws.com'
alias ssh-anton='ssh -i ~/Developer/wacc_anton.pem ubuntu@ec2-35-158-76-154.eu-central-1.compute.amazonaws.com'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias py=python
alias ci=circleci
alias dkillall="docker kill $(docker ps -q)"
alias drmiall="docker rm $(docker ps -aq)"
#alias k=kubectl
#alias kg="kubectl get"
alias compose=docker-compose
alias kgpolive="while sleep 1; do kgpo; done;"
alias cdlatex="cd ~/Dropbox/Apps/Texpad/Master\ thesis/"
alias peregrine="ssh s3485781@peregrine.hpc.rug.nl"
alias rng="ranger"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases

# Custom Variables
export PATH=$PATH:~/Developer/Scripts:/Users/mario/Library/Python/3.7/bin
export HOSTALIASES=~/.hosts
# export KOPS_CLUSTER_NAME=cluster.dev.swapit.ga
export KOPS_BUCKET_NAME=cluster.dev.swapit.ga
export KOPS_STATE_STORE=s3://${KOPS_BUCKET_NAME}
export KOPS_CLUSTER_NAME=dev.swapit.ga

permakill() {
    while true; do krmpo $1; done;
}
dbash() {
    docker exec -it $1 bash
}
