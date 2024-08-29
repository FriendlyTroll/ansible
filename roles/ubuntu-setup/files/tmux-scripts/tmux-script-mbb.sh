#!/bin/bash
# called by alias from .bashrc
SSH_CMD=/usr/bin/ssh

ansible_sessions=(
  int
  de
  bgb
)
ansible_dirs=(
  /home/antisa/Posal/ansible/
  /home/antisa/Posal/ansbile-2.0/
  /home/antisa/Posal/bgb.ansible/
)
ansible_windows=(
  ansible-i18n
  ansbile-2-0
  bgb-ansible
)
deploy_windows=(
  ansible-i18n
  ansbile-2.0
  bgb-ansible
)
other_sessions=(
  vagrant
)
other_dirs=(
  /home/antisa/vagrant_playground/
)

for index in ${!ansible_sessions[*]};do
  tmux new-session -d -s ${ansible_sessions[$index]} -n ${ansible_windows[$index]} -c ${ansible_dirs[$index]}
  tmux new-window -n deploy -c "${ansible_dirs[$index]}"
  tmux send-keys -t ${ansible_sessions[$index]}:${ansible_windows[$index]} "vim" Enter
  tmux select-window -t 0
done

for index in ${!other_sessions[*]};do
  tmux new-session -d -s ${other_sessions[$index]} -c ${other_dirs[$index]}
done

tmux send-keys -t int:deploy "$SSH_CMD provisioning-i18n" Enter
tmux send-keys -t de:deploy "$SSH_CMD provisioning" Enter

# record the tmux sessions
asciinema rec $HOME/Documents/terminal_logs/$(date +"%F_%H-%M-%S").cast -c "tmux attach -t ${ansible_sessions[0]}:${ansible_windows[0]}"

