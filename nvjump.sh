#!/bin/bash

# remember to do the following:
# chmod +x ~/nvjump.sh

# Check if a mark is provided
if [ -z "$1" ]; then
    echo "Please provide a mark."
    exit 1
fi

# Open Neovim and jump to the mark
nvim -c "normal! \`$1"
