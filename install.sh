#!/bin/bash -x

# Find all files in this directory starting with a period.
# If that file is .gitignore, continue without doing anything.
# If that file exists as a symlink in the home directory, continue to next file and do nothing.
# If the file exists, but is not a symlink, make a backup and create a symlink.
# If the file does not exist at all, just create a symlink.
# If none of these things happen, write error message.
for file in $(find . -maxdepth 1 -name ".*" -type f  -printf "%f\n"); do
    if [[ "$file" == ".gitignore" ]]; then
        continue
    elif [[ -L ~/$file ]]; then
	continue
    elif [[ -f ~/$file ]]; then
	ln -sb $PWD/$file ~/$file
    elif [[ ! -e ~/$file ]]; then
	ln -s $PWD/$file ~/$file
    else
	echo "$file exists, but is not a regular file or a symlink"
    fi
done

# If vimrc is a symlink, and we do not have .vim folder, we also want the folder with plugins
if [[ -L ~/.vimrc && ! -L ~/.vim ]]; then
    ln -s $PWD/.vim ~/.vim
fi
