#!/bin/bash

# Find all dot files then if the original file exists, create a backup
# Once backed up to {file}.dtbak symlink the new dotfile in place
#for file in $(find . -maxdepth 1 -name ".*" -type f  -printf "%f\n"); do
#    ln -sb $PWD/$file ~/$file
#done
