#!/bin/bash
# called by alias from .bashrc
#
# debug
# set -x

SSH_CMD=/usr/bin/ssh

# If an argument is given, VIM_CMD is set to vim +colorscheme $1
VIM_CMD="vim"
if [ -n "$1" ]; then
      VIM_CMD="vim +'colorscheme $1'"
fi

# Define your sessions and directories here
# Format: "session_name:dir1,dir2,..."
declare -A sessions=(
    ["de"]="/home/antisa/Posal/ansbile-2.0/"
    ["int"]="/home/antisa/Posal/ansible/"
    ["icg"]="/home/antisa/Posal/icg/icg-web/,/home/antisa/Posal/icg/icg-infra-shared-ts/,/home/antisa/Posal/icg/icg-infra-global/"
    ["vagrant"]="/home/antisa/vagrant_playground/"
)

# Function to check if a tmux session exists
session_exists() {
    tmux has-session -t "$1" 2>/dev/null
}
# Loop through the sessions and create them and their windows
for session_name in "${!sessions[@]}"; do
    dirs_string="${sessions[$session_name]}"  # Extract directories string
    IFS=',' read -r -a dirs <<< "$dirs_string"  # Split into array

    if session_exists "$session_name"; then
        echo "Session '$session_name' already exists. Skipping..."
        continue
    fi

    # echo "Creating session: $session_name"
    tmux new-session -d -s "$session_name" -c "${dirs[0]}"
    tmux rename-window -t "$session_name":0 "$(basename "${dirs[0]}")"

    # Create additional windows for multiple directories
    index=1
    for dir in "${dirs[@]:1}"; do
        tmux new-window -t "$session_name":$index -c "$dir" -n "$(basename "$dir")"
        ((index++))
    done
done

# tmux new-window -t icg: -n icg-infra-k8s-apps -c "/home/antisa/Posal/icg/icg-infra-k8s-apps"
# tmux send-keys -t icg:icg-infra-k8s-apps "$VIM_CMD" Enter
# tmux set-environment -t icg AWS_PROFILE icg

# record the tmux sessions
asciinema rec $HOME/Documents/terminal_logs/$(date +"%F_%H-%M-%S").cast -c "tmux attach -t 'icg'"

