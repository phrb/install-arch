#! /usr/bin/bash

shopt -s dotglob

X_FILES=X/*
X_DEST=~

SCRIPTS=scripts/*
SCRIPTS_DEST=~

WICD=wicd/*
WICD_DEST=/etc/wicd

VIM=vim
ZSH=zsh
HTOP=htop
AWESOME=awesome
PACMAN=pacman

echo "> Starting system configuration"

echo "> Configuring pacman..."
sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sudo cp $PACMAN/mirrorlist /etc/pacman.d/
echo "> mirrorlist"

sudo mv /etc/pacman.conf /etc/pacman.conf.backup
sudo cp $PACMAN/pacman.conf /etc/
echo "> pacman.conf"

echo "> Installing packages..."
sudo pacman -S --needed --noconfirm - < $PACMAN/packages.txt

echo "> Installing yaourt..."
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg --noconfirm -si
cd ..

git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg --noconfirm -si
cd ..

rm -rf package-query yaourt

echo "> Checking for updates..."
sudo pacman --noconfirm -Syu
yaourt --noconfirm -Syu --aur

echo "> Moving X config files..."
for file in $X_FILES
do
    cp $file $X_DEST
    echo "> $file"
done

echo "> Moving scripts..."
for file in $SCRIPTS
do
    cp $file $SCRIPTS_DEST
    chmod +x $SCRIPTS_DEST/$file
    echo "> $file"
done

echo "> Moving vim and zsh files..."
cp $ZSH/.zshrc $VIM/.vimrc ~

echo "> Moving awesomewm files..."
cp $AWESOME/rc.lua ~/.config/awesome
cp $AWESOME/theme.lua ~/.config/awesome/themes/default

echo "> Moving htop files..."
cp $HTOP/htoprc ~/.config/htop/

echo "> Create chrome download directory..."
mkdir ~/chr-downloads

echo "> Changing shell to zsh..."
sudo chsh -s /usr/bin/zsh

echo "> Done!"
echo "> Rebooting..."
systemctl reboot
