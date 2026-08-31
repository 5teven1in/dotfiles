#!/bin/sh

# Re-check on every apply so a newly available Homebrew can be used later.
print_missing_commands() {
  missing=""
  for command_name in git tmux vim zsh; do
    if ! command -v "$command_name" >/dev/null 2>&1; then
      missing="${missing}${missing:+ }${command_name}"
    fi
  done
  if [ -n "$missing" ]; then
    printf 'dotfiles: useful commands not found: %s\n' "$missing" >&2
  fi
}

if ! command -v brew >/dev/null 2>&1; then
  printf 'dotfiles: Homebrew not found; skipping optional package installation.\n' >&2
  print_missing_commands
  exit 0
fi

case "$(uname -s 2>/dev/null)" in
  Darwin)
    packages="git tmux vim"
    ;;
  Linux)
    packages="git tmux vim zsh"
    ;;
  *)
    packages=""
    printf 'dotfiles: unsupported Homebrew platform; skipping package installation.\n' >&2
    ;;
esac

for formula in $packages; do
  if brew list --formula "$formula" >/dev/null 2>&1; then
    continue
  fi
  printf 'dotfiles: installing %s with Homebrew...\n' "$formula"
  if ! brew install "$formula"; then
    printf 'dotfiles: Homebrew could not install %s; continuing.\n' "$formula" >&2
  fi
done

print_missing_commands
exit 0
