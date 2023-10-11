#!/bin/bash
# called by alias from .bashrc
SESSION_NAME=int
CHANGE_TO_DIR=/home/antisa/Posal/ansible/
WINDOW_1=ansible-int
WINDOW_2=deploy
WINDOW_3=vagrant

tmux new-session -d -s ${SESSION_NAME} -n ${WINDOW_1} -c ${CHANGE_TO_DIR}
tmux send-keys -t ${SESSION_NAME}:${WINDOW_1} "vim" Enter
tmux new-window -n ${WINDOW_2} -c ${CHANGE_TO_DIR}
tmux new-window -n ${WINDOW_3}
tmux send-keys -t ${SESSION_NAME}:${WINDOW_3} "cdv" Enter
asciinema rec $HOME/Documents/terminal_logs/$(date +"%F_%H-%M-%S").cast -c "tmux attach -t ${SESSION_NAME}:${WINDOW_1}"
