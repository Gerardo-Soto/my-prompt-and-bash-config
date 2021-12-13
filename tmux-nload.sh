#!/bin/sh 

#tmux new-session -d nload wlan0 \; attach-session

### Funcional
#tmux new-session -d -s mySession -n myWindow
#tmux send-keys -t mySession:myWindow "cd /home/pi/" Enter
#tmux send-keys -t mySession:myWindow "vim" Enter
#tmux attach -t mySession:myWindow

tmux new-session -d -s start -n nload
#tmux send-keys -t start:nload "cd /home/pi/" Enter
tmux send-keys -t start:nload "nload wlan0" Enter
tmux attach -t start:nload

