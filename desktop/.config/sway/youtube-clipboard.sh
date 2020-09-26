#!/bin/bash

if ! wl-paste -l | grep -q 'text/plain'
then
    exit 0
fi

# Download json of the video url and find music category
is_music(){
    youtube-dl -J --skip-download $1 | jq '.categories' | grep -i -q 'music'
}

if [[ $(wl-paste | wc -l) -eq 1 ]]
then
    if wl-paste | grep -q '^https://\(www\.\)\{0,1\}youtube\.com'
    then
        # Match typical url
        is_music $(wl-paste) && wl-paste | mpc load
    elif wl-paste | grep -q '^https://\(www\.\)\{0,1\}youtu\.be'
    then
        # Resolve shortened youtu.be to obtain original url
        # from the HTTP headers
        URL=$(wl-paste \
            | wget -S -q -i -O - 2>&1 \
            | grep 'Location: https://\(www.\)\{0,1\}youtube.com' \
            | cut -d ':' -f 2- \
            | tr -d ' ')
        is_music $URL && mpc load "$URL"
    fi
fi
