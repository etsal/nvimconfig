#!/bin/bash

EXTENSIONS="tokyonight.nvim nvim-lspconfig fzf-lua"
OTHER="Xresources-themes mkosi"

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

# System packages
sudo pacman -Sy clang
sudo pacman -Sy fzf

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer

# Install i3 (not necessary on CachyOS)
 sudo pacman -Sy nautilus
# mkdir -p $HOME/.config/i3
# cp $PWD/i3_config $HOME/.config/i3

# Install fonts for xterm
mkdir -p $HOME/.local/share
cp -r Xresources-themes $HOME/.local/share/Xresources-themes

# Install xterm and its config
sudo pacman -Sy xterm
cp $PWD/Xresources ~/.Xresources

sudo pacman -Sy python-pip 
sudo pacman -Sy qemu
python3 -m venv ~/venv
echo "source $HOME/venv/bin/activate.fish" >> $HOME/.bashrc
