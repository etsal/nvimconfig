#!/bin/bash

EXTENSIONS="tokyonight.nvim nvim-lspconfig fzf-lua"
OTHER="Xresources-themes"

rm -rf ~/.config/nvim
mkdir -p ~/.config/nvim

cp bsdsty.lua ~/.config/nvim/init.lua

rm -rf ~/.local/share/nvim/site/pack/plugins/start/
mkdir -p ~/.local/share/nvim/site/pack/plugins/start/

for repo in $EXTENSIONS $OTHER; do
	cd $repo;
	git submodule init;
	git submodule update;
	cd -
done

for extension in "$EXTENSIONS"; do
	cp -r $extension ~/.local/share/nvim/site/pack/plugins/start/
done

sudo dnf install -y clang
sudo dnf install -y fzf
rustup component add rust-analyzer

# Install i3
sudo dnf install -y i3 i3lock i3status nautilus
mkdir -p $HOME/.config/i3
cp $PWD/i3_config $HOME/.config/i3

# Install fonts for xterm
mkdir -p $HOME/.local/share
cp -r Xresources-themes $HOME/.local/share/Xresources-themes

# Install xterm itself
sudo dnf install -y xterm
cp $PWD/Xresources ~/.Xresources
