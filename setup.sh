#!/bin/bash
DOTFILES=${DOTFILES:-$HOME/dotfiles}

sudo pacman -Sy --noconfirm --needed \emacs code ttf-fira-mono ttf-fira-code
  zsh zsh-completions wget

# Install Emacs dotfiles
ln -s $DOTFILES/.emacs $HOME
ln -s $DOTFILES/.emacs-profile $HOME
ln -s $DOTFILES/.emacs-profiles.el $HOME

git clone "https://github.com/hlissner/doom-emacs.git" $HOME/doom-emacs
ln -s $DOTFILES/doom-emacs-private $HOME/.config/doom
sh $HOME/doom-emacs/bin/doom install

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

echo "PROMPT='%{\$fg[yellow]%}[%D{%T}] '\$PROMPT" >> $HOME/.zshrc
cp $DOTFILES/.zshenv $HOME
chsh -s /bin/zsh

# Install VS Code settings.
# TODO: Install VS Code extensions
cp $DOTFILES/vscode/settings.json "$HOME/.config/Code - OSS/User/settings.json"
