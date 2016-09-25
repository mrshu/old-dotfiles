#!/bin/bash

apt update -y
apt upgrade -y

apt install curl fzf -y

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.vim ~/.vim/backup ~/.vim/tmp ~/.vim/undo

curl -fLo ~/.vimrc.minimal \
        https://raw.githubusercontent.com/mrshu/dotfiles/master/vim/.vimrc.minimal

curl -fLo ~/.vimrc \
        https://raw.githubusercontent.com/mrshu/dotfiles/master/vim/.vimrc.small

curl -fLo ~/.bash_alias_fzf \
        https://raw.githubusercontent.com/mrshu/dotfiles/master/bash/.bash_alias_fzf

echo "source ~/.bash_alias_fzf" >> ~/.bashrc
