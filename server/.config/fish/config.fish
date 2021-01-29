alias sv "source venv/bin/activate.fish"
alias battery "upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep 'percentage\|state'"

if status is-interactive; and test -s ~/.cache/wal/sequences
    cat ~/.cache/wal/sequences &
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -d /home/jzaragoza/miniconda3
    eval /home/jzaragoza/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

