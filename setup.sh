#!/bin/sh
#------------------------------------------------------------------------------#
#                                     setup                                    #
#------------------------------------------------------------------------------#
echo -e "Setting up environment"

if [ ! -d $HOME/.dotfiles_backup ]; then
    mkdir $HOME/.dotfiles_backup
fi

BACKUP=".dotfiles_backup"

#------------------------------------------------------------------------------#
#                                     vimrc                                    #
#------------------------------------------------------------------------------#
if [ -e $HOME/.vimrc ]; then
    mv $HOME/.vimrc $HOME/$BACKUP/.vimrc_bak
    ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
else
    ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
fi

#------------------------------------------------------------------------------#
#                                    bashrc                                    #
#------------------------------------------------------------------------------#
if [ -e $HOME/.bashrc ]; then
    mv $HOME/.bashrc $HOME/$BACKUP/.bashrc_bak
    ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
else
    ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
fi

#------------------------------------------------------------------------------#
#                                 bash_profile                                 #
#------------------------------------------------------------------------------#
if [ -e $HOME/.bash_profile ]; then
    mv $HOME/.bash_profile $HOME/$BACKUP/.bash_profile_bak
    ln -s $HOME/dotfiles/.bash_profile $HOME/.bash_profile
else
    ln -s $HOME/dotfiles/.bash_profile $HOME/.bash_profile
fi

#------------------------------------------------------------------------------#
#                                 bash aliases                                 #
#------------------------------------------------------------------------------#
if [ -e $HOME/.bash_aliases ]; then
    mv $HOME/.bash_aliases $HOME/$BACKUP/.bash_aliases_bak
    ln -s $HOME/dotfiles/.bash_aliases $HOME/.bash_aliases
else
    ln -s $HOME/dotfiles/.bash_aliases $HOME/.bash_aliases
fi

#------------------------------------------------------------------------------#
#                                     tmux                                     #
#------------------------------------------------------------------------------#
if [ -e $HOME/.tmux.conf ]; then
    mv $HOME/.tmux.conf $HOME/$BACKUP/.tmux.conf_bak
    ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
else
    ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
fi

#------------------------------------------------------------------------------#
#                                   gitconfig                                  #
#------------------------------------------------------------------------------#
if [ -e $HOME/.gitconfig ]; then
    mv $HOME/.gitconfig $HOME/$BACKUP/.gitconfig_bak
    ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
else
    ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
fi

#------------------------------------------------------------------------------#
#                                   git setup                                  #
#------------------------------------------------------------------------------#
git config --global user.name "DallasHamlin"
git config --global user.email "DallasHamlin@users.noreply.github.com"
sed -i 's/DallasHamlin$/DallasHamlin #gitignore/g' ~/dotfiles/.bashrc
sed -i 's/github.com$/github.com #gitignore/g' ~/dotfiles/.bashrc

#------------------------------------------------------------------------------#
#                                   vim setup                                  #
#------------------------------------------------------------------------------#
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
sed -i 's/ni/n/g' $HOME/.vim/plugged/CommentFrame.vim/plugin/CommentFrame.vim

#------------------------------------------------------------------------------#
#                                miniconda setup                               #
#------------------------------------------------------------------------------#
if [ ! -d $HOME/miniconda3 ]
then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    chmod u+x Miniconda3-latest-Linux-x86_64.sh
    ~/dotfiles/Miniconda3-latest-Linux-x86_64.sh
    export PATH=$HOME/miniconda3/bin:$PATH
fi

cd $HOME
conda install -c conda-forge vim
conda install -c conda-forge git
conda install -c conda-forge htop
conda install -c conda-forge tmux
conda install -c conda-forge bash
conda install -c conda-forge pip

#------------------------------------------------------------------------------#
#                                     work                                     #
#------------------------------------------------------------------------------#
if [ ${USER} == "dhamlin1" ]; then
    source ~/dotfiles_work/.work_setup.sh
fi

source $HOME/.bashrc
echo -e "\nDONE!"
