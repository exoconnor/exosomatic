#!/bin/sh

cwd="$(pwd)"
root="$(git rev-parse --show-toplevel)"

cd "$root" || exit 1

jsfiles=$(git diff --cached --name-only --diff-filter=ACM "src/**.js" "src/**.jsx" | tr '\n' ' ')
[ -z "$jsfiles" ] && exit 0

# Prettify all staged .js files
echo "$jsfiles" | xargs ./node_modules/.bin/prettier --write

# Add back the modified/prettified files to staging
echo "$jsfiles" | xargs git add

cd "$cwd" || exit 1

exit 0
