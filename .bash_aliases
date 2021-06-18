# ls
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias l='ls -larth --color=auto'
alias lt="ls -lth --color=auto"
alias sl="ls --color=auto"
alias la="ls -a --color=auto"
alias lla="ls -lha --color=auto"
alias ld="ls -d */ --color=auto"
alias lld="ls -ld */ --color=auto"
alias c='clear'
alias cs='clear;ls'

# Navigation
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../../"
alias .......="cd ../../../../../"
alias ........="cd ../../../../../../"
alias .........="cd ../../../../../../../"
alias .2="cd ../../"
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../../"
alias .6="cd ../../../../../../"
alias .7="cd ../../../../../../../"
alias .8="cd ../../../../../../../../"

# Space / count
alias dus='du -shc * | sort -h'
alias dfs='df -h .'
alias count='ls | wc -l'

# Grep
alias grep='grep --color=yes'

# Text Editors
alias v="vim"
alias vi="vim"
alias vsp='vim -O'
alias sp='vim -o'

# Directory manipulation
alias cpr="cp -r"
alias rmr="rm -r"
alias rmrf="rm -rf"
alias pwdf="readlink -f"
function cd() 
{ 
    builtin cd "$@" && ls 
}
function mcdir()
{ 
    mkdir -p -- "$1" && 
    cd -P -- "$1" 
}

# Other Aliases
alias rtmp="rm *~"
alias nuke="kill -9 -1"
alias q='exit'
alias h='history'
function fox() {
    firefox "$@" &
}

# Shell / dotfiles
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias bash_alias='vim ~/.bash_aliases'
alias load_bash='source ~/.bashrc'
alias dot='cd ~/dotfiles'
alias dotw='cd ~/dotfiles_work'
alias sc='source'

# Tmux
alias tmux_conf='vim ~/.tmux.conf'
alias tmux="tmux new-session \; send-keys 'clear' C-m"

# Git
alias gitconfig='vim ~/.gitconfig'
alias gs='vim +Git +only'
function gsu()
{
    git config --local status.showUntrackedFiles all &&
    vim +Git +only &&
    git config --local status.showUntrackedFiles no
}

# Python
alias py='python'
alias py3='python3'

# Miscellaneous
alias shrug='echo -e "\n¯\_(O_o)_/¯\n"'
