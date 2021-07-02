# .bashrc
if [ -f /data/startup_bashrc/master.bashrc ]; then
    source /data/startup_bashrc/master.bashrc
fi

# Source alias file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Bash
HISTSIZE=2000

# editor
export EDITOR='vim'
export VISUAL='vim'

if [ ${USER} == "hamlindw" ]; then
    source ~/dotfiles_work/.work_include.sh
fi

# change ls colors
export LS_COLORS='di=36:ln=1;33:so=32:pi=33:ex=31:bd=32;40:cd=32;40:su=33;40:sg=33;40:tw=34;40:ow=34;40'

# set term title
PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

### SET COLORS ###
# Normal Colors
Black='\[\033[0;30m\]'        # Black
Red='\[\033[0;31m\]'          # Red
Green='\[\033[0;32m\]'        # Green
Yellow='\[\033[0;33m\]'       # Yellow
Blue='\[\033[0;34m\]'         # Blue
Purple='\[\033[0;35m\]'       # Purple
Cyan='\[\033[0;36m\]'         # Cyan
White='\[\033[0;37m\]'        # White

# Bold
BBlack='\[\033[1;30m\]'       # Black
BRed='\[\033[1;31m\]'         # Red
BGreen='\[\033[1;32m\]'       # Green
BYellow='\[\033[1;33m\]'      # Yellow
BBlue='\[\033[1;34m\]'        # Blue
BPurple='\[\033[1;35m\]'      # Purple
BCyan='\[\033[1;36m\]'        # Cyan
BWhite='\[\033[1;37m\]'       # White

# Background
On_Black='\[\033[40m\]'       # Black
On_Red='\[\033[41m\]'         # Red
On_Green='\[\033[42m\]'       # Green
On_Yellow='\[\033[43m\]'      # Yellow
On_Blue='\[\033[44m\]'        # Blue
On_Purple='\[\033[45m\]'      # Purple
On_Cyan='\[\033[46m\]'        # Cyan
On_White='\[\033[47m\]'       # White

NC='\[\033[00m\]'             # Color Reset

# Host name
if [ -z "$NAME" ]; then
    export CUR_HOST="Local"
else
    export CUR_HOST=$NAME
fi

# Current git branch
git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# get rid of base in the prompt by setting PS1 last
# PS1="\[\033[0;35m\]\w\[\033[00m\]\[\033[0;37m\] [\$(git_branch)]\[\033[00m\]\[\033[0;35m\]$\[\033[00m\] "
PS1="${BRed}${CUR_HOST} ${NC}${Purple}\w${NC} ${White}[\$(git_branch)]${NC}${Purple}$ ${NC}"
