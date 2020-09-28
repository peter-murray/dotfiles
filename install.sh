#!/usr/bin/env bash

########################################################################################################
#
# This script creates symlinks from the home directory to any desired dotfiles
#
########################################################################################################

set -e

if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    exit 1
fi

cd "$(dirname "${BASH_SOURCE}")"
CWD=$(pwd)

HOME_DIR=$1

# dotfiles directory
DOTFILES_DIR=${CWD}

# list of files/folders to symlink in ${homedir}
files="gitconfig"

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${DOTFILES_DIR}/.${file} ${HOME_DIR}/.${file}
done
