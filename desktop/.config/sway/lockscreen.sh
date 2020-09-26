#!/bin/bash

# grab outputs
while read output && read active
do
    if [ "$active" = true ]
    then
        # save screenshot corrupted
        grim -o $output -t png - | corrupter -add 0 -mag 3 -boffset 5 - > /tmp/lock-$output.png
        params=$params" -i $output:/tmp/lock-$output.png"
    fi
done < <(swaymsg -t get_outputs -r | jq -r '.[] | .name, .active')

swaylock -i $(cat $HOME/.cache/wal/wal) $params
