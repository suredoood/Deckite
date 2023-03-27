#!/bin/sh

# The majority of the script below originates from the following:
#  https://codeberg.org/wario622/steamdeckscript/src/branch/main/steamosprograms.sh
# and I have made some additions for some programs I also wish to install on first setup.

sudo -v
echo ________________________________
echo ________________________________
echo ________________________________
echo Is this your first time running the script? Respond with Y for yes or N for no
read Y
if [ $Y = 'Y' ]
then 
	# ungoogled-chromium repo
	curl -s 'https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/x86_64/home_ungoogled_chromium_Arch.key' | sudo pacman-key -a -
	echo '
	[home_ungoogled_chromium_Arch]
	SigLevel = Required TrustAll
	Server = https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/$arch' | sudo tee --append /etc/pacman.conf
	sudo pacman --noconfirm -Sy 
	# multilib
	echo '
	[multilib]
	Include = /etc/pacman.d/mirrorlist' | sudo tee --append /etc/pacman.conf
	# AMD drivers
	sudo pacman --noconfirm -Syyu git go base-devel lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
	# Installs YAY
	cd /tmp
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg --syncdeps --install --noconfirm
	# Install Pamac
	yay --noconfirm -S pamac-aur pamac-tray-icon-plasma 
	sudo sed --in-place "s/#EnableAUR/EnableAUR/" "/etc/pamac.conf"
	sudo sed --in-place "s/#CheckAURUpdates/CheckAURUpdates/" "/etc/pamac.conf"
elif [ $Y = 'y' ]
then
	# ungoogled-chromium repo
	curl -s 'https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/x86_64/home_ungoogled_chromium_Arch.key' | sudo pacman-key -a -
	echo '
	[home_ungoogled_chromium_Arch]
	SigLevel = Required TrustAll
	Server = https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/$arch' | sudo tee --append /etc/pacman.conf
	sudo pacman --noconfirm -Sy 
	# multilib
	echo '
	[multilib]
	Include = /etc/pacman.d/mirrorlist' | sudo tee --append /etc/pacman.conf
	# AMD drivers
	sudo pacman --noconfirm -Syyu git go base-devel lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
	# Installs YAY
	cd /tmp
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg --syncdeps --install --noconfirm
	# Install Pamac
	yay --noconfirm -S pamac-aur pamac-tray-icon-plasma 
	sudo sed --in-place "s/#EnableAUR/EnableAUR/" "/etc/pamac.conf"
	sudo sed --in-place "s/#CheckAURUpdates/CheckAURUpdates/" "/etc/pamac.conf"
else 
	sudo pacman --noconfirm -Syyu
fi
echo ________________________________
echo ________________________________
echo ________________________________
echo ________________________________
echo ________________________________
echo ________________________________
echo ________________________________
echo ________________________________
echo ________________________________
echo ________________________________
echo ________________________________
echo ________________________________
echo ________________________________
echo ________________________________

echo Do you want to install ALL software? Respond with Y for yes or N for no
read Y
if [ $Y = 'Y' ]
then 
	sudo pacman --noconfirm -Sy ungoogled-chromium
	yay --noconfirm -S heroic-games-launcher-bin minecraft-launcher lutris discord spotify
	elif [ $Y = 'y' ]
	then
	sudo pacman --noconfirm -Sy ungoogled-chromium
	yay --noconfirm -S heroic-games-launcher-bin minecraft-launcher lutris discord spotify 
else
# Minecraft
	echo Do u want to install Minecraft? Respond with Y for yes or N for no
	read Y
	if [ $Y = 'Y' ]
	then
		MC='minecraft-launcher '
	elif [ $Y = 'y' ]
	then 
		MC='minecraft-launcher '
	else 
		MC=''
	fi
	# Epic Games
	echo Do u want to install the Heoric Games Launcher '(Epic Games)'? Respond with Y for yes or N for no
	read Y
	if [ $Y = 'Y' ]
	then
		HG='heroic-games-launcher-bin '
	elif [ $Y = 'y' ]
	then
		HG='heroic-games-launcher-bin '
	else 
		HG=''
	fi
	# Lutris
	echo Do u want to install the Lutris game Launcher? Respond with Y for yes or N for no
	read Y
	if [ $Y = 'Y' ]
	then
		LU='lutris '
	elif [ $Y = 'y' ]
	then
		LU='lutris '
	else
		LU=''
	fi
	# Discord
	echo Do u want to install Discord? Respond with Y for yes or N for no
	read Y
	if [ $Y = 'Y' ]
	then
		DIS='discord '
	elif [ $Y = 'y' ]
	then
		DIS='discord '
	else 
		DIS=''
	fi
	# Spotify
	echo Do u want to install Spotify? Respond with Y for yes or N for no
	read Y
	if [ $Y = 'Y' ]
	then
		SPOT='spotify '
	elif [ $Y = 'y' ]
	then
		SPOT='spotify '
	else 
		SPOT=''
	fi
	#ungoogled-chromium
	echo Do u want to install ungoogled-chromium? Respond with Y for yes or N for no
	read Y
	if [ $Y = 'Y' ]
	then
	sudo pacman --noconfirm -Sy ungoogled-chromium
	elif [ $Y = 'y' ]
	then
	sudo pacman --noconfirm -Sy ungoogled-chromium
	fi
	echo yay --noconfirm -Syu $MC$HG$LU$DIS$SPOT
	yay --noconfirm -Syu $MC$HG$LU$DIS$SPOT
fi


### LINES BELOW ADDED BY SHERVIN

# install cryoutils
# this was gained by looking at the desktop shortcut that is run in the instructions in the following README
# https://github.com/CryoByte33/steam-deck-utilities/blob/main/InstallCryoUtilities.desktop

curl https://raw.githubusercontent.com/CryoByte33/steam-deck-utilities/main/install.sh | bash -s --

# install decky-loader
# this line is taken directly from their README

curl -L https://github.com/SteamDeckHomebrew/decky-installer/releases/latest/download/install_release.sh | sh

# install ProtonUp-Qt
# basic pacman line

# sudo pacman --noconfirm -Sy protonup-qt
