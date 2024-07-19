#!/bin/sh

echo "Updating............................................"
apt update -y


echo "Upgrading..........................................."
apt upgrade -y


echo "Installing git......................................"
apt install git -y


echo "Installing gcc......................................"
apt install gcc -y


echo "Installing clangd..................................."
apt install clang -y


echo "Installing bat......................................"
apt install bat -y

echo "Installing tweak...................................."
add-apt-repository universe -y
apt install gnome-tweaks -y
apt install gnome-shell-extensions -y
apt install chrome-gnome-shell -y


echo "Installing neovim..................................."
snap install nvim --classic


echo "Installing lsd......................................"
snap install lsd --devmode


echo "Installing intellij-ultimate........................"
snap install intellij-idea-ultimate --classic


echo "Installing clion...................................."
snap install clion --classic


echo "Installing rustrover................................"
snap install rustrover --classic










