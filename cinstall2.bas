$ScreenHide
$Console
_Dest _Console

Rem ask for name and create the user name and dictories now.

Cls

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

pass$ = "123"
p2$ = "fcku"

Print
Do While pass$ <> p2$

    Line Input "Password: ", pass$

    Line Input "Verify Password: ", p2$

Loop

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

Rem creating user accounts!

Shell "mkdir /home/" + name$
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

Shell "useradd " + name$ + " -b /home/" + name$ + " -p " + pass$ + " -G wheel"

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


xx$ = "parted /dev/" + dv$ + " set 1 boot on"

Shell xx$
Print "parted: "; xx$

Shell "bootctl install"
Shell "mkinitcpio -P"

Open "o", #1, "/boot/loader/entries/linux-zen.conf"

Print #1, "## Acreetion OS boot"
Print #1, "Title     Acreetion OS"
Print #1, "linux     /vmlinuz-linux-zen"
Print #1, "initrd    /initramfs-linux-zen.img"
Print #1, "Options root=/dev/" + dv$ + "2 rw"
Print #1, "EOF"

Close #1

Rem exit system

System

