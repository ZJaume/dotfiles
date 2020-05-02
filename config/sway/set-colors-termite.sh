#!/bin/bash

if [ "$1" == "-h" ]
then
    echo "Change the color theme of termite console"
    echo "`basename $0` <opacity>"
    exit 0
fi

# Set internal field separator to newline in order to separate colors from command correctly
IFS=$'\n'
# get the colors from wal
colors=`cat $HOME/.cache/wal/colors.yml | grep -E 'color[0-9]+|background|foreground' | sed 's/:/ =/g' | tr -d '"' | sed 's/    //g'`

# Replace every color on the termite config file
for color in $colors
do
    if [[ $color =~ background* ]]
    then
        # Convert hexadecimal string to rgba array
        hex=${color##*\= \#}
        rgb=`echo "obase=10; ibase=16; ${hex:0:2}; ${hex:2:2}; ${hex:4:2}" | bc | xargs printf "background = rgba(%s,%s,%s,$1)\n"`
        sed -i "s/^background = .*/$rgb/g" $HOME/.config/termite/config
    else
       sed -i "/^#/! s/${color%\=*}.*/$color/g" $HOME/.config/termite/config
    fi
done
