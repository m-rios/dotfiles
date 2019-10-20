export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME=""
OS=$(uname)

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
EXTENSIONS_PATH="${HOME}/Developer/.scripts/"
EXTENSIONS_FNS=('docker.sh' 'python.sh' 'researchable.sh' 'msc_thesis.sh' 'rtv.sh' 'transmission.sh')
for fn in $EXTENSIONS_FNS; do
    if [ -f $EXTENSIONS_PATH$fn ]; then
        source $EXTENSIONS_PATH$fn
    else
        echo "Extension '${fn}' not found. Skipping"
    fi
done

# Custom Aliases
alias src='source ~/.zshrc'
alias zshrc='vim ~/.zshrc && src'
alias vimrc='vim ~/.vim/vimrc'
alias tmuxrc='vim ~/.tmux.conf && tmux source-file ~/.tmux.conf'
alias sp=spotify
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias rng=ranger
alias Dev="cd ~/Developer"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Custom Variables
export PATH=$PATH:~/Developer/Scripts:/${HOME}/Library/Python/3.7/bin
export HOSTALIASES=~/.hosts
export LC_ALL=en_US.UTF-8

if [ -d "$HOME/Developer/bin" ] ; then
    export PATH="$HOME/Developer/bin:$PATH"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
