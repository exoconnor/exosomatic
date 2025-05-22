#!/bin/bash

set -e

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Skipping exosomatic git configuration."
    exit 0
fi

# Path to the gitignore file (symlinked in the feature directory)
DOTFILES_GITIGNORE="$(dirname "$0")/gitignore"

# Path to git excludes file
GIT_EXCLUDES="${HOME}/.git/info/exclude"

# Create .git/info directory if it doesn't exist
mkdir -p "$(dirname "${GIT_EXCLUDES}")"

# Copy the gitignore file to git excludes
if [ -f "${DOTFILES_GITIGNORE}" ]; then
    echo "Adding gitignore from dotfiles to git excludes..."
    cat "${DOTFILES_GITIGNORE}" >> "${GIT_EXCLUDES}"
    echo "Successfully added gitignore to git excludes."
else
    echo "Warning: Gitignore file not found at ${DOTFILES_GITIGNORE}"
fi
