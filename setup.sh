#!/bin/sh

LN="ln -s -f"

# zsh
chsh -s `which zsh`

# oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# ys theme
git clone https://github.com/ss8651twtw/ys.zsh-theme.git ~/.oh-my-zsh/custom/themes/ys.zsh-theme

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# zsh-completions
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# oh-my-tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
${LN} .tmux/.tmux.conf ~/.tmux.conf
${LN} dotfiles/.tmux.conf.local ~/.tmux.conf.local

# zkbd
${LN} dotfiles/.zkbd ~/.zkbd

# vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa

# snippets
mkdir -p ~/.vim/my-snippets/UltiSnips
${LN} dotfiles/python.snippets ~/.vim/my-snippets/UltiSnips/python.snippets
