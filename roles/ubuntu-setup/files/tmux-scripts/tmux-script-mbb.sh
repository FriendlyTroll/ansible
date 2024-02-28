#!/bin/bash
# called by alias from .bashrc
ansible_sessions=(
  de
  int
  bgb
)
ansible_dirs=(
  /home/antisa/Posal/ansbile-2.0/
  /home/antisa/Posal/ansible/
  /home/antisa/Posal/bgb.ansible/
)
ansible_windows=(
  ansbile-2-0
  ansible-i18n
  bgb-ansible
)
deploy_windows=(
  ansbile-2.0
  ansible-i18n
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
  tmux send-keys -t ${ansible_sessions[$index]}:${ansible_windows[$index]} "nvim" Enter
  tmux select-window -t 0
done

for index in ${!other_sessions[*]};do
  tmux new-session -d -s ${other_sessions[$index]} -c ${other_dirs[$index]}
done

# record the tmux sessions
asciinema rec $HOME/Documents/terminal_logs/$(date +"%F_%H-%M-%S").cast -c "tmux attach -t ${ansible_sessions[0]}:${ansible_windows[0]}"

