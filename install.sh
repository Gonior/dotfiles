#!/bin/bash

set -e

echo "[*] Installing base packages..."

# Daftar package yang sering dipakai di setup minimalis Hyprland
PKGS=(
  hyprland
  hyprshot
  hypridle
  hyprlock
  hyprpaper
  nwg-look
  nwg-displays
  blueman
  networkmanager
  rofi-wayland
  rofi-calc
  waybar
  kitty
  swaync
  network-manager
  ttf-nerd-fonts-symbols
  ttf-fira-sans
  ttf-cascadia-code
  ttf-cascadia-mono-nerd
  ttf-cascadia-code-nerd
  ttf-jetbrains-mono-nerd
  cliphist
  nautilus
  xdg-portal-desktop-hyprland
  xdg-portal-desktop-hyprland
  polkit
  wl-clipboard
  htop
)

sudo pacman -S --needed "${PKGS[@]}"
yay -S pwvucontrol
echo "[*] Linking config files..."

# Buat folder .config kalau belum ada
mkdir -p ~/.config

# Symlink folder config
ln -sf ~/dotfiles/.config/hypr ~/.config/hypr
ln -sf ~/dotfiles/.config/waybar ~/.config/waybar
ln -sf ~/dotfiles/.config/kitty ~/.config/kitty
ln -sf ~/dotfiles/.config/fastfetch ~/.config/fastfetch
ln -sf ~/dotfiles/.config/backgrounds ~/.config/backgrounds
ln -sf ~/dotfiles/.config/goperlay ~/.config/goverlay
ln -sf ~/dotfiles/.config/rofi ~/.config/rofi

# Symlink shell config
ln -sf ~/dotfiles/.bashrc ~/.bashrc

echo "[✓] Dotfiles setup complete!"

