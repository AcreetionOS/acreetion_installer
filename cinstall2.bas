$ScreenHide
$Console
_Dest _Console

Rem create fstab file!



Rem ask for name and create the user name and dictories now.

Cls

Shell "sed -i 's/#en_US.UTF-8/en_US.UTF-8/g' /etc/locale.gen"
Shell "locale-gen"
Rem Shell "genfstab -U >> /etc/fstab"

Open "i", #1, "/temp.txt"
Line Input #1, dv$
Close #1

over1:

Print
Print

Print "Create your user account!"

Print


Do While name$ = ""
    Line Input "Your name please? ", name$
Loop

fullname$ = LCase$(name$)

xx = InStr(fullname$, " ")

name$ = Mid$(fullname$, 1, xx - 1)

loop9:

Rem GoTo jump2

pass$ = "123"
p2$ = "fcku"

Print
Do While pass$ <> p2$

    Line Input "Password: ", pass$

    Line Input "Verify Password: ", p2$

Loop

jump2:

Print
Print "Use " + name$ + " as your username?  (Y/n): "

Line Input aa$

If aa$ = "n" Or aa$ = "N" Then

    Print
    Line Input "Username: ", name$
    If name$ = "" Then
        Print "Cant be blank, sorry!"
        GoTo over1:
    End If
End If

Print
Print "Creating User Account: "; name$

Rem Shell "useradd -m " + name$
Rem Shell "passwd " + name$

Shell "useradd " + name$ + " -b /home/" + name$ + " -p " + pass$ + " -G wheel"

Rem creating user accounts!

Rem Shell "mkdir /home/" + name$
xx$ = "mkdir /home/" + name$
Shell xx$
bb$ = xx$

xx$ = bb$ + "/Documents"
Shell xx$
Print xx$

xx$ = bb$ + "/Templates"
Shell xx$
Print xx$

xx$ = bb$ + "/Downloads"
Shell xx$
Print xx$

xx$ = bb$ + "/Videos"
Shell xx$
Print xx$

xx$ = bb$ + "/Pictures"
Shell xx$
Print xx$
xx$ = bb$ + "/Public"
Shell xx$
Print xx$

xx$ = bb$ + "/Desktop"
Shell xx$
Print xx$

Print
Print "Adding user to system now, including wheel group for SUDO powers."
Print



Rem setup fonts and stuff.

Shell "sed 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8'"
Shell "sed 's/#en_US ISO-8859-1/en_US ISO-8859-1'"
Shell "locale-gen"
Shell "echo 'LANG=en_US.UTF-8' > /etc/locale.conf"
Shell "echo 'LANG=en_US ISO-8859-1' >> /etc/locale.conf"
Shell "echo 'LANG=en_US ISO-8859-1' >> /etc/locale.conf"

Rem set host name

aa$ = ""

Do While aa$ = ""

    Print
    Line Input "Host name: ", aa$

Loop

Shell "echo " + aa$ + " > /etc/hostname"

Rem set up system boot!

xx$ = "mount /dev/" + dv$ + "1 /boot"
Shell xx$
Print "mounting: "; xx$

