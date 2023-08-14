#!/bin/bash
# called by alias from .bashrc
SESSION_NAME=dyapi
CHANGE_TO_DIR=/home/antisa/Posal/Code/dynamic-yield-feed-export
WINDOW_1=dyapi
WINDOW_2=solr_tunnel
WINDOW_3=run
WINDOW_4=dev-backend-services

tmux new-session -d -s ${SESSION_NAME} -n ${WINDOW_1} -c ${CHANGE_TO_DIR}
tmux send-keys -t ${SESSION_NAME}:${WINDOW_1} "source venv/bin/activate && vim" Enter
tmux new-window -n ${WINDOW_2}
tmux send-keys -t ${SESSION_NAME}:${WINDOW_2} "ssh -L 8983:localhost:8983 root@46.4.13.220" Enter
tmux new-window -n ${WINDOW_3} -c ${CHANGE_TO_DIR}
tmux send-keys -t ${SESSION_NAME}:${WINDOW_3} "ape && export PYTHONPATH=$CHANGE_TO_DIR:$PYTHONPATH" Enter
tmux new-window -n ${WINDOW_4} -c ${CHANGE_TO_DIR}
tmux send-keys -t ${SESSION_NAME}:${WINDOW_4} "ssh dev-backend-services" Enter
asciinema rec $HOME/Documents/terminal_logs/$(date +"%F_%H-%M-%S").cast -c "tmux attach -t ${SESSION_NAME}:${WINDOW_1}"
