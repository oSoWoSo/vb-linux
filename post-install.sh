#!/bin/bash
# include <curses.h>
blue=$(tput setaf 4)
green=$(tput setaf 2)
white=$(tput setaf 7)
red=$(tput setaf 1)
none=$(tput sgr0)
version="0.0.1"
progname=${0##*/}
echo "$progname"
echo $version
echo "Source:"
echo "https://codeberg.org/oSoWoSo"

# begin
dialog --colors 3
if [ /bin/dialog ] ;then
	echo -e "\n${green}dialog already installed. Continue...${none}\n"
else
	sudo xbps-install dialog
fi
dialog --checklist "01 - Begin?:" 0 0 0 \
ask "Start ask part" off \
install "Start install using old .tmp files" off \
remove "Remove old answers" off \
exit "Quit $progname" off 2> begin.tmp
if grep 'remove' begin.tmp ;then
	rm *.tmp
fi
if grep 'exit' begin.tmp ;then
	exit
fi

## Ask part ## ---------------------------------------------------------

if grep 'ask' begin.tmp ;then

# basic
dialog --checklist "02 - Basic:" 0 0 0 \
update "update system" off \
recommended "recommended packages" off \
development "development tools" off 2> basic.tmp

# repo
dialog --checklist "03 - Nonfree and repositories:" 0 0 0 \
repomu "void-repo-multilib" off \
repono "void-repo-nonfree" off \
repomn "void-repo-multilib-nonfree" off \
nvidia "Nvidia proprietary drivers" off 2> repo.tmp

# ui
dialog --checklist "04 - Choose user interface:" 0 0 0 \
apps "Choose own aplications" off \
de "Choose desktop environment" off \
wm "Choose window manager" off \
xorg "Instal full xorg only" off \
wayland "Install Wayland only" off 2> ui.tmp

# de
if grep 'de' ui.tmp ;then
	dialog --checklist "05 - Choose desktop environment:" 0 0 0 \
	budgie "budgie" off \
	cinnamon "cinnamon" off \
	enlightenment "enlightenment" off \
	gnome "gnome" off \
	kde "kde plasma" off \
	lumina "lumina" off \
	lxde "lxde" off \
	lxqt "lxqt" off \
	mate "mate" off \
	xfce "xfce" off 2> de.tmp
fi
if grep 'kde' de.tmp ;then
	dialog --checklist "06 - Install kde applications?:" 0 0 0 \
	apps "Install KDE applications" off \
	connect "Install KDE Connect" off 2> kde.tmp
fi
if grep 'gnome' de.tmp ;then
	dialog --checklist "07 - Install gnome applications?:" 0 0 0 \
	apps "Install gnome applications" off 2> gnome.tmp
fi

# wm
if grep 'wm' ui.tmp ;then
	dialog --checklist "08 - Choose windows manager:" 0 0 0 \
	awesome "awesome" off \
	bspwm "bspwm" off \
	dwm "dwm" off \
	fluxbox "fluxbox" off \
	fvwm3 "fvwm3" off \
	herbsluftwm "herbsluftwm" off \
	i3-gaps "i3-gaps" off \
	icewm "icewm" off \
	jwm "jwm" off \
	openbox "openbox" off \
	qtile "qtile" off \
	sway "sway" off \
	wayfire "wayfire" off 2> wm.tmp
fi
if grep 'apps' ui.tmp ;then
# shell
	dialog --checklist "09 - Choose default shell:" 0 0 0 \
	bash "GNU Bourne Again Shell" off \
	fish "User friendly shell intended mostly for interactive use" off \
	zsh "Z shell" off 2> shell.tmp

# dm
	dialog --checklist "10 - Choose display manager:" 0 0 0 \
	cdm "cdm - Console Display Manager" off \
	emptty "emptty - Dead simple Display Manager running in CLI as TTY login" off \
	gdm "gdm - GNOME Display Manager" off \
	lightdm "lightdm - Light Display Manager" off \
	lxdm "lxdm - GUI login manager for LXDE" off \
	nodm "nodm - Minimalistic display manager for automatic logins" off \
	sddm "sddm - QML based X11 display manager" off \
	slim "slim - Desktop-independent graphical login manager for X11" off \
	stdm "stdm - Simple terminal display manager" off \
	xdm "xdm - X Display Manager" off 2> dm.tmp

# terminal
	dialog --checklist "11 - Choose terminal:" 0 0 0 \
	alacritty "alacritty" off \
	aminal "aminal" off \
	aterm "aterm" off \
	cool-retro-term "cool-retro-term" off \
	fbterm "fbterm" off \
	foot "foot (wayland)" off \
	gnome-terminal "gnome-terminal" off \
	kitty "kitty" off \
	konsole "konsole" off \
	lilyterm "lilyterm" off \
	lxterminal "lxterminal" off \
	mate-terminal "mate-terminal" off \
	qterminal "qterminal" off \
	roxterm "roxterm" off \
	rxvt-unicode "rxvt-unicode" off \
	sakura "sakura" off \
	terminal "terminal" off \
	terminator "terminator" off \
	terminology "terminology" off \
	tilix "tilix" off \
	xfce-terminal "xfce-terminal" off \
	xiate "xiate" off \
	xterm "xterm" off \
	yakuake "yakuake" off 2> terminal.tmp

# editor
	dialog --checklist "12 - Choose console text editor:" 0 0 0 \
	emacs "emacs" off \
	micro "micro" off \
	nano "nano" off \
	vim "vim" off 2> editor.tmp

# geditor
	dialog --checklist "13 - Choose graphical text editor:" 0 0 0 \
	atom "atom" off \
	bluefish "bluefish" off \
	code-oss "code-oss" off \
	emacs "emacs" off \
	geany "geany" off \
	gedit "gedit" off \
	gvim "gvim" off \
	gvim-huge "gvim-huge" off \
	kakoune "kakoune" off \
	kate "kate" off \
	leafpad "leafpad" off \
	mousepad "mousepad" off \
	neovim "neovim" off \
	notepoadqq "notepadqq" off \
	sublime "sublime" off \
	vile "vile" off \
	zile "zile" off 2> geditor.tmp

# browser
	dialog --checklist "14 - Choose browser:" 0 0 0 \
	badwolf "badwolf" off \
	chromium "chromium" off \
	falkon "falkon" off \
	firefox "firefox" off \
	firefox-esr "firefox-esr" off \
	qutebrowser "qutebrowser" off 2> browser.tmp

# media
	dialog --checklist "15 - Choose media player:" 0 0 0 \
	audacious "audacious" off \
	deadbeef "deadbeef" off \
	moc "moc" off \
	mplayer "mplayer" off \
	mpv "mpv" off \
	parole "parole" off \
	qmmp "qmmp" off \
	rage-player "rage-player" off \
	strawberry "strawberry" off \
	totem "totem" off \
	vlc "vlc" off \
	xnoise "xnoise" off 2> media.tmp

# net
	dialog --checklist "16 - Choose networking:" 0 0 0 \
	connman "connman" off \
	networkmanager "NetworkManager" off 2> net.tmp
	if grep connman net.tmp ;then
		dialog --checklist "Choose connman frontend:" 0 0 0 \
		cmst "connman qt" off \
		gtk "connman gtk" off \
		ncurses "connman ncurses" off \
		tray "connman tray" off 2> connman.tmp
	fi
	if grep 'networkmanager' net.tmp ;then
		dialog --checklist "Choose NetworkManager frontend:" 0 0 0 \
		gtk "NetworkManager gtk applet" off \
		plasma "NetworkManager plasma applet" off \
		qt "NetworkManager qt applet" off 2> networkmanager.tmp
	fi

# virt
dialog --checklist "17 - Choose virtualization:" 0 0 0 \
aqemu "aqemu" off \
barrier "barrier" off \
passthrough "PCI passthrough" off \
qemu "qemu" off \
qemu-ga "qemu guest agent" off \
virt-manager "virt-manager" off \
vbox "virtualbox" off \
vbox-guest "viartualbox guest utilities" 2> virt.tmp

# backup
dialog --checklist "18 - Choose backup:" 0 0 0 \
borg "borg" off \
dejadup "dejadup" off \
timeshift "timeshift" off 2> backup.tmp
fi
fi

# begin
dialog --checklist "19 - Install?:" 0 0 0 \
ask "Start ask part again" off \
install "Start install" off \
exit "Quit $progname" off 2> begin.tmp
if grep 'ask' begin.tmp ;then
	./"$progname"
fi
if grep 'exit' begin.tmp ;then
	exit
fi

## Install part ## -----------------------------------------------------

if grep 'install' begin.tmp ;then
# basic
if grep 'update' basic.tmp ;then
	echo -e "\n${green}Checking for updates...${none}\n"
	sudo xbps-install -Su
fi
if grep 'recommended' basic.tmp ;then
	echo -e "\n${green}Install recommended packages...${none}\n"
	sudo xbps-install curl wget unzip zip gptfdisk mtools mlocate ntfs-3g fuse-exfat bash-completion linux-headers
fi
if grep 'development' basic.tmp ;then
	echo -e "\n${green}Install development tools...${none}\n"
	sudo xbps-install autoconf automake bison m4 make libtool flex meson ninja optipng sassc
fi

# repo
if grep 'repomu' repo.tmp ;then
	echo -e "\n${green}Install multilib repo...${none}\n"
	sudo xbps-install void-repo-multilib
fi
if grep 'repono' repo.tmp ;then
	echo -e "\n${green}Install nonfree repo...${none}\n"
	sudo xbps-install void-repo-nonfree
fi
if grep 'repomn' repo.tmp ;then
	echo -e "\n${green}Install multilib nonfree repo...${none}\n"
	sudo xbps-install void-repo-multilib-nonfree
fi
if grep 'nvidia' repo.tmp ;then
	echo -e "\n${green}Install latest nvidia drivers...${none}\n"
	sudo xbps-remove fx86-video-nouveau
	sudo xbps-install nvidia 
fi

# ui
if grep 'xorg' ui.tmp ;then
	echo -e "\n${green}Install xorg...${none}\n"
	sudo xbps-install xorg-server xorg-server-xwayland xorg-video-drivers xorg-input-drivers xinit xauth xrandr xrdb xwininfo xdpyinfo xsetroot neofetch
	echo -e "\n${green}Copy configurations...${none}\n"
	if [ ! -d /etc/X11/xorg.conf.d ]; then
		sudo mkdir -p /etc/X11/xorg.conf.d
	fi
fi
if grep 'wayland' ui.tmp ;then
	echo -e "\n${green}Install wayland...${none}\n"
	sudo xbps-install wayland
fi

# de
if grep 'de' ui.tmp ;then
	if grep 'budgie' de.tmp ;then
		echo -e "\n${green}Install budgie...${none}\n"
		sudo xbps-install xorg-minimal budgie-desktop gnome-control-center gnome-system-monitor gnome-terminal nautilus nautilus-sendto gnome-keyring evince gedit gedit-plugins eog eog-plugins gnome-screenshot gnome-disk-utility gvfs gvfs-mtp gvfs-gphoto2 file-roller
	fi
	if grep 'cinnamon' de.tmp ;then
		echo -e "\n${green}Install cinnamon...${none}\n"
		sudo xbps-install xorg-minimal cinnamon gnome-system-monitor gnome-terminal gnome-screenshot gnome-disk-utility gnome-keyring gedit gedit-plugins evince gvfs gvfs-mtp gvfs-gphoto2 eog eog-plugins file-roller
	fi
	if grep 'enlightenment' de.tmp ;then
		echo -e "\n${green}Install enlightenment...${none}\n"
		sudo xbps-install enlightenment terminology mousepad gvfs gvfs-mtp gvfs-gphoto2 zathura zathura-pdf-poppler Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin xarchiver
	fi
	if grep 'gnome' de.tmp ;then
		echo -e "\n${green}Install gnome...${none}\n"
		sudo xbps-install xorg-minimal gnome-shell gnome-control-center gnome-tweaks gnome-system-monitor gnome-terminal gdm gnome-disk-utility nautilus nautilus-sendto gvfs gvfs-mtp gvfs-gphoto2 eog eog-plugins evince gedit gedit-plugins gnome-video-effects gnome-themes-extra gnome-session gnome-screenshot gnome-shell-extensions gnome-icon-theme gnome-icon-theme-extras gnome-icon-theme-symbolic gnome-backgrounds file-roller chrome-gnome-shell totem
		if grep 'apps' gnome.tmp ;then
			echo -e "\n${green}Install gnome applications...${none}\n"
			sudo xbps-install gnome-calendar gnome-clocks gnome-weather evolution gnome-font-viewer gnome-calculator gnome-characters gnome-contacts gnome-documents gnome-maps
		fi
	fi
	if grep 'kde' de.tmp ;then
		echo -e "\n${green}Install kde...${none}\n"
		sudo xbps-install xorg-minimal plasma-desktop plasma-disks plasma-thunderbolt plasma-systemmonitor plasma-pa plasma-nm plasma-firewall plasma-browser-integration plasma-vault latte-dock oxygen kdegraphics-thumbnailers dolphin dolphin-plugins kate5 konsole okular gwenview ark sddm sddm-kcm yakuake spectacle partitionmanager ffmpegthumbs kde-gtk-config5
		if grep 'apps' kde.tmp ;then
			echo -e "\n${green}Install kde applications...${none}\n"
			sudo xbps-install kmail kontact korganizer kaddressbook akregator konversation kcalc kcharselect
		fi
		if grep 'connect' kde.tmp ;then
			echo -e "\n${green}Install kde Connect...${none}\n"
			sudo xbps-install kdeconnect
		fi
	fi
	if grep 'lumina' de.tmp ;then
		echo -e "\n${green}Install lumina...${none}\n"
		sudo xbps-install xorg-minimal lumina lumina-pdf lumina-calculator gvfs gvfs-mtp gvfs-gphoto2 mousepad viewnior
	fi
	if grep 'lxde' de.tmp ;then
		echo -e "\n${green}Install lxde...${none}\n"
		sudo xbps-install xorg-minimal lxde-common lxde-icon-theme lxappearance lxinput lxpanel lxrandr lxsession lxtask lxterminal pcmanfm gvfs gvfs-mtp gvfs-gphoto2 viewnior mousepad zathura zathura-pdf-poppler openbox obconf xarchiver
	fi
	if grep 'lxqt' de.tmp ;then
		echo -e "\n${green}Install lxqt...${none}\n"
		sudo xbps-install xorg-minimal lxqt-about lxqt-admin lxqt-archiver lxqt-build-tools lxqt-config lxqt-globalkeys lxqt-openssh-askpass lxqt-panel lxqt-policykit lxqt-powermanagement lxqt-qtplugin lxqt-runner lxqt-session lxqt-sudo lxqt-themes obconf-qt openbox pcmanfm-qt lximage-qt FeatherPad qlipper qterminal lxqt-notificationd
	fi
	if grep 'mate' de.tmp ;then
		echo -e "\n${green}Install mate...${none}\n"
		sudo xbps-install xorg-minimal mate-applets mate-backgrounds mate-calc mate-control-center mate-desktop mate-icon-theme mate-indicator-applet mate-media mate-menus mate-notification-daemon mate-panel mate-panel-appmenu mate-screensaver mate-sensors-applet mate-session-manager mate-settings-daemon mate-system-monitor mate-terminal mate-themes mate-tweak mate-utils mozo pluma caja caja-image-converter caja-sendto caja-open-terminal caja-wallpaper caja-xattr-tags eom atril gvfs gvfs-mtp gvfs-gphoto2 engrampa mate-power-manager mate-polkit
	fi
	if grep 'xfce' de.tmp ;then
		echo -e "\n${green}Install xfce...${none}\n"
		sudo xbps-install xorg-minimal xfce4-appfinder xfce4-battery-plugin xfce4-clipman-plugin xfce4-cpufreq-plugin xfce4-cpugraph-plugin xfce4-dict xfce4-diskperf-plugin xfce4-fsguard-plugin xfce4-genmon-plugin xfce4-mailwatch-plugin xfce4-mpc-plugin xfce4-netload-plugin xfce4-notifyd xfce4-panel xfce4-panel-appmenu xfce4-places-plugin xfce4-power-manager xfce4-pulseaudio-plugin xfce4-screensaver xfce4-screenshooter xfce4-sensors-plugin xfce4-session xfce4-settings xfce4-systemload-plugin xfce4-taskmanager xfce4-terminal xfce4-timer-plugin xfce4-verve-plugin xfce4-whiskermenu-plugin xfce4-xkb-plugin Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin ristretto xarchiver mousepad xfwm4 xfdesktop zathura zathura-pdf-poppler gvfs gvfs-mtp gvfs-gphoto2 xfce-polkit parole
	fi
fi

# wm
if grep 'wm' ui.tmp ;then
	if grep 'awesome' wm.tmp ;then
		echo -e "\n${green}Install awesome...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers awesome vicious dunst feh arandr Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
	fi
	if grep 'bspwm' wm.tmp ;then
		echo -e "\n${green}Install bspwm...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers bspwm sxhkd dunst feh dmenu arandr Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
	fi
	if grep 'dwm' wm.tmp ;then
		echo -e "\n${green}Install dwm...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers dwm dunst feh dmenu arandr Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
	fi
	if grep 'fluxbox' wm.tmp ;then
		echo -e "\n${green}Install fluxbox...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers fluxbox dunst feh arandr Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
	fi
	if grep 'fvwm3' wm.tmp ;then
		echo -e "\n${green}Install fvwm3...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers fvwm3 feh arandr Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
	fi
	if grep 'herbsluftwm' wm.tmp ;then
		echo -e "\n${green}Install herbsluftwm...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers herbstluftwm dunst feh dmenu arandr Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
	fi
	if grep 'i3'-gaps wm.tmp ;then
		echo -e "\n${green}Install i3-gaps...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers i3-gaps i3lock i3status i3blocks dunst dmenu feh Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin xarchiver lm_sensors acpi playerctl scrot htop arandr gvfs gvfs-mtp gvfs-gphoto2 xfce4-taskmanager viewnior
	fi
	if grep 'icewm' wm.tmp ;then
		echo -e "\n${green}Install icewm...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers icewm dunst feh dmenu arandr Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
	fi
	if grep 'jwm' wm.tmp ;then
		echo -e "\n${green}Install jwm...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers jwm dunst feh dmenu arandr Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
	fi
	if grep 'openbox' wm.tmp ;then
		echo -e "\n${green}Install openbox...${none}\n"
		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers openbox obconf lxappearance jgmenu dunst feh lxrandr lxinput pcmanfm gvfs gvfs-mtp gvfs-gphoto2 lxtask scrot htop xarchiver viewnior tint2conf obmenu-generator
	fi
	if grep 'qtile' wm.tmp ;then
		echo -e "\n${green}Install qtile...${none}\n"
		sudo xbps-install python3 python3-pip python3-setuptools python3-wheel python3-virtualenv-clone python3-dbus python3-gobject pango pango-devel libffi-devel xcb-util-cursor gdk-pixbuf
#		sudo xbps-install xorg-minimal xorg-video-drivers xorg-input-drivers feh arandr Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
		pip install qtile
	fi
	if grep 'sway' wm.tmp ;then
		echo -e "\n${green}Install sway...${none}\n"
		sudo xbps-install wayland elogind dbus-elogind seatd sway swaybg swayidle swaylock azote grimshot Waybar gvfs gvfs-mtp gvfs-gphoto2 htop wofi xf86-video-qxl mesa-dri
	fi
	if grep 'wayfire' wm.tmp ;then
		echo -e "\n${green}Install wayfire...${none}\n"
		sudo xbps-install wayland wayfire grim gvfs gvfs-mtp gvfs-gphoto2 htop wofi mesa-dri
	fi

# shell
	if grep 'bash' shell.tmp ;then
		echo -e "\n${green}Install bash shell...${none}\n"
		sudo xbps-install bash bash-completion
		sudo usermod --shell /bin/bash "$USER"
	fi
	if grep 'fish' shell.tmp ;then
		echo -e "\n${green}Install fish shell...${none}\n"
		sudo xbps-install fish-shell
		sudo usermod --shell /bin/fish "$USER"
	fi
	if grep 'zsh' shell.tmp ;then
		echo -e "\n${green}Install zsh shell...${none}\n"
		sudo xbps-install zsh zsh-autosuggestions zsh-completions \
		zsh-history-substring-search zsh-syntax-highlighting
		sudo usermod --shell /bin/zsh "$USER"
	fi

# dm
	if grep 'cdm' dm.tmp ;then
		echo -e "\n${green}Install cdm...${none}\n"
		sudo xbps-install cdm
	fi
	if grep 'emptty' dm.tmp ;then
		echo -e "\n${green}Install emptty...${none}\n"
		sudo xbps-install emptty
	fi
	if grep 'gdm' dm.tmp ;then
		echo -e "\n${green}Install gdm...${none}\n"
		sudo xbps-install gdm
	fi
	if grep 'lightdm' dm.tmp ;then
		echo -e "\n${green}Install lightdm...${none}\n"
		sudo xbps-install lightdm lightdm-gtk3-greeter lightdm-gtk-greeter-settings
	fi
	if grep 'lxdm' dm.tmp ;then
		echo -e "\n${green}Install lxdm...${none}\n"
		sudo xbps-install lxdm
	fi
	if grep 'nodm' dm.tmp ;then
		echo -e "\n${green}Install nodm...${none}\n"
		sudo xbps-install nodm
	fi
	if grep 'sddm' dm.tmp ;then
		echo -e "\n${green}Install sddm...${none}\n"
		sudo xbps-install sddm
	fi
	if grep 'slim' dm.tmp ;then
		echo -e "\n${green}Install ...${none}\n"
		sudo xbps-install slim slim-void-theme
		sudo cp conf.slim /etc/conf.slim
	fi
	if grep 'stdm' dm.tmp ;then
		echo -e "\n${green}Install stdm...${none}\n"
		sudo xbps-install stdm
	fi
	if grep 'xdm' dm.tmp ;then
		echo -e "\n${green}Install xdm...${none}\n"
		sudo xbps-install xdm
	fi

# terminal
	if grep 'alacritty' terminal.tmp ;then
		echo -e "\n${green}Install alacritty...${none}\n"
		sudo xbps-install alacritty alacritty-terminfo
		export TERMINAL="alacritty"
		printf TERM="alacritty" > ~/.bashrc
		term=alacritty
	fi
	if grep 'aminal' terminal.tmp ;then
		echo -e "\n${green}Install aminal...${none}\n"
		sudo xbps-install aminal
		export TERMINAL="aminal"
		printf TERM="aminal" > ~/.bashrc
		term=aminal
	fi
	if grep 'aterm' terminal.tmp ;then
		echo -e "\n${green}Install aterm...${none}\n"
		sudo xbps-install aterm
		export TERMINAL="aterm"
		printf TERM="aterm" > ~/.bashrc
		term=aterm
	fi
	if grep 'cool-retro-term' terminal.tmp ;then
		echo -e "\n${green}Install cool-retro-term...${none}\n"
		sudo xbps-install cool-retro-term
		export TERMINAL="cool-retro-term"
		printf TERM="cool-retro-term" > ~/.bashrc
		term=cool-retro-term
	fi
	if grep 'fbterm' terminal.tmp ;then
		echo -e "\n${green}Install fbterm...${none}\n"
		sudo xbps-install fbterm
		export TERMINAL="fbterm"
		printf TERM="fbterm" > ~/.bashrc
		term=fbterm
	fi
	if grep 'foot' terminal.tmp ;then
		echo -e "\n${green}Install foot...${none}\n"
		sudo xbps-install foot
		export TERMINAL="foot"
		printf TERM="foot" > ~/.bashrc
		term=foot
	fi
	if grep 'gnome-terminal' terminal.tmp ;then
		echo -e "\n${green}Install gnome-terminal...${none}\n"
		sudo xbps-install gnome-terminal
		export TERMINAL="gnome-terminal"
		printf TERM="gnome-terminal" > ~/.bashrc
		term=gnome-terminal
	fi
	if grep 'kitty' terminal.tmp ;then
		echo -e "\n${green}Install kitty...${none}\n"
		sudo xbps-install kitty kitty-terminfo
		export TERMINAL="kitty"
		printf TERM="kitty" > ~/.bashrc
		term=kitty
	fi
	if grep 'konsole' terminal.tmp ;then
		echo -e "\n${green}Install konsole...${none}\n"
		sudo xbps-install konsole
		export TERMINAL="konsole"
		printf TERM="konsole" > ~/.bashrc
		term=konsole
	fi
	if grep 'lilyterm' terminal.tmp ;then
		echo -e "\n${green}Install lilyterm...${none}\n"
		sudo xbps-install lilyterm
		export TERMINAL="lilyterm"
		printf TERM="lilyterm" > ~/.bashrc
		term=lilyterm
	fi
	if grep 'lxterminal' terminal.tmp ;then
		echo -e "\n${green}Install lxterminal...${none}\n"
		sudo xbps-install lxterminal
		export TERMINAL="lxterminal"
		printf TERM="lxterminal" > ~/.bashrc
		term=lxterminal
	fi
	if grep 'mate-terminal' terminal.tmp ;then
		echo -e "\n${green}Install mate-terminal...${none}\n"
		sudo xbps-install mate-terminal
		export TERMINAL="mate-terminal"
		printf TERM="mate-terminal" > ~/.bashrc
		term=mate-terminal
	fi
	if grep 'qterminal' terminal.tmp ;then
		echo -e "\n${green}Install qterminal...${none}\n"
		sudo xbps-install qterminal
		export TERMINAL="qterminal"
		printf TERM="qterminal" > ~/.bashrc
		term=qterminal
	fi
	if grep 'roxterm' terminal.tmp ;then
		echo -e "\n${green}Install roxterm...${none}\n"
		sudo xbps-install roxterm
		export TERMINAL="roxterm"
		printf TERM="roxterm" > ~/.bashrc
		term=roxterm
	fi
	if grep 'rxvt-unicode' terminal.tmp ;then
		echo -e "\n${green}Install rxvt-unicode...${none}\n"
		sudo xbps-install rxvt-unicode
		export TERMINAL="rxvt-unicode"
		printf TERM="rxvt-unicode" > ~/.bashrc
		term=rxvt-unicode
	fi
	if grep 'sakura' terminal.tmp ;then
		echo -e "\n${green}Install sakura...${none}\n"
		sudo xbps-install sakura
		export TERMINAL="sakura"
		printf TERM="sakura" > ~/.bashrc
		term=sakura
	fi
	if grep 'terminal' terminal.tmp ;then
		echo -e "\n${green}Install terminal...${none}\n"
		sudo xbps-install terminal
		export TERMINAL="terminal"
		printf TERM="terminal" > ~/.bashrc
		term=terminal
	fi
	if grep 'terminator' terminal.tmp ;then
		echo -e "\n${green}Install terminator...${none}\n"
		sudo xbps-install terminator
		export TERMINAL="terminator"
		printf TERM="terminator" > ~/.bashrc
		term=terminator
	fi
	if grep 'terminology' terminal.tmp ;then
		echo -e "\n${green}Install terminology...${none}\n"
		sudo xbps-install terminology
		export TERMINAL="terminology"
		printf TERM="terminology" > ~/.bashrc
		term=terminology
	fi
	if grep 'tilix' terminal.tmp ;then
		echo -e "\n${green}Install tilix...${none}\n"
		sudo xbps-install tilix
		export TERMINAL="tilix"
		printf TERM="tilix" > ~/.bashrc
		term=tilix
	fi
	if grep 'xfce-terminal' terminal.tmp ;then
		echo -e "\n${green}Install xfce-terminal...${none}\n"
		sudo xbps-install xfce-terminal
		export TERMINAL="xfce-terminal"
		printf TERM="xfce-terminal" > ~/.bashrc
		term=xfce-terminal
	fi
	if grep 'xiate' terminal.tmp ;then
		echo -e "\n${green}Install xiate...${none}\n"
		sudo xbps-install xiate
		export TERMINAL="xiate"
		printf TERM="xiate" > ~/.bashrc
		term=xiate
	fi
	if grep 'xterm' terminal.tmp ;then
		echo -e "\n${green}Install xterm...${none}\n"
		sudo xbps-install xterm
		export TERMINAL="xterm"
		printf TERM="xterm" > ~/.bashrc
		term=xterm
	fi
	if grep 'yakuake' terminal.tmp ;then
		echo -e "\n${green}Install yakuake...${none}\n"
		sudo xbps-install yakuake
		export TERMINAL="yakuake"
		printf TERM="yakuake" > ~/.bashrc
		term=yakuake
	fi

# editor
	if grep 'emacs' editor.tmp ;then
		echo -e "\n${green}Install emacs...${none}\n"
		sudo xbps-install emacs
	fi
	if grep 'micro' editor.tmp ;then
		echo -e "\n${green}Install micro...${none}\n"
		sudo xbps-install micro
	fi
	if grep 'nano' editor.tmp ;then
		echo -e "\n${green}Install nano...${none}\n"
		sudo xbps-install nano
	fi
	if grep 'vim' editor.tmp ;then
		echo -e "\n${green}Install vim...${none}\n"
		sudo xbps-install vim vim-colorschemes
	fi

# geditor
	if grep 'atom' geditor.tmp ;then
		echo -e "\n${green}Install atom...${none}\n"
		sudo xbps-install atom
	fi
	if grep 'bluefish' geditor.tmp ;then
		echo -e "\n${green}Install bluefish...${none}\n"
		sudo xbps-install bluefish
	fi
	if grep 'code-oss' geditor.tmp ;then
		echo -e "\n${green}Install code-oss...${none}\n"
		sudo xbps-install vscode
	fi
	if grep 'emacs' geditor.tmp ;then
		echo -e "\n${green}Install emacs...${none}\n"
		sudo xbps-install emacs emacs-common
		dialog --checklist "Choose emacs frontend:" 0 0 0 \
		x11 "emacs x11" off \
		gtk2 "emacs" off \
		gtk3 "emacs" off \
		qemaqcs "qemacs" off 2> emacs.tmp
		if grep x11 emacs.tmp ;then
		sudo xbps-install emacs-x11
		elif grep gtk2 emacs.tmp ;then
		sudo xbps-install emacs-gtk2
		elif grep gtk3 emacs.tmp ;then
		sudo xbps-install emacs-gtk3
		elif grep qemacs emacs.tmp ;then
		sudo xbps-install qemacs
		fi
	fi
	if grep 'geany' geditor.tmp ;then
		echo -e "\n${green}Install geany...${none}\n"
		sudo xbps-install geany geany-plugins geany-plugins-extra
	fi
	if grep 'gedit' geditor.tmp ;then
		echo -e "\n${green}Install gedit...${none}\n"
		sudo xbps-install gedit gedit-plugins
	fi
	if grep 'gvim' geditor.tmp ;then
		echo -e "\n${green}Install gvim...${none}\n"
		sudo xbps-install gvim
	fi
	if grep 'gvim-huge' geditor.tmp ;then
		echo -e "\n${green}Install gvim-huge...${none}\n"
		sudo xbps-install gvim-huge
	fi
	if grep 'kakoune' geditor.tmp ;then
		echo -e "\n${green}Install kakoune...${none}\n"
		sudo xbps-install kakoune
	fi
	if grep 'kate' geditor.tmp ;then
		echo -e "\n${green}Install kate...${none}\n"
		sudo xbps-install kate5
	fi
	if grep 'leafpad' geditor.tmp ;then
		echo -e "\n${green}Install leafpad...${none}\n"
		sudo xbps-install leafpad
	fi
	if grep 'mousepad' geditor.tmp ;then
		echo -e "\n${green}Install mousepad...${none}\n"
		sudo xbps-install mousepad
	fi
	if grep 'neovim' geditor.tmp ;then
		echo -e "\n${green}Install neovim...${none}\n"
		sudo xbps-install neovim
	fi
	if grep 'notepadqq' geditor.tmp ;then
		echo -e "\n${green}Install notepadqq...${none}\n"
		sudo xbps-install notepadqq
	fi
	if grep 'sublime' geditor.tmp ;then
		echo -e "\n${green}Install sublime...${none}\n"
		sudo xbps-install sublime-text3
	fi
	if grep 'vile' geditor.tmp ;then
		echo -e "\n${green}Install vile...${none}\n"
		sudo xbps-install vile
	fi
	if grep 'zile' geditor.tmp ;then
		echo -e "\n${green}Install zile...${none}\n"
		sudo xbps-install zile
	fi

# browser
	if grep 'badwolf' browser.tmp ;then
		echo -e "\n${green}Install badwolf...${none}\n"
		sudo xbps-install badwolf
	fi
	if grep 'chromium' browser.tmp ;then
		echo -e "\n${green}Install chromium...${none}\n"
		sudo xbps-install chromium
	fi
	if grep 'falkon' browser.tmp ;then
		echo -e "\n${green}Install falkon...${none}\n"
		sudo xbps-install falkon
	fi
	if grep 'firefox' browser.tmp ;then
		echo -e "\n${green}Install firefox...${none}\n"
		sudo xbps-install firefox
	fi
	if grep 'firefox-esr' browser.tmp ;then
		echo -e "\n${green}Install firefox-esr...${none}\n"
		sudo xbps-install firefox-esr
	fi
	if grep 'qutebrowser' browser.tmp ;then
		echo -e "\n${green}Install qutebrowser...${none}\n"
		sudo xbps-install qutebrowser
	fi

# media
	if grep 'audacious' media.tmp ;then
		echo -e "\n${green}Install audacious...${none}\n"
		sudo xbps-install audacious
	fi
	if grep 'deadbeef' media.tmp ;then
		echo -e "\n${green}Install deadbeef...${none}\n"
		sudo xbps-install deadbeef
	fi
	if grep 'moc' media.tmp ;then
		echo -e "\n${green}Install moc...${none}\n"
		sudo xbps-install moc
	fi
	if grep 'mplayer' media.tmp ;then
		echo -e "\n${green}Install mplayer...${none}\n"
		sudo xbps-install mplayer
	fi
	if grep 'mpv' media.tmp ;then
		echo -e "\n${green}Install mpv...${none}\n"
		sudo xbps-install mpv
	fi
	if grep 'parole' media.tmp ;then
		echo -e "\n${green}Install parole...${none}\n"
		sudo xbps-install parole
	fi
	if grep 'qmmp' media.tmp ;then
		echo -e "\n${green}Install qmmp...${none}\n"
		sudo xbps-install qmmp
	fi
	if grep 'rage-player' media.tmp ;then
		echo -e "\n${green}Install rage-player...${none}\n"
		sudo xbps-install rage-player
	fi
	if grep 'strawberry' media.tmp ;then
		echo -e "\n${green}Install strawberry...${none}\n"
		sudo xbps-install strawberry
	fi
	if grep 'totem' media.tmp ;then
		echo -e "\n${green}Install totem...${none}\n"
		sudo xbps-install totem
	fi
	if grep 'vlc' media.tmp ;then
		echo -e "\n${green}Install vlc...${none}\n"
		sudo xbps-install vlc
	fi
	if grep 'xnoise' media.tmp ;then
		echo -e "\n${green}Install xnoise...${none}\n"
		sudo xbps-install xnoise
	fi

# net
	if grep 'connman' net.tmp ;then
		echo -e "\n${green}Install connman...${none}\n"
		sudo xbps-install connman
		if grep 'cmst' connman.tmp ;then
			sudo xbps-install cmst
		fi
		if grep 'gtk' connman.tmp ;then
			sudo xbps-install connman-gtk
		fi
		if grep 'ncurses' connman.tmp ;then
			sudo xbps-install connman-ncurses
		fi
		if grep 'tray' connman.tmp ;then
			sudo xbps-install connman-ui
		fi
		if [ -L /var/service/connmand ]; then
			echo -n "$green"
			echo "Service connmand already exist. Continue.${none}\n"
		else
			sudo ln -sv /etc/sv/connmand /var/service
		fi
	fi
	if grep 'networkmanager' net.tmp ;then
		echo -e "\n${green}Install NetworkManager...${none}\n"
		sudo xbps-install NetworkManager NetworkManager-openvpn NetworkManager-openconnect NetworkManager-vpnc NetworkManager-l2tp
		if grep 'gtk' networkmanager.tmp ;then
			echo -e "\n${green}Install NetworkManager applet...${none}\n"
			sudo xbps-install network-manager-applet
		fi
		if grep 'qt' networkmanager.tmp ;then
			echo -e "\n${green}Install NetworkManager tray icon qt...${none}\n"
			sudo xbps-install nm-tray
		fi
		if grep 'plasma' networkmanager.tmp ;then
			echo -e "\n${green}Install NetworkManager plasma applet...${none}\n"
			sudo xbps-install plasma-nm
		fi
		sudo ln -sv /etc/sv/NetworkManager /var/service
	fi
fi

# virt
if grep 'aqemu' virt.tmp ;then
	echo -e "\n${green}Install aqemu...${none}\n"
	sudo xbps-install aqemu
fi
if grep 'barrier' virt.tmp ;then
	echo -e "\n${green}Install barrier...${none}\n"
	sudo xbps-install barrier barrier-gui
fi
if grep 'passthrough' virt.tmp ;then
	echo -e "\n${green}Install passthrough...${none}\n"
	if [ -a /sbin/vfio-pci-override-vga.sh ] ;then
		echo "Please uninstall Passthrough Helper first! Then run gpu_passthrough.sh again."
		exit
	fi
	echo "Installing required packages"
	sudo xbps-install -S qemu libvirt virt-manager wget
	echo "Activating libvirt services"
	sudo gpasswd -a "$USER" libvirt
	sudo ln -s /etc/sv/libvirtd /var/service
	sudo ln -s /etc/sv/virtlockd /var/service
	sudo ln -s /etc/sv/virtlogd /var/service
	echo  "Creating backups"
	cat /etc/default/grub > grub_backup.txt
	if [ -a /etc/modprobe.d/local.conf ] ;then
		sudo mv /etc/modprobe.d/local.conf modprobe.backup
	fi
	if [ -a /etc/dracut.conf.d/local.conf ] ;then
		sudo mv /etc/dracut.conf.d/local.conf local.conf.backup
	fi
	chmod +x uninstall.sh
	sudo cp /etc/default/grub new_grub
	CPU=$(lscpu | grep GenuineIntel | rev | cut -d ' ' -f 1 | rev )
	INTEL="0"
	if [ "$CPU" = "GenuineIntel" ] ;then
		INTEL="1"
	fi
	if [ $INTEL = 1 ] ;then
		IOMMU="intel_iommu=on rd.driver.pre=vfio-pci kvm.ignore_msrs=1"
		echo "Set Intel IOMMU On"
	else
		IOMMU="amd_iommu=on rd.driver.pre=vfio-pci kvm.ignore_msrs=1"
		echo "Set AMD IOMMU On"
	fi
	OLD_OPTIONS=`cat new_grub | grep GRUB_CMDLINE_LINUX | cut -d '"' -f 1,2`
	NEW_OPTIONS="$OLD_OPTIONS $IOMMU\""
	echo "$NEW_OPTIONS"
	sed -i -e "s|^GRUB_CMDLINE_LINUX.*|${NEW_OPTIONS}|" new_grub
	EDITOR=$EDITOR
	if [ -e /bin/nano ] ;then
		EDITOR=nano
	elif  [ -e /bin/micro ] ;then
		EDITOR=micro
	else
		EDITOR=vim
	fi
	echo 
	echo "Grub was modified to look like this: "
	echo `cat new_grub | grep "GRUB_CMDLINE_LINUX"`
	echo 
	echo "Do you want to edit it? y/n"
	read YN
	if [ $YN = y ] ;then
	$EDITOR new_grub
	fi
	sudo cp new_grub /etc/default/grub
	echo "Getting GPU passthrough scripts ready"
	sudo cp vfio-pci-override-vga.sh /sbin/vfio-pci-override-vga.sh
	sudo chmod 755 /sbin/vfio-pci-override-vga.sh
	sudo echo "install vfio-pci /sbin/vfio-pci-override-vga.sh" > /etc/modprobe.d/local.conf
	sudo cp local.conf /etc/dracut.conf.d/local.conf
	echo "Updating grub and generating initramfs"
	sudo grub-mkconfig -o /boot/grub/grub.cfg
	sudo dracut -f --kver $(uname -r)
	echo -e "\n${green}Getting latest ovmf from kraxel.org${none}\n"
	wget -m -np -nd -A "edk2.git-ovmf-x64*.noarch.rpm" https://www.kraxel.org/repos/jenkins/edk2/
	mv *.noarch.rpm edk2.git-ovmf-x64.noarch.rpm
	if [ -e /bin/rpmextract ] ;then
		rpmextract edk2.git-ovmf-x64.noarch.rpm
	else
		xbps-install -y rpmextract
		rpmextract edk2.git-ovmf-x64.noarch.rpm
		xbps-remove -y rpmextract
	fi
	sudo cp -rv usr/share /usr/
	echo -e "\n${green}Script finished${none}\n"
fi
if grep 'qemu' virt.tmp ;then
	echo -e "\n${green}Install qemu...${none}\n"
	sudo xbps-install qemu
fi
if grep 'qemu-ga' virt.tmp ;then
	echo -e "\n${green}Install qemu guest agent...${none}\n"
	sudo xbps-install qemu-ga
fi
if grep 'virt-manager' virt.tmp ;then
	echo -e "\n${green}Install virt-manager...${none}\n"
	sudo xbps-install virt-manager libvirt
	sudo ln -sv /etc/sv/libvirtd /var/service
fi
if grep 'vbox' virt.tmp ;then
	echo -e "\n${green}Install virtualbox...${none}\n"
	sudo xbps-install virtualbox-ose
fi
if grep 'vbox-guest' virt.tmp ;then
	echo -e "\n${green}Install virtualbox guest utilities...${none}\n"
	sudo xbps-install virtualbox-ose-guest
fi

# backup
if grep 'borg' backup.tmp ;then
	echo -e "\n${green}Install borg...${none}\n"
	sudo xbps-install borg
fi
if grep 'dejadup' backup.tmp ;then
	echo -e "\n${green}Install dejadup...${none}\n"
	sudo xbps-install dejadup
fi
if grep 'timeshift' backup.tmp ;then
	echo -e "\n${green}Install timeshift...${none}\n"
	sudo xbps-install timeshift
fi
echo -e "\n${green}Enjoy Void linux...${none}\n"
fi
