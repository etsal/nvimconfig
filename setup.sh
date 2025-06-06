#!/bin/bash

EXTENSIONS="tokyonight.nvim nvim-lspconfig fzf-lua"

rm -rf ~/.config/nvim
mkdir -p ~/.config/nvim

cp bsdsty.lua ~/.config/nvim/init.lua

rm -rf ~/.local/share/nvim/site/pack/plugins/start/
mkdir -p ~/.local/share/nvim/site/pack/plugins/start/

for extension in $EXTENSIONS; do
	cd $extension;
	git submodule init;
	git submodule update;
	cd -
	cp -r $extension ~/.local/share/nvim/site/pack/plugins/start/
done

sudo dnf install -y clang
sudo dnf install -y fzf
rustup component add rust-analyzer

# Install i3
sudo dnf install -y i3 i3lock i3status nautilus
mkdir -p $HOME/.config/i3
cp $PWD/i3_config $HOME/.config/i3

