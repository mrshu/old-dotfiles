#!/bin/bash

echo "-> Installation of mrShu's dotfiles started"

for x in $(find . -path ./.git -prune -o -print); do
        [[ "$x" == "." ]] && continue

        echo "Installing $x into ~/.$(echo $x|sed 's#./##')"
        cp -R ./$x ~/.$(echo $x|sed 's#./##')
done

mkdir -p ~/.vim/backup
mkdir -p ~/.vim/tmp

rm ~/.install.sh
rm ~/.README.md
