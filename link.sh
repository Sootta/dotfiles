#!/bin/bash
rm -rf ~/.config/kitty
rm -rf ~/.config/wezterm
rm -rf ~/.config/helix

ln -s ~/dotfiles/kitty ~/.config/kitty
ln -s ~/dotfiles/wezterm ~/.config/wezterm
ln -s ~/dotfiles/helix ~/.config/helix
