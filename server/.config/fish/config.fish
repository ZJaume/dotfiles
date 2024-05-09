alias rsync "rsync --info=progress2"
alias sv "source venv/bin/activate.fish"
alias awk "awk -F\t"
alias pzcat "pigz -dc"
alias noempty "grep -v '^[[:blank:]]*\$'"
alias tmpclean "find /tmp/ -user $USER -name tmp\* -exec rm -r "{}" \;"
alias rmsocks "rm ~/.ssh/sockets/socket-*"
alias battery "upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep 'percentage\|state'"
alias yay "paru"

if status is-interactive; and test -s ~/.cache/wal/sequences
    cat ~/.cache/wal/sequences &
end
