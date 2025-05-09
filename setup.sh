#!/bin/bash

EXTENSIONS="tokyonight.nvim nvim-lspconfig fzf-lua"

cp bsdsty.lua ~/.config/nvim/init.lua

rm -rf ~/.local/share/nvim/site/pack/plugins/start/
mkdir -p ~/.local/share/nvim/site/pack/plugins/start/

for extension in $EXTENSIONS; do
	cp -r $extension ~/.local/share/nvim/site/pack/plugins/start/
done

