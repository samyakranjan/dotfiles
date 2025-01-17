#!/bin/bash

# Get the current directory
current_dir=$(pwd)

# Check if .vim directory exists, if not, create it
if [ ! -d "$current_dir/.vim" ]; then
  mkdir -p "$current_dir/.vim"
fi

# Check if Vundle.vim is already cloned, if not, clone it
if [ ! -d "$current_dir/.vim/bundle/Vundle.vim" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git "$current_dir/.vim/bundle/Vundle.vim"
fi

# Replace @@GIT_MAC_DIR@@ in .vimrc with current directory
sed "s|@@GIT_MAC_DIR@@|$current_dir|g" "$current_dir/.vimrc" > "$current_dir/.vimrc.tmp" && mv "$current_dir/.vimrc.tmp" "$current_dir/.vimrc"

# Create a symlink to the .vimrc file for gvim
echo "source $current_dir/.vimrc" > "$HOME/.vimrc"

# Install Vundle plugins with gvim
vi -c ":PluginInstall" -c ":qa"
