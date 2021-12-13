# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
        session_start=$(tmux has-session -t start) # V3
        session_work=$(tmux has-session -t work) # V3
        if [[ $session_start -eq 0 ]]; then # V2 : si ya esta creada START
            echo "la session start ya existe. ta [session]|ts|tw" #V2
            if [[ $session_work -eq 0 ]]; then # V3 : si ya esta creada WORK
                echo "la session work YA existe." # V3
            else
                echo "la session work NO existe" # V3
                echo `sleep 2` 
            fi
        else # no existe la sesión START, la crea:
	    echo `sleep 1`
	    echo "Iniciando la sesión START en Tmux..."
	    echo `sleep 2`
	    . "$HOME/tmux-nload.sh"
        fi
    fi
    session_work=$(tmux has-session -t work)
    if [[ $session_work -ne 0 ]]; then
    	echo "la IP privada es:"
    	echo `sleep 15 && ifconfig wlan0 | grep netmask | awk '{ print "wlan0: "$1" " $2" - "$3" "$4; }'`
	echo `sleep 20`
	. "$HOME/tmux-nload.sh"
    else
	echo `ifconfig wlan0 | grep netmask | awk '{ print "wlan0: "$1" " $2" - "$3" "$4; }'`
    fi
fi
    
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

