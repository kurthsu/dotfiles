#!/bin/bash

# ==========================================================================================
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# ==========================================================================================

# ================= Variables ====================

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vim tmux.conf zshrc oh-my-zsh"    # list of files/folders to symlink in homedir

# ================= Functions ====================
install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
        git clone http://github.com/robbyrussell/oh-my-zsh.git
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
        echo $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        sudo apt-get install zsh
        install_zsh
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

# ================= Main Flow ====================

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# install oh-my-zsh and
install_zsh

# Clone my vimrc repository from GitHub only if it isn't already present
if [[ ! -d $dir/vim/ ]]; then
    git clone https://github.com/kurthsu/vimrc.git $dir/vim
fi
git submodule update --init --recursive
mv ~/.vimrc ~/dotfiles_old/
echo "Creating symlink to vimrc in home directory."
ln -s $dir/vim/vimrc ~/.vimrc

# move any existing dotfiles in homedir to dotfiles_old directory,
# then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Install lib for ctags
apt-get install exuberant-ctags
