$ScreenHide
$Console
_Dest _Console

Rem create fstab file!



Rem ask for name and create the user name and dictories now.

Cls

Shell "sed -i 's/#en_US.UTF-8/en_US.UTF-8/g' /etc/locale.gen"
Shell "locale-gen"
Shell "genfstab -U >> /etc/fstab"

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
Rem Shell xx$
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

Rem xx$ = "mount /dev/" + dv$ + "1 /boot"
Rem Shell xx$
Rem Print "mounting: "; xx$


Rem xx$ = "parted /dev/" + dv$ + "1 set 1 boot on set 1 esp on n"

Shell xx$
Rem Print "parted: "; xx$

Shell "pacman -S grub efibootmgr dosfstools os-prober mtools --noconfirm"
Rem Shell "mkinitcpio -P"

Rem Shell "mkdir /boot/EFI"
Rem Shell "mount /dev/" + dv$ + "1 /boot/"
Rem Shell "grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck"
Rem Shell "cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo"

Rem Shell "grub-mkconfig -o /boot/grub/grub.cfg"

Shell "mkinitcpio -P"
Shell "bootctl install"

Rem Shell "mkinitcpio -P"

Rem Shell "cp /extraboot/* /boot/loader/entries/"

Rem setup systemd boot entry!

Shell "blkid > /tem.txt | grep -i " + dv$ + "2"


Open "i", #1, "/tem.txt"
Line Input #1, dd$
Close #1
Shell "rm /tem.txt"

Rem pull out Partuuid number for root drive

ii = InStr(dd$, "PARTUUID=")

dd$ = Mid$(dd$, ii, Len(dd$))


Open "o", #1, "/boot/loader/entries/linux-zen.conf"

Print #1, "## Acreetion OS boot"
Print #1, "Title     Acreetion OS"
Print #1, "linux     /vmlinuz-linux-zen"
Print #1, "initrd    /initramfs-linux-zen.img"
Print #1, "initrd    /amd-ucode.img"
Print #1, "Options   root=" + dd$ + " zswap.enabled=0 rw rootfstype=ext4 enable_psr=0"

Close #1


Rem exit system

System

