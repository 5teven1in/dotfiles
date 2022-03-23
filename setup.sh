#!/bin/bash -x

OMZ="${HOME}/.oh-my-zsh"
DOT=$(dirname "$(readlink -f "$0")")

GCL="git clone"
STOW="stow --dotfiles --adopt -t ${HOME}"

# prerequisites
cmds="stow curl zsh git tmux vim"

apt update

# check command if not installed, install it
function check_command_is_installed {
    if ! command -v $1 >/dev/null 2>&1; then
        apt install -y $1
    fi
}

for cmd in $cmds; do
    check_command_is_installed $cmd
done

# check default shell if not zsh set to zsh
zsh_path=$(which zsh)
if [ "$SHELL" != ${zsh_path} ]; then
    chsh -s ${zsh_path}
fi

# oh-my-zsh
# fix interactive install
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ys theme
${GCL} https://github.com/ss8651twtw/ys.zsh-theme.git ${OMZ}/custom/themes/ys.zsh-theme

# zsh-autosuggestions
${GCL} https://github.com/zsh-users/zsh-autosuggestions ${OMZ}/custom/plugins/zsh-autosuggestions

# zsh-completions
${GCL} https://github.com/zsh-users/zsh-completions ${OMZ}/custom/plugins/zsh-completions

# zsh-syntax-highlighting
${GCL} https://github.com/zsh-users/zsh-syntax-highlighting.git ${OMZ}/custom/plugins/zsh-syntax-highlighting

# setup zshrc
${STOW} zsh

# oh-my-tmux
curl -fLo ${DOT}/tmux/dot-tmux.conf https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf
${STOW} tmux

# tmux restore
# tmux source-file ${DOT}/tmux/dot-tmux.conf

# vimrc
${STOW} vim

# vim plugin
curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa

# global .gitignore
git config --global core.excludesfile ${DOT}/dot-gitignore

# pyenv
# pipenv

# install / update conf

exec $(which zsh)
