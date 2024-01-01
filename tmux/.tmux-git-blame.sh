#!/usr/bin/env bash

# Capture the output of the original pane
PANE_OUTPUT=$(tmux capture-pane -p)

# Extract file and line information
RES=$(echo "$PANE_OUTPUT" | rg -e "(?:NOR|INS|SEL)\s*\S*\s*(\S*).*\s(\d+):\d*" -o --replace '$1 $2')
FILE=$(echo $RES | choose 0)
LINE=$(echo $RES | choose 1)

# Run git blame and fzf commands
git blame -L $LINE,+50 $FILE --color-by-age --color-lines | 
  fzf --ansi \
      --border \
      --delimiter ':' \
      --height '100%' \
      --multi \
      --print-query --exit-0 \
      --scrollbar '▍'
