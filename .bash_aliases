alias open=xdg-open
alias redbg="printf %b '\e[41m' '\e[8]' '\e[H\e[J'"
alias screen-on="xrandr --output eDP --auto"
alias suspend-sys="systemctl suspend"

alias dwmrc="vim ~/Developer/suckless/dwm/config.h"
alias xclip="xclip -sel clip"
alias clock=clockify-cli
# alias monitor-mic="pactl load-module module-loopback latency_msec=5"
# alias unmonitor-mic="pactl unload-module module-loopback"
alias monitor-mic="pacat -r --latency-msec=1 -d alsa_input.pci-0000_05_00.6.analog-stereo | pacat -p --latency-msec=1 -d alsa_output.pci-0000_05_00.1.hdmi-stereo-extra1"

alias tmux-cwd="echo type this in the tmux console prompt:attach-session -t . -c new_working_dir"

# alias mine="mine ${@} > /dev/null 2>&1 &"

source ~/.gitaliases

