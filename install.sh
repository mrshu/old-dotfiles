#!/bin/bash

echo "-> Installation of mrShu's dotfiles started"

for x in $(find . -f ) do
        echo "Installing $x into ~/"
        cp ./$x ~/.$x
done

mkdir -p ~/.vim/backup
mkdir -p ~/.vim/tmp

rm ~/.install.sh
rm ~/.README.md
