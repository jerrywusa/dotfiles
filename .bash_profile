export BASH_SILENCE_DEPRECATION_WARNING=1
export CLICOLOR=1
export PS1="\[\e[1;97m\]\w \[\e[0;91m\]> \[\e[0m\]"
export LSCOLORS=hxxxxxxxxxxxxxxxxxxxxx
# export LSCOLORS=exfxcxdxbxegedabagacad

# search for file starting from root
alias f="cd ~ && nvim -o \"\$(rg --files --hidden | fzf --preview='less {}')\""

# search for file starting from current directory
alias ff="nvim -o \"\$(rg --files --hidden | fzf --preview='less {}')\""

# search for directory starting from root
alias d="cd ~/Desktop/ && cd \"\$(fd -t d | fzf)\""

# search for directory starting from current directory
alias dd="cd \"\$(fd -t d | fzf)\""

eval "$(/opt/homebrew/bin/brew shellenv)"

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jerry/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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

. "$HOME/.cargo/env"
