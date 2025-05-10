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
