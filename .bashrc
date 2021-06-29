# .bashrc

# Source alias file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Bash
HISTSIZE=2000
export RISCV=/tools/risc-v

# editor
export EDITOR='vim'
export VISUAL='vim'

if [ ${USER} == "dhamlin1" ]; then
    source ~/dotfiles_work/.work_include.sh
fi

# change ls colors
export LS_COLORS='di=36:ln=1;33:so=32:pi=33:ex=31:bd=32;40:cd=32;40:su=33;40:sg=33;40:tw=34;40:ow=34;40'

# set term title
PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

### SET COLORS ###
# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset

git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dhamlin1/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dhamlin1/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/dhamlin1/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/dhamlin1/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# get rid of base in the prompt by setting PS1 last
PS1="\[\033[0;35m\]\w\[\033[00m\]\[\033[0;37m\] [\$(git_branch)]\[\033[00m\]\[\033[0;35m\]$\[\033[00m\] "
