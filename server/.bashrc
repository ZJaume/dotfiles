#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set default editor
export VISUAL=vim
export EDITOR=vim
export SUDO_EDITOR=vim
export PATH=$HOME/cuda/lib64${PATH:+:$PATH}
export PATH=$HOME/.local/bin${PATH:+:$PATH}
export PATH=$HOME/go/bin${PATH:+:$PATH}

# Persistent ssh_auth_sock on old tmuxes
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

# Colors to man
export MANROFFOPT='-c'
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)

# Desktop environment
if [ $(tty) == "/dev/tty1" ]; then
    # Change libva driver
    if [ "$HOSTNAME" == "archer" ]
    then
        export LIBVA_DRIVER_NAME=radeonsi
    else
        export LIBVA_DRIVER_NAME=i965
    fi

    # Start ssh-agent if is not started
    if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        ssh-agent > ~/.ssh-agent-thing
    fi
    if [[ "$SSH_AGENT_PID" == "" ]]; then
        eval "$(<~/.ssh-agent-thing)"
    fi

    (cat ~/.cache/wal/sequences &)

    export SHELL="/bin/fish"
    export XKB_DEFAULT_LAYOUT=es
    export XKB_DEFAULT_VARIANT=cat
    export QT_QPA_PLATFORM=wayland
    export MOZ_ENABLE_WAYLAND=1
    export MOZ_WEBRENDER=1
    export GTK_THEME=Adwaita:dark
    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=sway
    sway 2> ~/.log/sway.log
else
    exec fish
fi
