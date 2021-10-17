#!/bin/bash
#set -e
green=$(tput setaf 2)
none=$(tput sgr0)
if [ -f /bin/dialog ]; then
	echo -e "\n${green}dialog already installed...${none}\n"
else
	sudo xbps-install dialog
fi
begin=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --menu "01 - Begin" 0 0 0)
options=(
	ask "Ask part" \
	install "Install without ask again" \
	remove "Remove .tmp files" \
	exit "Quit $progname")
selections=$("${begin[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
case $selection in
ask)
	echo 'ask' > begin.tmp
	;;
install)
	echo 'install' > begin.tmp
	;;
remove)
	rm ./*tmp*
	begin
	;;
exit)
	exit
	;;
	esac
done

main=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --menu "99 - Main" 0 0 0)
options=(
	mirrors "01 - Choose mirror" \
	basic "02 - basic" \
	repo "03 - non-free and repositories" \
	ui "04 - Choose user interface" \
	de "05 - Choose desktop environment" \
	wm "06 - Choose windows manager" \
	shell "07 - Choose shell" \
	dm "08 - Choose display manager" \
	terminal "09 - Choose terminal emulator" \
	editor "10 - Choose console text editor" \
	geditor "11 - Choose graphical text editor" \
	browser "12 - Choose browser" \
	media "13 - Choose media player" \
	net "14 - Choose networking options" \
	virt "15 - Choose virtualization options" \
	backup "16 - Choose backup" \
	misc "17 - Miscellaneous options" \
	exit "Rather quit installer")
selections=$("${main[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
case $selection in
mirrors)
	echo mirrors
	;;
basic)
	echo basic
	;;
repo)
	echo repo
	;;
ui)
	echo ui
	;;
de)
	echo de
	;;
wm)
	echo wm
	;;
shell)
	echo shell
	;;
dm)
	echo dm
	;;
terminal)
	echo terminal
	;;
editor)
	echo editor
	;;
geditor)
	echo geditor
	;;
browser)
	echo browser
	;;
media)
	echo media
	;;
net)
	echo net
	;;
virt)
	echo virt
	;;
backup)
	echo backup
	;;
misc)
	echo misc
	;;
exit)
	exit
	;;
	esac
done

if grep 'ask' begin.tmp ;then
	mirrors=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --menu "02 - Choose mirror:" 0 0 0)
	options=(
		00 "No change" \
		01 "Revert to default mirror" \
		02 "Asia:Almaty,KZ	https://mirror.ps.kz/voidlinux" \
		03 "Asia:China	https://mirrors.bfsu.edu.cn/voidlinux" \
		04 "Asia:China	https://mirrors.cnnic.cn/voidlinux" \
		05 "Asia:China	https://mirrors.tuna.tsinghua.edu.cn/voidlinux" \
		06 "Asia:China	https://mirror.sjtu.edu.cn/voidlinux" \
		07 "Asia:Seoul,SK	https://mirror.maakpain.kro.kr/void" \
		08 "Asia:Singapore	https://void.webconverger.org" \
		09 "AU:Canberra	https://mirror.aarnet.edu.au/pub/voidlinux" \
		10 "AU:Melbourne	https://ftp.swin.edu.au/voidlinux" \
		11 "EU:Amsterdam,NL	https://void.cijber.net" \
		12 "EU:Denmark	http://ftp.dk.xemacs.org/voidlinux" \
		13 "EU:Denmark	https://mirrors.dotsrc.org/voidlinux" \
		14 "EU:Finland	https://alpha.de.repo.voidlinux.org" \
		15 "EU:Haarlem,NL	https://mirror.erickochen.nl/voidlinux" \
		16 "EU:Hungary	https://quantum-mirror.hu/mirrors/pub/voidlinux" \
		17 "EU:Monaco	https://voidlinux.qontinuum.space:4443" \
		18 "EU:Prague,CZ	https://mirror.fit.cvut.cz/voidlinux" \
		19 "EU:Russia	http://ftp.debian.ru/mirrors/voidlinux" \
		20 "EU:Russia	https://mirror.yandex.ru/mirrors/voidlinux" \
		21 "EU:Sweden	https://cdimage.debian.org/mirror/voidlinux" \
		22 "EU:Sweden	https://ftp.acc.umu.se/mirror/voidlinux" \
		23 "EU:Sweden	https://ftp.lysator.liu.se/pub/voidlinux" \
		24 "EU:Sweden	https://ftp.sunet.se/mirror/voidlinux" \
		25 "USA:Chicago	https://mirrors.servercentral.com/voidlinux" \
		26 "USA:KansasCity	https://alpha.us.repo.voidlinux.org" \
		27 "USA:NewYork	https://mirror.clarkson.edu/voidlinux" )
fi
selections=$("${mirrors[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
case $selection in
00)
	continue
	;;
01)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	;;
02)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://mirror.ps.kz/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
03)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://mirrors.bfsu.edu.cn/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
04)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://mirrors.cnnic.cn/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
05)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://mirrors.tuna.tsinghua.edu.cn/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
06)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://mirror.sjtu.edu.cn/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
07)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://mirror.maakpain.kro.kr/void|g' /etc/xbps.d/*-repository-*.conf
	;;
08)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://void.webconverger.org|g' /etc/xbps.d/*-repository-*.conf
	;;
09)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://mirror.aarnet.edu.au/pub/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
10)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://ftp.swin.edu.au/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
11)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://void.cijber.net|g' /etc/xbps.d/*-repository-*.conf
	;;
12)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|http://ftp.dk.xemacs.org/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
13)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://mirrors.dotsrc.org/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
14)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://alpha.de.repo.voidlinux.org|g' /etc/xbps.d/*-repository-*.conf
	;;
15)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://mirror.erickochen.nl/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
16)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://quantum-mirror.hu/mirrors/pub/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
17)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://voidlinux.qontinuum.space:4443|g' /etc/xbps.d/*-repository-*.conf
	;;
18)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://mirror.fit.cvut.cz/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
19)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|http://ftp.debian.ru/mirrors/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
20)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://mirror.yandex.ru/mirrors/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
21)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://cdimage.debian.org/mirror/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
22)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://ftp.acc.umu.se/mirror/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
23)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://ftp.lysator.liu.se/pub/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
24)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://ftp.sunet.se/mirror/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
25)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://mirrors.servercentral.com/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
26)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://alpha.us.repo.voidlinux.org|g' /etc/xbps.d/*-repository-*.conf
	;;
27)
	sudo mkdir -p /etc/xbps.d
	sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
	sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://mirror.clarkson.edu/voidlinux|g' /etc/xbps.d/*-repository-*.conf
	;;
	esac
done

basic=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --separate-output --checklist "03 - basic:" 0 0 0)
options=(
	update "update system" off \
	recommended "recommended packages" off \
	development "development tools" off)
selections=$("${basic[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
case $selection in
update)
	echo -e "\n${green}Checking for updates...${none}\n"
	sudo xbps-install -Su
	;;
recommended)
	echo -e "\n${green}Install recommended packages...${none}\n"
	sudo xbps-install curl wget unzip zip gptfdisk mtools mlocate ntfs-3g fuse-exfat bash-completion linux-headers
	;;
development)
	echo -e "\n${green}Install development tools...${none}\n"
	sudo xbps-install autoconf automake bison m4 make libtool flex meson ninja optipng sassc
	;;
	esac
done

repo=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --separate-output --checklist "04 - non-free and repositories:" 0 0 0)
options=(
	repomu "void-repo-multilib" off \
	repono "void-repo-nonfree" off \
	repomn "void-repo-multilib-nonfree" off \
	nvidia "Nvidia proprietary drivers" off)
selections=$("${repo[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
case $selection in
repomu)
	echo -e "\n${green}Install multilib repo...${none}\n"
	sudo xbps-install void-repo-multilib
	;;
repono)
	echo -e "\n${green}Install nonfree repo...${none}\n"
	sudo xbps-install void-repo-nonfree
	;;
repomn)
	echo -e "\n${green}Install multilib nonfree repo...${none}\n"
	sudo xbps-install void-repo-multilib-nonfree
	;;
nvidia)
	echo -e "\n${green}Install latest nvidia drivers...${none}\n"
	sudo xbps-remove fx86-video-nouveau
	sudo xbps-install nvidia
	;;
	esac
done

ui=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --separate-output --checklist "05 - Choose user interface:" 0 0 0)
options=(
	apps "Choose own apllications" off \
	de "Desktop environment" off \
	wm "Window manager and/or apps" off \
	minimal "Minimal xorg" off \
	xorg "Full xorg" off \
	wayland "Wayland" off)
selections=$("${ui[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
case $selection in
apps)

	;;
de)

	;;
wm)

	;;
minimal)
	echo -e "\n${green}Install xorg...${none}\n"
	sudo xbps-install xorg-minimal xorg-video-drivers
	;;
xorg)
	echo -e "\n${green}Install xorg...${none}\n"
	sudo xbps-install xorg-server xorg-server-xwayland xorg-video-drivers xorg-input-drivers xinit xauth xrandr xrdb xwininfo xdpyinfo xsetroot neofetch
	if [ ! -d /etc/X11/xorg.conf.d ]; then
		sudo mkdir -p /etc/X11/xorg.conf.d
	fi
	;;
wayland)
	echo -e "\n${green}Install wayland...${none}\n"
	sudo xbps-install wayland
	;;
	esac
done

de=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --separate-output --checklist "06 - Choose desktop environment:" 0 0 0)
options=(
	budgie "budgie" off \
	cinnamon "cinnamon" off \
	enlightenment "enlightenment" off \
	gnome "gnome" off \
	gnomeapps "Install gnome applications" off \
	kde "kde plasma" off \
	kdeapps "Install kde appliacations" off \
	connect "Install kde connect" off \
	lumina "lumina" off \
	lxde "lxde" off \
	lxqt "lxqt" off \
	mate "mate" off \
	xfce "xfce" off)
selections=$("${de[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
	case $selection in
budgie)
	echo -e "\n${green}Install budgie...${none}\n"
	sudo xbps-install xorg-minimal budgie-desktop gnome-control-center gnome-system-monitor gnome-terminal nautilus nautilus-sendto gnome-keyring evince gedit gedit-plugins eog eog-plugins gnome-screenshot gnome-disk-utility gvfs gvfs-mtp gvfs-gphoto2 file-roller
	;;
cinnamon)
	echo -e "\n${green}Install cinnamon...${none}\n"
	sudo xbps-install xorg-minimal cinnamon gnome-system-monitor gnome-terminal gnome-screenshot gnome-disk-utility gnome-keyring gedit gedit-plugins evince gvfs gvfs-mtp gvfs-gphoto2 eog eog-plugins file-roller
	;;
enlightenment)
	echo -e "\n${green}Install enlightenment...${none}\n"
	sudo xbps-install enlightenment terminology mousepad gvfs gvfs-mtp gvfs-gphoto2 zathura zathura-pdf-poppler Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin xarchiver
	;;
gnome)
	echo -e "\n${green}Install gnome...${none}\n"
	sudo xbps-install xorg-minimal gnome-shell gnome-control-center gnome-tweaks gnome-system-monitor gnome-terminal gdm gnome-disk-utility nautilus nautilus-sendto gvfs gvfs-mtp gvfs-gphoto2 eog eog-plugins evince gedit gedit-plugins gnome-video-effects gnome-themes-extra gnome-session gnome-screenshot gnome-shell-extensions gnome-icon-theme gnome-icon-theme-extras gnome-icon-theme-symbolic gnome-backgrounds file-roller chrome-gnome-shell totem
	;;
gnomeapps)
	echo -e "\n${green}Install gnome applications...${none}\n"
	sudo xbps-install gnome-calendar gnome-clocks gnome-weather evolution gnome-font-viewer gnome-calculator gnome-characters gnome-contacts gnome-documents gnome-maps
	;;
kde)
	echo -e "\n${green}Install kde...${none}\n"
	sudo xbps-install xorg-minimal plasma-desktop plasma-disks plasma-thunderbolt plasma-systemmonitor plasma-pa plasma-nm plasma-firewall plasma-browser-integration plasma-vault latte-dock oxygen kdegraphics-thumbnailers dolphin dolphin-plugins kate5 konsole okular gwenview ark sddm sddm-kcm yakuake spectacle partitionmanager ffmpegthumbs kde-gtk-config5
	;;
kdeapps)
	echo -e "\n${green}Install kde applications...${none}\n"
	sudo xbps-install kmail kontact korganizer kaddressbook akregator konversation kcalc kcharselect
	;;
connect)
	echo -e "\n${green}Install kde Connect...${none}\n"
	sudo xbps-install kdeconnect
	;;
lumina)
	echo -e "\n${green}Install lumina...${none}\n"
	sudo xbps-install xorg-minimal lumina lumina-pdf lumina-calculator gvfs gvfs-mtp gvfs-gphoto2 mousepad viewnior
	;;
lxde)
	echo -e "\n${green}Install lxde...${none}\n"
	sudo xbps-install xorg-minimal lxde-common lxde-icon-theme lxappearance lxinput lxpanel lxrandr lxsession lxtask lxterminal pcmanfm gvfs gvfs-mtp gvfs-gphoto2 viewnior mousepad zathura zathura-pdf-poppler openbox obconf xarchiver
	;;
lxqt)
	echo -e "\n${green}Install lxqt...${none}\n"
	sudo xbps-install xorg-minimal lxqt-about lxqt-admin lxqt-archiver lxqt-build-tools lxqt-config lxqt-globalkeys lxqt-openssh-askpass lxqt-panel lxqt-policykit lxqt-powermanagement lxqt-qtplugin lxqt-runner lxqt-session lxqt-sudo lxqt-themes obconf-qt openbox pcmanfm-qt lximage-qt FeatherPad qlipper qterminal lxqt-notificationd
	;;
mate)
	echo -e "\n${green}Install mate...${none}\n"
	sudo xbps-install xorg-minimal mate-applets mate-backgrounds mate-calc mate-control-center mate-desktop mate-icon-theme mate-indicator-applet mate-media mate-menus mate-notification-daemon mate-panel mate-panel-appmenu mate-screensaver mate-sensors-applet mate-session-manager mate-settings-daemon mate-system-monitor mate-terminal mate-themes mate-tweak mate-utils mozo pluma caja caja-image-converter caja-sendto caja-open-terminal caja-wallpaper caja-xattr-tags eom atril gvfs gvfs-mtp gvfs-gphoto2 engrampa mate-power-manager mate-polkit
	;;
xfce)
	echo -e "\n${green}Install xfce...${none}\n"
	sudo xbps-install xorg-minimal xfce4-appfinder xfce4-battery-plugin xfce4-clipman-plugin xfce4-cpufreq-plugin xfce4-cpugraph-plugin xfce4-dict xfce4-diskperf-plugin xfce4-fsguard-plugin xfce4-genmon-plugin xfce4-mailwatch-plugin xfce4-mpc-plugin xfce4-netload-plugin xfce4-notifyd xfce4-panel xfce4-panel-appmenu xfce4-places-plugin xfce4-power-manager xfce4-pulseaudio-plugin xfce4-screensaver xfce4-screenshooter xfce4-sensors-plugin xfce4-session xfce4-settings xfce4-systemload-plugin xfce4-taskmanager xfce4-terminal xfce4-timer-plugin xfce4-verve-plugin xfce4-whiskermenu-plugin xfce4-xkb-plugin Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin ristretto xarchiver mousepad xfwm4 xfdesktop zathura zathura-pdf-poppler gvfs gvfs-mtp gvfs-gphoto2 xfce-polkit parole
	;;
	esac
done

wm=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --separate-output --checklist "07 - Choose windows manager:" 0 0 0)
options=(
	2bwm "Fast floating window manager" off \
	afterstep "Window Manager based on the look and feel of the NeXTStep interface" off \
	awesome "Highly configurable, next gen framework window manager for X" off \
	berry "Healthy, bite-sized window manager" off \
	blackboxwm "Stacking window manager for X11" off \
	bspwm "Tiling window manager based on binary space partitioning" off \
	byobu "Open source text-based window manager and terminal multiplexer" off \
	compiz "Compiz window manager meta-package" off \
	ctwm "Claude's Tab Window Manager" off \
	dvtm "Tiling window manager for the console" off \
	dwm "Dynamic window manager for X" off \
	evilwm "Minimalist window manager for the X Window System" off \
	fluxbox "Highly configurable and low resource X11 Window manager" off \
	fvwm "Extremely powerful ICCCM-compliant window manager" off \
	fvwm3 "Multiple large virtual desktop window manager" off \
	goomwwm "Get out of my way, Window Manager!" off \
	herbsluftwm "Manual tiling window manager for X" off \
	hikari "Stacking Wayland compositor with tiling features" off \
	i3 "Improved tiling window manager" off \
	i3-gaps "Improved tiling window manager - i3 fork with more features" off \
	icewm "Window Manager designed for speed, usability, and consistency" off \
	jwm "A light-weight window manager for the X11 Window System" off \
	mcwm "A minimalist stacking X window manager based on XCB" off \
	monsterwm "Minimal and lightweight dynamic tiling window manager" off \
	musca "Tiling window manager, with features nicked from ratpoison and dwm" off \
	mutter "Lightweight GTK+3 window manager" off \
	openbox "Standards compliant, fast, light-weight, extensible window manager" off \
	oroborus "A minimalistic window manager" off \
	pekwm "Window manager based on aewm++" off \
	qtile "A full-featured, hackable tiling window manager written and configured in Python" off \
	ratpoison "Window manager without mouse dependency" off \
	snapwm "Minimal and lightweight dynamic tiling window manager" off \
	sowm "Itsy bitsy floating window manager" off \
	spectrwm "Small dynamic tiling window manager for X11" off \
	subtle "Manual tiling window manager" off \
	sway "Tiling Wayland compositor compatible with i3" off \
	swm "A simple window manager" off \
	tinywm "Ridiculously tiny window manager" off \
	tmuxc "Local and remote tmux window manager" off \
	twm "Tab Window Manager for the X Window System" off \
	uwm "The ultimate window manager" off \
	vtwm "Virtual tab window manager" off \
	wayfire "3D wayland compositor" off \
	weston "Reference implementation of a Wayland compositor" off \
	wm2 "a simple window manager for X" off \
	wmderlan "Tiling window manager" off \
	wmfs "Window Manager From Scratch" off \
	wmii "Lightweight, dynamic window manager for X11" off \
	wmx "Simple window manager for X" off \
	xfwm4 "Next generation window manager for Xfce" off \
	xmonad "Tiling window manager fully configurable in Haskell" off \
	yeahwm "Window manager for X based on evilwm and aewm" off)
selections=$("${wm[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
	case $selection in
2bwm)
	echo -e "\n${green}Install 2bwm...${none}\n"
	sudo xbps-install 2bwm
	;;
afterstep)
	echo -e "\n${green}Install afterstep...${none}\n"
	sudo xbps-install afterstep
	;;
awesome)
	echo -e "\n${green}Install awesome...${none}\n"
	sudo xbps-install awesome
	;;
berry)
	echo -e "\n${green}Install berry...${none}\n"
	sudo xbps-install berry
	;;
blacboxwm)
	echo -e "\n${green}Install blacboxwm...${none}\n"
	sudo xbps-install blacboxwm
	;;
bspwm)
	echo -e "\n${green}Install bspwm...${none}\n"
	sudo xbps-install bspwm sxhkd
	;;
byobu)
	echo -e "\n${green}Install byobu...${none}\n"
	sudo xbps-install byobu
	;;
compiz)
	echo -e "\n${green}Install compiz...${none}\n"
	sudo xbps-install compiz-reloaded
	;;
ctwm)
	echo -e "\n${green}Install ctwm...${none}\n"
	sudo xbps-install ctwm
	;;
dvtm)
	echo -e "\n${green}Install dvtm...${none}\n"
	sudo xbps-install dvtm
	;;
dwm)
	echo -e "\n${green}Install dwm...${none}\n"
	sudo xbps-install dwm
	;;
evilwm)
	echo -e "\n${green}Install evilwm...${none}\n"
	sudo xbps-install evilwm
	;;
fluxbox)
	echo -e "\n${green}Install fluxbox...${none}\n"
	sudo xbps-install fluxbox dunst feh arandr Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
	;;
fvwm)
	echo -e "\n${green}Install fvwm...${none}\n"
	sudo xbps-install fvwm
	;;
fvwm3)
	echo -e "\n${green}Install fvwm3...${none}\n"
	sudo xbps-install fvwm3 feh arandr Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
	;;
goomwwm)
	echo -e "\n${green}Install goomwwm...${none}\n"
	sudo xbps-install goomwwm
	;;
herbsluftwm)
	echo -e "\n${green}Install herbsluftwm...${none}\n"
	sudo xbps-install herbstluftwm
	;;
hikari)
	echo -e "\n${green}Install hikari...${none}\n"
	sudo xbps-install hikari
	;;
i3)
	echo -e "\n${green}Install i3...${none}\n"
	sudo xbps-install i3
	;;
i3-gaps)
	echo -e "\n${green}Install i3-gaps...${none}\n"
	sudo xbps-install i3-gaps i3lock i3status i3blocks dunst dmenu feh Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin xarchiver lm_sensors acpi playerctl scrot htop arandr gvfs gvfs-mtp gvfs-gphoto2 xfce4-taskmanager viewnior
	;;
icewm)
	echo -e "\n${green}Install icewm...${none}\n"
	sudo xbps-install icewm
	;;
jwm)
	echo -e "\n${green}Install jwm...${none}\n"
	sudo xbps-install jwm
	;;
mcwm)
	echo -e "\n${green}Install mcwm...${none}\n"
	sudo xbps-install mcwm
	;;
monsterwm)
	echo -e "\n${green}Install monsterwm...${none}\n"
	sudo xbps-install monsterwm
	;;
musca)
	echo -e "\n${green}Install musca...${none}\n"
	sudo xbps-install musca
	;;
mutter)
	echo -e "\n${green}Install mutter...${none}\n"
	sudo xbps-install mutter
	;;
openbox)
	echo -e "\n${green}Install openbox...${none}\n"
	sudo xbps-install openbox obconf lxappearance jgmenu dunst feh lxrandr lxinput pcmanfm gvfs gvfs-mtp gvfs-gphoto2 lxtask scrot htop xarchiver viewnior tint2conf obmenu-generator
	;;
oroborus)
	echo -e "\n${green}Install oroborus...${none}\n"
	sudo xbps-install oroborus
	;;
pekwm)
	echo -e "\n${green}Install pekwm...${none}\n"
	sudo xbps-install pekwm
	;;
qtile)
	echo -e "\n${green}Install qtile...${none}\n"
	sudo xbps-install python3 python3-pip python3-setuptools python3-wheel python3-virtualenv-clone python3-dbus python3-gobject pango pango-devel libffi-devel xcb-util-cursor gdk-pixbuf
#	sudo xbps-install feh arandr Thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin gvfs gvfs-mtp gvfs-gphoto2 scrot htop xarchiver viewnior
	pip install qtile
	;;
ratpoison)
	echo -e "\n${green}Install ratpoison...${none}\n"
	sudo xbps-install ratpoison
	;;
snapwm)
	echo -e "\n${green}Install snapwm...${none}\n"
	sudo xbps-install snapwm
	;;
sowm)
	echo -e "\n${green}Install sowm...${none}\n"
	sudo xbps-install sowm
	;;
spectrwm)
	echo -e "\n${green}Install spectrwm...${none}\n"
	sudo xbps-install spectrwm
	;;
subtle)
	echo -e "\n${green}Install subtle...${none}\n"
	sudo xbps-install subtle
	;;
sway)
	echo -e "\n${green}Install sway...${none}\n"
	sudo xbps-install wayland elogind dbus-elogind seatd sway swaybg swayidle swaylock azote grimshot Waybar gvfs gvfs-mtp gvfs-gphoto2 htop wofi xf86-video-qxl mesa-dri
	;;
swm)
	echo -e "\n${green}Install swm...${none}\n"
	sudo xbps-install swm
	;;
tinywm)
	echo -e "\n${green}Install tinywm...${none}\n"
	sudo xbps-install tinywm
	;;
tmuxc)
	echo -e "\n${green}Install tmuxc...${none}\n"
	sudo xbps-install tmuxc
	;;
twm)
	echo -e "\n${green}Install twm...${none}\n"
	sudo xbps-install twm
	;;
uwm)
	echo -e "\n${green}Install uwm...${none}\n"
	sudo xbps-install uwm
	;;
vtwm)
	echo -e "\n${green}Install vtwm...${none}\n"
	sudo xbps-install vtwm
	;;
wayfire)
	echo -e "\n${green}Install wayfire...${none}\n"
	sudo xbps-install wayland wayfire grim gvfs gvfs-mtp gvfs-gphoto2 htop wofi mesa-dri
	;;
weston)
	echo -e "\n${green}Install weston...${none}\n"
	sudo xbps-install weston
	;;
wm2)
	echo -e "\n${green}Install wm2...${none}\n"
	sudo xbps-install wm2
	;;
wmderlan)
	echo -e "\n${green}Install wmderlan...${none}\n"
	sudo xbps-install wmderlan
	;;
wmfs)
	echo -e "\n${green}Install wmfs...${none}\n"
	sudo xbps-install wmfs
	;;
wmii)
	echo -e "\n${green}Install wmii...${none}\n"
	sudo xbps-install wmii
	;;
wmx)
	echo -e "\n${green}Install wmx...${none}\n"
	sudo xbps-install wmx
	;;
xfwm4)
	echo -e "\n${green}Install xfwm4...${none}\n"
	sudo xbps-install xfwm4
	;;
xmonad)
	echo -e "\n${green}Install xmonad...${none}\n"
	sudo xbps-install xmonad
	;;
yaehwm)
	echo -e "\n${green}Install yaehwm...${none}\n"
	sudo xbps-install yaehwm
	esac
done

shell=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --separate-output --checklist "08 - Choose shell:" 0 0 0)
options=(
	bash "GNU Bourne Again Shell" off \
	fish "User friendly shell intended mostly for interactive use" off \
	zsh "Z shell" off)
selections=$("${shell[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
	case $selection in
bash)
	echo -e "\n${green}Install bash shell...${none}\n"
	sudo xbps-install bash bash-completion
	sudo usermod --shell /bin/bash "$USER"
	;;
fish)
	echo -e "\n${green}Install fish shell...${none}\n"
	sudo xbps-install fish-shell
	sudo usermod --shell /bin/fish "$USER"
	;;
zsh)
	echo -e "\n${green}Install zsh shell...${none}\n"
	sudo xbps-install zsh zsh-autosuggestions zsh-completions \
	zsh-history-substring-search zsh-syntax-highlighting
	sudo usermod --shell /bin/zsh "$USER"
	;;
	esac
done

dm=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --separate-output --checklist "09 - Choose display manager:" 0 0 0)
options=(
	cdm "cdm - Console Display Manager" off \
	emptty "emptty - Dead simple Display Manager running in CLI as TTY login" off \
	gdm "gdm - GNOME Display Manager" off \
	lightdm "lightdm - Light Display Manager" off \
	lxdm "lxdm - GUI login manager for LXDE" off \
	nodm "nodm - Minimalistic display manager for automatic logins" off \
	sddm "sddm - QML based X11 display manager" off \
	slim "slim - Desktop-independent graphical login manager for X11" off \
	stdm "stdm - Simple terminal display manager" off \
	xdm "xdm - X Display Manager" off)
selections=$("${dm[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
	case $selection in
cdm)
echo -e "\n${green}Install cdm...${none}\n"
	sudo xbps-install cdm
	;;
emptty)
	echo -e "\n${green}Install emptty...${none}\n"
	sudo xbps-install emptty
	;;
gdm)
	echo -e "\n${green}Install gdm...${none}\n"
	sudo xbps-install gdm
	;;
lightdm)
	echo -e "\n${green}Install lightdm...${none}\n"
	sudo xbps-install lightdm lightdm-gtk3-greeter lightdm-gtk-greeter-settings
	;;
lxdm)
	echo -e "\n${green}Install lxdm...${none}\n"
	sudo xbps-install lxdm
	;;
nodm)
	echo -e "\n${green}Install nodm...${none}\n"
	sudo xbps-install nodm
	;;
sddm)
	echo -e "\n${green}Install sddm...${none}\n"
	sudo xbps-install sddm
	;;
slim)
	echo -e "\n${green}Install ...${none}\n"
	sudo xbps-install slim slim-void-theme
	sudo cp conf.slim /etc/conf.slim
	;;
stdm)
	echo -e "\n${green}Install stdm...${none}\n"
	sudo xbps-install stdm
	;;
xdm)
	echo -e "\n${green}Install xdm...${none}\n"
	sudo xbps-install xdm
	;;
	esac
done

terminal=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --separate-output --checklist "10 - Choose terminal emulator:" 0 0 0)
options=(
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
	yakuake "yakuake" off)
selections=$("${terminal[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
	case $selection in
alacritty)
	echo -e "\n${green}Install alacritty...${none}\n"
	sudo xbps-install alacritty alacritty-terminfo
	export TERMINAL="alacritty"
	printf TERM="alacritty" > ~/.bashrc
	term=alacritty
	;;
aminal)
	echo -e "\n${green}Install aminal...${none}\n"
	sudo xbps-install aminal
	export TERMINAL="aminal"
	printf TERM="aminal" > ~/.bashrc
	term=aminal
	;;
aterm)
	echo -e "\n${green}Install aterm...${none}\n"
	sudo xbps-install aterm
	export TERMINAL="aterm"
	printf TERM="aterm" > ~/.bashrc
	term=aterm
	;;
cool-retro-term)
	echo -e "\n${green}Install cool-retro-term...${none}\n"
	sudo xbps-install cool-retro-term
	export TERMINAL="cool-retro-term"
	printf TERM="cool-retro-term" > ~/.bashrc
	term=cool-retro-term
	;;
fbterm)
	echo -e "\n${green}Install fbterm...${none}\n"
	sudo xbps-install fbterm
	export TERMINAL="fbterm"
	printf TERM="fbterm" > ~/.bashrc
	term=fbterm
	;;
foot)
	echo -e "\n${green}Install foot...${none}\n"
	sudo xbps-install foot
	export TERMINAL="foot"
	printf TERM="foot" > ~/.bashrc
	term=foot
	;;
gnome-terminal)
	echo -e "\n${green}Install gnome-terminal...${none}\n"
	sudo xbps-install gnome-terminal
	export TERMINAL="gnome-terminal"
	printf TERM="gnome-terminal" > ~/.bashrc
	term=gnome-terminal
	;;
kitty)
	echo -e "\n${green}Install kitty...${none}\n"
	sudo xbps-install kitty kitty-terminfo
	export TERMINAL="kitty"
	printf TERM="kitty" > ~/.bashrc
	term=kitty
	;;
konsole)
	echo -e "\n${green}Install konsole...${none}\n"
	sudo xbps-install konsole
	export TERMINAL="konsole"
	printf TERM="konsole" > ~/.bashrc
	term=konsole
	;;
lilyterm)
	echo -e "\n${green}Install lilyterm...${none}\n"
	sudo xbps-install lilyterm
	export TERMINAL="lilyterm"
	printf TERM="lilyterm" > ~/.bashrc
	term=lilyterm
	;;
lxterminal)
	echo -e "\n${green}Install lxterminal...${none}\n"
	sudo xbps-install lxterminal
	export TERMINAL="lxterminal"
	printf TERM="lxterminal" > ~/.bashrc
	term=lxterminal
	;;
mate-terminal)
	echo -e "\n${green}Install mate-terminal...${none}\n"
	sudo xbps-install mate-terminal
	export TERMINAL="mate-terminal"
	printf TERM="mate-terminal" > ~/.bashrc
	term=mate-terminal
	;;
qterminal)
	echo -e "\n${green}Install qterminal...${none}\n"
	sudo xbps-install qterminal
	export TERMINAL="qterminal"
	printf TERM="qterminal" > ~/.bashrc
	term=qterminal
	;;
roxterm)
	echo -e "\n${green}Install roxterm...${none}\n"
	sudo xbps-install roxterm
	export TERMINAL="roxterm"
	printf TERM="roxterm" > ~/.bashrc
	term=roxterm
	;;
rxvt-unicode)
	echo -e "\n${green}Install rxvt-unicode...${none}\n"
	sudo xbps-install rxvt-unicode
	export TERMINAL="rxvt-unicode"
	printf TERM="rxvt-unicode" > ~/.bashrc
	term=rxvt-unicode
	;;
sakura)
	echo -e "\n${green}Install sakura...${none}\n"
	sudo xbps-install sakura
	export TERMINAL="sakura"
	printf TERM="sakura" > ~/.bashrc
	term=sakura
	;;
terminal)
	echo -e "\n${green}Install terminal...${none}\n"
	sudo xbps-install terminal
	export TERMINAL="terminal"
	printf TERM="terminal" > ~/.bashrc
	term=terminal
	;;
terminator)
	echo -e "\n${green}Install terminator...${none}\n"
	sudo xbps-install terminator
	export TERMINAL="terminator"
	printf TERM="terminator" > ~/.bashrc
	term=terminator
	;;
terminology)
	echo -e "\n${green}Install terminology...${none}\n"
	sudo xbps-install terminology
	export TERMINAL="terminology"
	printf TERM="terminology" > ~/.bashrc
	term=terminology
	;;
tilix)
	echo -e "\n${green}Install tilix...${none}\n"
	sudo xbps-install tilix
	export TERMINAL="tilix"
	printf TERM="tilix" > ~/.bashrc
	term=tilix
	;;
xfce-terminal)
	echo -e "\n${green}Install xfce-terminal...${none}\n"
	sudo xbps-install xfce-terminal
	export TERMINAL="xfce-terminal"
	printf TERM="xfce-terminal" > ~/.bashrc
	term=xfce-terminal
	;;
xiate)
	echo -e "\n${green}Install xiate...${none}\n"
	sudo xbps-install xiate
	export TERMINAL="xiate"
	printf TERM="xiate" > ~/.bashrc
	term=xiate
	;;
xterm)
	echo -e "\n${green}Install xterm...${none}\n"
	sudo xbps-install xterm
	export TERMINAL="xterm"
	printf TERM="xterm" > ~/.bashrc
	term=xterm
	;;
yakuake)
	echo -e "\n${green}Install yakuake...${none}\n"
	sudo xbps-install yakuake
	export TERMINAL="yakuake"
	printf TERM="yakuake" > ~/.bashrc
	term=yakuake
	;;
	esac
done

editor=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --separate-output --checklist "11 - Choose console text editor:" 0 0 0)
options=(
	emacs "emacs" off \
	micro "micro" off \
	nano "nano" off \
	vim "vim" off)
selections=$("${editor[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
	case $selection in
emacs)
	echo -e "\n${green}Install emacs...${none}\n"
	sudo xbps-install emacs
	;;
micro)
	echo -e "\n${green}Install micro...${none}\n"
	sudo xbps-install micro
	;;
nano)
	echo -e "\n${green}Install nano...${none}\n"
	sudo xbps-install nano
	;;
vim)
	echo -e "\n${green}Install vim...${none}\n"
	sudo xbps-install vim vim-colorschemes
	;;
	esac
done

geditor=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --separate-output --checklist "12 - Choose graphical text editor:" 0 0 0)
options=(
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
	zile "zile" off)
selections=$("${geditor[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
	case $selection in
atom)
	echo -e "\n${green}Install atom...${none}\n"
	sudo xbps-install atom
	;;
bluefish)
	echo -e "\n${green}Install bluefish...${none}\n"
	sudo xbps-install bluefish
	;;
code-oss)
	echo -e "\n${green}Install code-oss...${none}\n"
	sudo xbps-install vscode
	;;
emacs)
	echo -e "\n${green}Install emacs...${none}\n"
	sudo xbps-install emacs emacs-common
	dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --separate-output --checklist "Choose emacs frontend:" 0 0 0 \
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
	;;
geany)
	echo -e "\n${green}Install geany...${none}\n"
	sudo xbps-install geany geany-plugins geany-plugins-extra
	;;
gedit)
	echo -e "\n${green}Install gedit...${none}\n"
	sudo xbps-install gedit gedit-plugins
	;;
gvim)
	echo -e "\n${green}Install gvim...${none}\n"
	sudo xbps-install gvim
	;;
gvim-huge)
	echo -e "\n${green}Install gvim-huge...${none}\n"
	sudo xbps-install gvim-huge
	;;
kakoune)
	echo -e "\n${green}Install kakoune...${none}\n"
	sudo xbps-install kakoune
	;;
kate)
	echo -e "\n${green}Install kate...${none}\n"
	sudo xbps-install kate5
	;;
leafpad)
	echo -e "\n${green}Install leafpad...${none}\n"
	sudo xbps-install leafpad
	;;
mousepad)
	echo -e "\n${green}Install mousepad...${none}\n"
	sudo xbps-install mousepad
	;;
neovim)
	echo -e "\n${green}Install neovim...${none}\n"
	sudo xbps-install neovim
	;;
notepadqq)
	echo -e "\n${green}Install notepadqq...${none}\n"
	sudo xbps-install notepadqq
	;;
sublime)
	echo -e "\n${green}Install sublime...${none}\n"
	sudo xbps-install sublime-text3
	;;
vile)
	echo -e "\n${green}Install vile...${none}\n"
	sudo xbps-install vile
	;;
zile)
	echo -e "\n${green}Install zile...${none}\n"
	sudo xbps-install zile
	;;
	esac
done

browser=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --separate-output --checklist "13 - Choose browser:" 0 0 0)
options=(
	badwolf "badwolf" off \
	chromium "chromium" off \
	falkon "falkon" off \
	firefox "firefox" off \
	firefox-esr "firefox-esr" off \
	qutebrowser "qutebrowser" off)
selections=$("${browser[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
	case $selection in
badwolf)
	echo -e "\n${green}Install badwolf...${none}\n"
	sudo xbps-install badwolf
	;;
chromium)
	echo -e "\n${green}Install chromium...${none}\n"
	sudo xbps-install chromium
	;;
falkon)
	echo -e "\n${green}Install falkon...${none}\n"
	sudo xbps-install falkon
	;;
firefox)
	echo -e "\n${green}Install firefox...${none}\n"
	sudo xbps-install firefox
	;;
firefox-esr)
	echo -e "\n${green}Install firefox-esr...${none}\n"
	sudo xbps-install firefox-esr
	;;
qutebrowser)
	echo -e "\n${green}Install qutebrowser...${none}\n"
	sudo xbps-install qutebrowser
	;;
	esac
done

media=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --separate-output --checklist "14 - Choose media player:" 0 0 0)
options=(
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
	xnoise "xnoise" off)
selections=$("${media[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
	case $selection in
audacious)
	echo -e "\n${green}Install audacious...${none}\n"
	sudo xbps-install audacious
	;;
deadbeef)
	echo -e "\n${green}Install deadbeef...${none}\n"
	sudo xbps-install deadbeef
	;;
moc)
	echo -e "\n${green}Install moc...${none}\n"
	sudo xbps-install moc
	;;
mplayer)
	echo -e "\n${green}Install mplayer...${none}\n"
	sudo xbps-install mplayer
	;;
mpv)
	echo -e "\n${green}Install mpv...${none}\n"
	sudo xbps-install mpv
	;;
parole)
	echo -e "\n${green}Install parole...${none}\n"
	sudo xbps-install parole
	;;
qmmp)
	echo -e "\n${green}Install qmmp...${none}\n"
	sudo xbps-install qmmp
	;;
rage-player)
	echo -e "\n${green}Install rage-player...${none}\n"
	sudo xbps-install rage-player
	;;
strawberry)
	echo -e "\n${green}Install strawberry...${none}\n"
	sudo xbps-install strawberry
	;;
totem)
	echo -e "\n${green}Install totem...${none}\n"
	sudo xbps-install totem
	;;
vlc)
	echo -e "\n${green}Install vlc...${none}\n"
	sudo xbps-install vlc
	;;
xnoise)
	echo -e "\n${green}Install xnoise...${none}\n"
	sudo xbps-install xnoise
	;;
	esac
done

network=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --separate-output --checklist "15 - Choose networking options:" 0 0 0)
options=(
	connman "connman" off \
	cmst "connman qt" off \
	conngtk "connman gtk" off \
	connncurses "connman ncurses" off \
	conntray "connman tray" off \
	networkmanager "NetworkManager" off \
	nmgtk "NetworkManager gtk applet" off \
	nmplasma "NetworkManager plasma applet" off \
	nmqt "NetworkManager qt applet" off)
selections=$("${network[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
	case $selection in
connman)
	echo -e "\n${green}Install connman...${none}\n"
	sudo xbps-install connman
	if [ -L /var/service/connmand ]; then
		echo -e "\n${green}Service connmand already exist. Continue.${none}\n"
	else
	sudo ln -sv /etc/sv/connmand /var/service
	fi
	;;
cmst)
	echo -e "\n${green}Install cmst for connman...${none}\n"
	sudo xbps-install cmst
	;;
conngtk)
	echo -e "\n${green}Install connman-gtk...${none}\n"
	sudo xbps-install connman-gtk
	;;
connncurses)
	echo -e "\n${green}Install connman-ncurses...${none}\n"
	sudo xbps-install connman-ncurses
	;;
conntray)
	echo -e "\n${green}Install connman-ui...${none}\n"
	sudo xbps-install connman-ui
	;;
networkmanager)
	echo -e "\n${green}Install NetworkManager...${none}\n"
	sudo xbps-install NetworkManager NetworkManager-openvpn NetworkManager-openconnect NetworkManager-vpnc NetworkManager-l2tp
	sudo ln -sv /etc/sv/NetworkManager /var/service
	;;
nmgtk)
	echo -e "\n${green}Install NetworkManager applet...${none}\n"
	sudo xbps-install network-manager-applet
	;;
nmqt)
	echo -e "\n${green}Install NetworkManager tray icon qt...${none}\n"
	sudo xbps-install nm-tray
	;;
nmplasma)
	echo -e "\n${green}Install NetworkManager plasma applet...${none}\n"
	sudo xbps-install plasma-nm
	;;
	esac
done

virt=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --separate-output --checklist "16 - Choose virtualization options:" 0 0 0)
options=(
	aqemu "aqemu" off \
	barrier "barrier" off \
	passthrough "PCI passthrough" off \
	qemu "qemu" off \
	qemu-ga "qemu guest agent" off \
	virt-manager "virt-manager" off \
	vbox "virtualbox" off \
	vbox-guest "viartualbox guest utilities" off)
selections=$("${virt[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
	case $selection in
aqemu)
	echo -e "\n${green}Install aqemu...${none}\n"
	sudo xbps-install aqemu
	;;
barrier)
	echo -e "\n${green}Install barrier...${none}\n"
	sudo xbps-install barrier barrier-gui
	;;
passthrough)
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
	if [ "$YN" = y ] ;then
		$EDITOR new_grub
	fi
	sudo cp new_grub /etc/default/grub
	echo "Getting GPU passthrough scripts ready"
	sudo cp vfio-pci-override-vga.sh /sbin/vfio-pci-override-vga.sh
	sudo chmod 755 /sbin/vfio-pci-override-vga.sh
	echo "install vfio-pci /sbin/vfio-pci-override-vga.sh" | sudo tee /etc/modprobe.d/local.conf
	sudo cp local.conf /etc/dracut.conf.d/local.conf
	echo "Updating grub and generating initramfs"
	sudo grub-mkconfig -o /boot/grub/grub.cfg
	sudo dracut -f --kver $(uname -r)
	echo -e "\e[32m Getting latest ovmf from kraxel.org\e[0m"
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
	echo -e "\e[32m Script finished\e[0m"
	;;
qemu)
	echo -e "\n${green}Install qemu...${none}\n"
	sudo xbps-install qemu
	;;
qemu-ga)
	echo -e "\n${green}Install qemu guest agent...${none}\n"
	sudo xbps-install qemu-ga
	;;
virt-manager)
	echo -e "\n${green}Install virt-manager...${none}\n"
	sudo xbps-install virt-manager libvirt
	sudo ln -sv /etc/sv/libvirtd /var/service
	;;
vbox)
	echo -e "\n${green}Install virtualbox...${none}\n"
	sudo xbps-install virtualbox-ose
	;;
vbox-guest)
	echo -e "\n${green}Install virtualbox guest utilities...${none}\n"
	sudo xbps-install virtualbox-ose-guest
	;;
	esac
done

backup=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --separate-output --checklist "17 - Choose backup:" 0 0 0)
options=(
	borg "borg" off \
	dejadup "dejadup" off \
	timeshift "timeshift" off)
selections=$("${backup[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
 case $selection in
borg)
	echo -e "\n${green}Install borg...${none}\n"
	sudo xbps-install borg
	;;
dejadup)
	echo -e "\n${green}Install dejadup...${none}\n"
	sudo xbps-install dejadup
	;;
timeshift)
	echo -e "\n${green}Install timeshift...${none}\n"
	sudo xbps-install timeshift
	;;
 esac
done

misc=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --separate-output --checklist "18 - Miscellaneous options:" 0 0 0)
options=(
	fonts "liberation, dejavu, ubuntu and roboto fonts" off \
	alsa-utils "Advanced Linux Sound Architecture" off \
	blueman "GTK+ Bluetooth Manager" off \
	bluez "Bluetooth tools and daemons" off \
	cronie "Runs specified programs at scheduled times" off \
	cups "Common Unix Printing System" off \
	cupsgui "CUPS printer configuration tool and status applet" off \
	gimp "GNU image manipulation program" off \
	inkscape "Vector-based drawing program" off \
	libreoffice "Productivity suite" off \
	nfs-utils "Network File System utilities" off \
	pulseaudio "Featureful, general-purpose sound server" off \
	tlp "Advanced power management tool for Linux" off \
	xkeylang "Choose X keyboard language" off \
	service "Enable required services" off \
	startdm "Start installed display manager" off)
selections=$("${misc[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
	case $selection in
xkeylang)
	echo -e "\n${green}Change X keyboard language...${none}\n"
	printf "Possible (type in number)or Enter for English: \n
	- 1 Czech
	- 2 Deutsch
	- 3 French
	- 4 Russian
	- 5 Spanish\n"
	echo -n "$green"
	read -p "Which keyboard layout do you want? " xlanguage
	echo -n "$none"
	case $xlanguage in
	1 )
		if [ ! -d /etc/X11/xorg.conf.d ]; then
			sudo mkdir -p /etc/X11/xorg.conf.d
		fi
		sed "s/"cs"/"cz"/" conf.keyboard > 00-keyboard.conf
		sudo cp -r 00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
		sudo cp -r conf.touchpad /etc/X11/xorg.conf.d/20-touchpad.conf
		echo -e "\n${green}Done${none}\n"
		;;

	2 )
		if [ ! -d /etc/X11/xorg.conf.d ]; then
			sudo mkdir -p /etc/X11/xorg.conf.d
		fi
		sed "s/"cs"/"de"/" conf.keyboard > 00-keyboard.conf
		sudo cp -r 00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
		sudo cp -r conf.touchpad /etc/X11/xorg.conf.d/20-touchpad.conf
		echo -e "\n${green}Done${none}\n"
		;;

	3 )
		if [ ! -d /etc/X11/xorg.conf.d ]; then
			sudo mkdir -p /etc/X11/xorg.conf.d
		fi
		sed "s/"cs"/"fr"/" conf.keyboard > 00-keyboard.conf
		sudo cp -r 00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
		sudo cp -r conf.touchpad /etc/X11/xorg.conf.d/20-touchpad.conf
		echo -e "\n${green}Done${none}\n"
		;;

	4 )
		if [ ! -d /etc/X11/xorg.conf.d ]; then
			sudo mkdir -p /etc/X11/xorg.conf.d
		fi
		sed "s/"cs"/"ru"/" conf.keyboard > 00-keyboard.conf
		sudo cp -r 00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
		sudo cp -r conf.touchpad /etc/X11/xorg.conf.d/20-touchpad.conf
		echo -e "\n${green}Done${none}\n"
		;;


	5 )
		if [ ! -d /etc/X11/xorg.conf.d ]; then
			sudo mkdir -p /etc/X11/xorg.conf.d
		fi
		sed "s/"cs"/"es"/" conf.keyboard > 00-keyboard.conf
		sudo cp -r 00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
		sudo cp -r conf.touchpad /etc/X11/xorg.conf.d/20-touchpad.conf
		echo -e "\n${green}Done${none}\n"
		;;


	* )
		if [ ! -d /etc/X11/xorg.conf.d ]; then
			sudo mkdir -p /etc/X11/xorg.conf.d
		fi
		sed "s/"cs"/"us"/" conf.keyboard > 00-keyboard.conf
		sudo cp -r 00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
		sudo cp -r conf.touchpad /etc/X11/xorg.conf.d/20-touchpad.conf
		echo -e "\n${green}Done${none}\n"
		;;
		esac
	;;
fonts)
	echo -e "\n${green}Install some fonts...${none}\n"
	sudo xbps-install liberation-fonts-ttf dejavu-fonts-ttf ttf-ubuntu-font-family fonts-roboto-ttf
	;;
libreoffice)
	echo -e "\n${green}Install libreoffice...${none}\n"
	sudo xbps-install libreoffice-writer libreoffice-calc libreoffice-impress libreoffice-draw libreoffice-math libreoffice-base libreoffice-gnome
	;;
gimp)
	echo -e "\n${green}Install gimp...${none}\n"
	sudo xbps-install gimp
	;;
inkscape)
	echo -e "\n${green}Install inkscape...${none}\n"
	sudo xbps-install inkscape
	;;
alsa-utils)
	echo -e "\n${green}Install alsa-utils...${none}\n"
	sudo xbps-install alsa-utils
	;;
pulseaudio)
	echo -e "\n${green}Install pulseaudio...${none}\n"
	sudo xbps-install pulseaudio pulseaudio-utils pulsemixer alsa-plugins-pulseaudio pavucontrol
	;;
bluez)
	echo -e "\n${green}Install bluez...${none}\n"
	sudo xbps-install bluez
	if [ -L /var/service/bluetoothd ]; then
		echo -e "\n${green}Service bluetoothd already exist. Continue.${none}\n"
	else
		sudo ln -sv /etc/sv/bluetoothd /var/service
	fi
	;;
blueman)
	echo -e "\n${green}Install blueman...${none}\n"
	sudo xbps-install blueman
	;;
cups)
	echo -e "\n${green}Install cups...${none}\n"
	sudo xbps-install cups cups-pk-helper cups-filters foomatic-db foomatic-db-engine
	if [ -L /var/service/cupsd ]; then
		echo -e "\n${green}Service cupsd already exist. Continue.${none}\n"
	else
		sudo ln -sv /etc/sv/cupsd /var/service
	fi
	;;
cupsgui)
	echo -e "\n${green}Install system-config-printer...${none}\n"
	sudo xbps-install system-config-printer
	;;
tlp)
	echo -e "\n${green}Install tlp...${none}\n"
	sudo xbps-install tlp tlp-rdw powertop
	if [ -L /var/service/tlp ]; then
		echo -e "\n${green}Service tlp already exist. Continue.${none}\n"
	else
		sudo ln -sv /etc/sv/tlp /var/service
	fi
	;;
nfs-utils)
	echo -e "\n${green}Install nfs-utils...${none}\n"
	sudo xbps-install nfs-utils sv-netmount
	sudo ln -s /etc/sv/statd /var/service/
	sudo ln -s /etc/sv/rcpbind /var/service/
	sudo ln -s /etc/sv/netmount /var/service/
	;;
service)
	echo -e "\n${green}Enable required services...${none}\n"
	sudo xbps-install -y dbus
	if [ -L /var/service/dbus ]; then
		echo -e "\n${green}Service dbus already exist. Continue.${none}\n"
	else
		sudo ln -s /etc/sv/dbus /var/service
	fi
	echo -e "\n${green}Enable elogind...${none}\n"
	sudo xbps-install -y elogind
	if [ -L /var/service/elogind ]; then
		echo -e "\n${green}Service elogind already exist. Continue.${none}\n"
	else
		sudo ln -s /etc/sv/elogind /var/service
	fi
	echo -e "\n${green}Enable Polkit...${none}\n"
	if [ -L /var/service/polkitd ]; then
		echo -e "\n${green}Service polkitd already exist. Continue.${none}\n"
	else
		sudo ln -s /etc/sv/polkitd /var/service
	fi
	;;
cronie)
	echo -e "\n${green}Install cronie...${none}\n"
	sudo xbps-install cronie
	if [ -L /var/service/cronie ]; then
		echo -e "\n${green}Service cronie already exist. Continue.${none}\n"
	else
		sudo ln -sv /etc/sv/cronie /var/service
		echo -e "\n${green}Done${none}\n"
	fi
	;;
startdm)
	echo -e "\n${green}Start installed display manager now...${none}\n"
	if [ -f /usr/bin/lightdm ]; then
		sudo ln -sv /etc/sv/lightdm /var/service
	elif [ -f /usr/bin/sddm ]; then
		sudo ln -sv /etc/sv/sddm /var/service
	elif [ -f /usr/bin/gdm ]; then
		sudo ln -sv /etc/sv/gdm /var/service
	elif [ -f /usr/bin/slim ]; then
		sudo ln -sv /etc/sv/slim /var/service
	elif [ -f /usr/bin/emptty ]; then
		sudo ln -sv /etc/sv/emptty /var/service
	fi
	;;
	esac
done

install=(dialog --backtitle 'universal void installer by oSoWoSo' --title uvi --no-shadow --separate-output --checklist "19 - Install:" 0 0 0)
options=(
	ask "Ask part again" off \
	install "Install" off \
	exit "Quit $progname" off)
selections=$("${install[@]}" "${options[@]}" 2>&1 >/dev/tty)
for selection in $selections
do
case $selection in
ask)
	echo 'ask' > begin.tmp
	;;
install)
	echo 'install' > begin.tmp
	;;
exit)
	exit
	;;
	esac
done
