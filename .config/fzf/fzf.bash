# Setup fzf
# ---------
if [[ ! "$PATH" == */home/michael/Source/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/michael/Source/fzf/bin"
fi

eval "$(fzf --bash)"
