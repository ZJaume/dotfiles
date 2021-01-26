alias sv "source venv/bin/activate.fish"
alias battery "upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep 'percentage\|state'"

if status is-interactive; and test -s ~/.cache/wal/sequences
    cat ~/.cache/wal/sequences &
end