Shell "pacman -S base-devel nano dhcpcd abiword adobe-source-code-pro-fonts adobe-source-sans-fonts adobe-source-serif-fonts alsa-firmware alsa-plugins alsa-utils amd-ucode android-tools android-udev appstream appstream-glib appstream-qt appstream-qt5 arc-gtk-theme arc-icon-theme arc-solid-gtk-theme arch-install-scripts archinstall arch-audit archiso archivetools archlinux-appstream-data archlinux-contrib archlinux-keyring archlinux-wallpaper ardour aria2 aspell audacity axel b43-fwcutter base base-devel bash bash-completion bcachefs-tools bind bison bitwarden blender blueberry bluefish bluez bluez-utils bolt breeze-gtk breeze-icons brltty broadcom-wl #broadwell-wl-dkms btrfs-progs calamares calibre cantarell-fonts cheese chromium cinnamon cinnamon-control-center cinnamon-desktop cinnamon-menus cinnamon-screensaver cinnamon-session cinnamon-settings-daemon cinnamon-translations ckbcomp clamav clamtk clonezilla cloud-init coreutils cpio cryptsetup #cuda #cuda-tools cups cups-browsed cups-filters cups-pdf cups-pk-helper curl curl-rustls darkhttpd darktable dart dbus dbus-docs dbus-glib dbxtool dconf dconf-editor ddgr ddrescue deja-dup deluge-gtk desktop-file-utils device-mapper dhclient dhcpcd dialog diffutils directx-headers discord distrobox dmidecode dmraid dnsmasq docker docker-buildx docker-compose docker-machine docker-scan downgrade dosfstools dracut duf e2fsprogs exfatprogs edk2-shell efibootmgr efitools element-desktop emacs-wayland endeavouros-mirrorlist endeavouros-keyring epiphany espeakup ethtool exfatprogs f2fs-tools fakeroot fastfetch fatresize ffmpeg ffmpegthumbs firewalld freetype2 nemo-terminal file-roller filezilla flatpak flatpak-builder flatpak-docs flatpak-xdg-utils font-manager foot-terminfo fsarchiver fuse2 fuse3 fwupd fwupd-docs fwupd-efi gamemode gcc gcc-libs gdm gedit gedit-plugins gimp gimp-nufraw gimp-plugin-gmic git glances gnome-keyring gnome-screenshot gnome-shell gnu-netcat gpart gparted gpm gptfdisk grml-zsh-config grub grsync gsfonts gst-libav gst-plugin-pipewire gst-plugins-bad gst-plugins-ugly gtk3 gtk4 gtkspell guake guvcview handbrake haveged hdparm hwdata hwdetect hwinfo hyperv ifuse img2pdf inetutils intel-compute-runtime intel-gmmlib intel-graphics-compiler intel-graphics-compiler intel-media-driver intel-ucode intel-undervolt inxi iptables-nft irssi iw iwd jdk17-openjdk jfsutils jre-openjdk jre21-openjdk kitty kitty-terminfo kodi ldns leafpad less lftp libadwaita libadwaita-docs libdvdcss libfido2 libgsf libopenraw libsmbios libusb-compat libva-intel-driver libva-mesa-driver libva-utils libva-vdpau-driver libvirt libvirt-glib linux-atm linux-firmware linux-firmware-marvell linux-zen-docs livecd-sounds llvm logrotate lsb-release lsscsi lvm2 lynx lz4 man-db man-pages metacity mc mdadm meld memtest86+ memtest86+-efi mesa mesa-utils mesa-vdpau meson mkinitcpio mkinitcpio-archiso mkinitcpio-nfs-utils mlocate modemmanager mtools nano nano-syntax-highlighting nemo-emblems nemo-fileroller nemo-pastebin nemo-preview nemo-python nemo-qml-plugin-configuration nemo-qml-plugin-notifications nemo-seahorse nemo-share networkmanager networkmanager-openconnect networkmanager-openvpn nextcloud nextcloud-app-bookmarks nextcloud-app-calendar nextcloud-app-contacts nextcloud-app-deck nextcloud-app-mail nextcloud-app-news nextcloud-app-notes nextcloud-app-notify_push nextcloud-app-spreed nextcloud-app-tasks nextcloud-client nbd ndisc6 net-tools netctl nfs-utils nftables nilfs-utils nmap noto-fonts noto-fonts-emoji noto-fonts-extra npm nss-mdns ntfs-3g ntp nvidia nvidia-inst nvidia-utils nvme-cli open-iscsi open-vm-tools openconnect openh264 openpgp-card-tools openimagedenoise openssh openssl openvpn os-prober pacman-contrib partclone parted partimage partitionmanager pavucontrol pcsclite pdfgrep perl nemo-image-converter persepolis pipewire pipewire-alsa pipewire-audio pipewire-docs pipewire-ffado pipewire-jack pipewire-pulse pipewire-roc pipewire-session-manager pipewire-v4l2 pipewire-x11-bell pipewire-zeroconf pkgfile podman polkit-gnome poppler-glib power-profiles-daemon ppp pptpclient psensor python-capng python-packaging python-pyqt5 pv qemu-guest-agent rate-mirrors rebuild-detector reflector reflector-simple reiserfsprogs rp-pppoe rsync rnnoise rtkit rxvt-unicode-terminfo screen screengrab sdparm sequoia-sq sg3_utils smartmontools s-nail sof-firmware spice-vdagent squashfs-tools stress-ng sudo sysfsutils syslinux system-config-printer systemd-resolvconf systemd-sysvcompat tcpdump terminus-font testdisk texinfo thermald thunderbird thunderbird-ublock-origin tldr touchegg tmux tpm2-tools tpm2-tss ttf-bitstream-vera ttf-dejavu ttf-liberation ttf-opensans udftools ukui-wallpapers unrar unzip usb_modeswitch usbmuxd usbutils vi vim vkd3d virtualbox-guest-utils vpnc vulkan-intel vulkan-mesa-layers vulkan-radeon vulkan-swrast vulkan-virtio warpinator webrtc-audio-processing welcome which wireless-regdb wireless_tools wireplumber wpa_supplicant wvdial x265 x42-plugins xdg-user-dirs xdg-utils xed xf86-input-libinput xf86-video-amdgpu xf86-video-ati xf86-video-intel xf86-video-qxl xf86-input-vmmouse xf86-video-vmware xfsprogs xl2tpd xorg-server xorg-xdpyinfo xorg-xinit xorg-xinput xorg-xkill xorg-xrandr xorg-xwayland xz yay zsh --noconfirm"

Rem xx$ = "parted /dev/" + dv$ + "1 set 1 boot on set 1 esp on n"

Rem Shell xx$
Rem Print "parted: "; xx$

Shell "pacman -S grub efibootmgr dosfstools os-prober mtools --noconfirm"
Shell "mkinitcpio -P"

Shell "mkdir /boot/EFI"
Shell "mount /dev/" + dv$ + "1 /boot/"
Shell "grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck"
Shell "cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo"

Shell "grub-mkconfig -o /boot/grub/grub.cfg"

Print
Rem Print "Installing Main package now!"


Rem  Shell "mkinitcpio -p linux"
Rem Shell "bootctl install"
ChDir "/etc/systemd/system/"
Shell "systemctl enable NetworkManager"

ChDir "/"

Rem Shell "mkinitcpio -P"

Rem Shell "cp /extraboot/* /boot/loader/entries/"

Rem setup systemd boot entry!

Rem Shell "blkid > /tem.txt | grep -i " + dv$ + "2"


Open "i", #1, "/tem.txt"
Line Input #1, dd$
Close #1
Shell "rm /tem.txt"

Rem pull out Partuuid number for root drive

ii = InStr(dd$, "PARTUUID=")

dd$ = Mid$(dd$, ii + 1, Len(dd$) - 1)


Open "o", #1, "/boot/loader/entries/linux-zen.conf"

Print #1, "## Acreetion OS boot"
Print #1, "Title     Acreetion OS"
Print #1, "linux     /vmlinuz-linux"
Print #1, "initrd    /initramfs-linux.img"
Print #1, "initrd    /amd-ucode.img"
Print #1, "Options   root=/dev/" + dv$ + "2 zswap.enabled=0 rw rootfstype=ext4 enable_psr=0"

Close #1


Rem exit system

System

