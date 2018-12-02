#!/bin/sh

LN="ln -s -f"
GCL="git clone"

OMZ="~/.oh-my-zsh"
DOT="~/dotfiles"

# zsh
chsh -s `which zsh`

# oh-my-zsh
${GCL} https://github.com/robbyrussell/oh-my-zsh.git ${OMZ}
${LN} ${DOT}/.zshrc ~/.zshrc

# ys theme
${GCL} https://github.com/ss8651twtw/ys.zsh-theme.git ${OMZ}/custom/themes/ys.zsh-theme

# zsh-autosuggestions
${GCL} https://github.com/zsh-users/zsh-autosuggestions ${OMZ}/custom/plugins/zsh-autosuggestions

# zsh-completions
${GCL} https://github.com/zsh-users/zsh-completions ${OMZ}/custom/plugins/zsh-completions

# zsh-syntax-highlighting
${GCL} https://github.com/zsh-users/zsh-syntax-highlighting.git ${OMZ}/custom/plugins/zsh-syntax-highlighting

# oh-my-tmux
${GCL} https://github.com/gpakosz/.tmux.git ~/.tmux
${LN} ~/.tmux/.tmux.conf ~/.tmux.conf
${LN} ${DOT}/.tmux.conf.local ~/.tmux.conf.local

# zkbd
${LN} ${DOT}/.zkbd ~/.zkbd

# vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa

# snippets
mkdir -p ~/.vim/my-snippets/UltiSnips
${LN} ${DOT}/python.snippets ~/.vim/my-snippets/UltiSnips/python.snippets
