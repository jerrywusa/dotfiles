# export PATH="/opt/homebrew/bin:$PATH"
export PATH=$PATH:/Applications/SWI-Prolog.app/Contents/MacOS

# export PATH=$PATH:/Applications/SWI-Prolog.app/Contents/MacOS

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jerry/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jerry/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jerry/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jerry/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
