#!/bin/sh

if ! command -v git >/dev/null 2>&1; then
  printf 'dotfiles: git not found; global ignore configuration was skipped.\n' >&2
  exit 0
fi

ignore_file="$HOME/.gitignore_global"
current_ignore=$(git config --global --get core.excludesfile 2>/dev/null || :)

case "$current_ignore" in
  ""|*/dotfiles/dot-gitignore|*/dotfiles/.gitignore)
    if ! git config --global core.excludesfile "$ignore_file"; then
      printf 'dotfiles: could not configure the global gitignore; continuing.\n' >&2
    fi
    ;;
  "$ignore_file")
    ;;
  *)
    printf 'dotfiles: preserving existing core.excludesfile: %s\n' "$current_ignore" >&2
    ;;
esac

exit 0
