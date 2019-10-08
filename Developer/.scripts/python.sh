#alias python=python2
alias py=python
#alias pip=pip2
alias venvc='virtualenv .venv'
alias venva='source .venv/bin/activate'
alias venvd='deactivate'

export PYTHONSTARTUP=~/.pythonrc

pyprofile() {
    py -m cProfile -s tottime $@ > /tmp/pprofile.log 2> /dev/null
    less /tmp/pprofile.log
}
