#!/bin/bash
# called by alias from .bashrc
SESSION_NAME=pydps
CHANGE_TO_DIR=/home/antisa/Posal/Code/delta-products-stream
WINDOW_1=dps
WINDOW_2=solr_tunnel

tmux new-session -d -s ${SESSION_NAME} -n ${WINDOW_1} -c ${CHANGE_TO_DIR}
tmux send-keys -t ${SESSION_NAME}:${WINDOW_1} "source venv/bin/activate" Enter
tmux send-keys -t ${SESSION_NAME}:${WINDOW_1} "vim" Enter
tmux new-window -n ${WINDOW_2}
tmux send-keys -t ${SESSION_NAME}:${WINDOW_2} "ssh -L 8983:localhost:8983 root@116.202.232.196" Enter
asciinema rec $HOME/Documents/terminal_logs/$(date +"%F_%H-%M-%S").cast -c "tmux attach -t ${SESSION_NAME}:${WINDOW_1}"
