export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME=""

source $ZSH/oh-my-zsh.sh

plugins=(
    osx
)

# Custom Functions
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# Set prompt to pure https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

# Source project/technology specific settings
source ~/Developer/.scripts/docker.sh
source ~/Developer/.scripts/python.sh
source ~/Developer/.scripts/researchable.sh
source ~/Developer/.scripts/msc_thesis.sh

# Custom Aliases

alias src='source ~/.zshrc'
alias zshrc='vim ~/.zshrc && src'
alias vimrc='vim ~/.vim/vimrc'
alias tmuxrc='vim ~/.tmux.conf && tmux source-file ~/.tmux.conf'
alias rn=ranger
alias sp=spotify
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias rng="ranger"
alias Dev="cd ~/Developer"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Custom Variables
export PATH=$PATH:~/Developer/Scripts:/${HOME}/Library/Python/3.7/bin
export HOSTALIASES=~/.hosts

if [ -d "$HOME/Developer/bin" ] ; then
    export PATH="$HOME/Developer/bin:$PATH"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
