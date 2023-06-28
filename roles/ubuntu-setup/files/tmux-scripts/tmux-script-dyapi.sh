#!/bin/bash
# called by alias from .bashrc
SESSION_NAME=dyapi
CHANGE_TO_DIR=/home/antisa/Posal/Code/dynamic-yield-feed-export
WINDOW_1=dyapi

tmux new-session -d -s ${SESSION_NAME} -n ${WINDOW_1} -c ${CHANGE_TO_DIR}
tmux send-keys -t ${SESSION_NAME}:${WINDOW_1} "source venv/bin/activate" Enter
tmux send-keys -t ${SESSION_NAME}:${WINDOW_1} "vim" Enter
asciinema rec $HOME/Documents/terminal_logs/$(date +"%F_%H-%M-%S").cast -c "tmux attach -t ${SESSION_NAME}:${WINDOW_1}"
