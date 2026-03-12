#!/bin/bash
rm -rf ~/.config/kitty
rm -rf ~/.config/wezterm
rm -rf ~/.config/helix
rm -rf ~/.config/starship.toml

ln -s ~/dotfiles/kitty ~/.config/kitty
ln -s ~/dotfiles/wezterm ~/.config/wezterm
ln -s ~/dotfiles/helix ~/.config/helix
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
