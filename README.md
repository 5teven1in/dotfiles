# dotfiles

Personal shell, Vim, tmux, and Git defaults managed with
[chezmoi](https://www.chezmoi.io/). The setup is designed for macOS, Linux,
Omarchy/Arch Linux, servers, and restricted accounts without root privileges.

## What is managed

- A concise Oh My Zsh configuration with the custom
  [`ss8651twtw/ys.zsh-theme`](https://github.com/ss8651twtw/ys.zsh-theme)
- `zsh-completions`, `zsh-autosuggestions`, and `zsh-syntax-highlighting`
- Vim configuration, vim-plug, and a small plugin set
- The upstream oh-my-tmux configuration plus local overrides
- A conservative global Git ignore file
- Optional 1Password SSH Agent socket discovery

Oh My Zsh, its custom plugins and theme, vim-plug, and oh-my-tmux are pinned
chezmoi externals. They are fetched over HTTPS archives or files, so fetching
the custom theme does not depend on a preinstalled `git` command.

## Prerequisites and bootstrap

Install the standalone `chezmoi` binary using a method appropriate for the
machine. Chezmoi itself does not require root access. A network connection is
needed on the first apply to download the pinned external files.

Initialize and apply the repository:

```sh
chezmoi init --apply 5teven1in
```

No system package manager or login shell is changed. If an existing `brew`
command is available, the apply makes a best-effort installation of `git`,
`tmux`, and `vim` on macOS, plus `zsh` on Linux. Individual Homebrew failures
are reported but do not abort the dotfile apply.

When Homebrew is unavailable, package installation is skipped. Chezmoi still
applies every usable file and prints a concise list of useful commands that are
missing. Install those commands later using whatever user-space method the
machine permits, then run `chezmoi apply` again.

The setup does not change the account's login shell. Start Zsh explicitly with
`zsh` or ask the machine administrator to change it when appropriate.

## macOS and Linux

The same bootstrap command is used on both platforms. Platform-specific logic
is limited to the optional Homebrew package list and 1Password socket path.
Linuxbrew is supported when `brew` is already on `PATH`; native distribution
package managers are intentionally left to the machine owner or administrator.

## 1Password SSH Agent

No SSH private keys are stored or generated here. When `SSH_AUTH_SOCK` is
unset, `.zshrc` checks the standard 1Password agent socket:

- macOS: `~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock`
- Linux: `~/.1password/agent.sock`

The socket is used only when it exists. An already configured agent is never
overridden. Git signing and the rest of the user's `~/.gitconfig` are also left
alone; chezmoi only sets `core.excludesfile` when it is absent or still points
at this repository's legacy ignore file.

## Daily use

Inspect pending changes before applying them:

```sh
chezmoi diff
chezmoi apply
```

Edit a managed file and update from the remote repository:

```sh
chezmoi edit ~/.zshrc
chezmoi update
```

Changes made with `chezmoi edit` live in the chezmoi source directory. Review
and commit them there with the usual Git workflow.

## Profile Zsh startup

The Zsh configuration has an opt-in `zprof` hook. Run one profiled interactive
startup without changing the normal shell configuration:

```sh
ZSH_PROFILE=1 zsh -i -c exit
```

Use the resulting function timing table to decide whether future plugin cleanup
is worthwhile.
