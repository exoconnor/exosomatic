#!/bin/sh
#
# Run mix format before commit

# Redirect output to stderr.
exec 1>&2

cwd="$(pwd)"
root="$(git rev-parse --show-toplevel)"

cd "$root" || exit 1

# Take all files that have been added, run mix format if they are in lib or test
files=$(git diff --name-only --cached)
mix format --check-equivalent mix.exs "lib/**/*.{ex,exs}" "test/**/*.{ex,exs}"
echo "$files" | awk -v prefix="$root" '{print prefix"/"$0}' | xargs git add

cd "$cwd" || exit 1