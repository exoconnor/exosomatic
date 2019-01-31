#!/bin/sh
#
# Run mix format before commit

# Redirect output to stderr.
exec 1>&2

cwd="$(pwd)"
root="$(git rev-parse --show-toplevel)"

cd "$root" || exit 1

# Take all files that have been added, run mix format if they are in lib or test
files=$(git diff --name-only --cached --diff-filter=ACM "mix.exs" "lib/**.ex" "test/**.ex" "lib/**.exs" "test/**.exs")

echo "$files" | xargs mix format --check-equivalent
echo "$files" | xargs git add

cd "$cwd" || exit 1

exit 0
