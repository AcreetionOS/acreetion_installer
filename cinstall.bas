Rem $ScreenHide
Rem $Console
Rem _Dest _Console

Cls


Rem Declear Variables.


Dim drv$(500), drive$(100), zone$(1000), timezone$(25), dr$(25), part$(25)

Cls

Print "Welcome to Acreetion OS!"
Print
Print "Written By: Darren W. Clift"
Print
Print "Copyright (c) 2024"
Print

Rem gather user info

Do While name$ = ""
    Line Input "Your name please? ", name$
Loop

fullname$ = LCase$(name$)

xx = InStr(fullname$, " ")

name$ = Mid$(fullname$, 1, xx)

loop9:

pass$ = "123"
p2$ = "fcku"

Print
Do While pass$ <> p2$

    Line Input "Password: ", pass$

    Line Input "Verify Password: ", p2$

Loop


er1:

Rem gather partitios and drive info and break it up in to its variables

Shell "lsblk -Sr > temp.txt"

Open "i", #1, "temp.txt"

Line Input #1, whatever$


tt = 0

While Not EOF(1)

    tt = tt + 1
    Line Input #1, dr$(tt)

Wend

Close #1

Rem break up into variables

For lp2 = 1 To tt

    drv$(lp2) = Mid$(dr$(lp2), 1, 3)

Next lp2

Shell "lsblk -Nr > temp.txt"

Open "i", #1, "temp.txt"

Line Input #1, whatever$


tt = 0

While Not EOF(1)

    tt = tt + 1
    Line Input #1, dr$(tt)

Wend

Close #1

lp2 = lp2 - 1


For t = 1 To tt

    drv$(t + lp2) = Left$(dr$(t), 7)

Next t

total = lp2 + t - 1

Shell "rm temp.txt"

loop99:

Cls

Print "Choose Drive to install Acreetion OS on"
Print "**WARNING**: All Data On drive will be destroyed!"
Print "Including windows!!!!"
Print
Print

For xx = 1 To total

    Print Str$(xx) + "- " + drv$(xx)

Next xx

Print

Do While se < 1 Or se > total

    Line Input "Which Drive: ", aa$
    se = Val(aa$)

Loop

dv$ = drv$(se)
 
Print
Do While ii$ = ""
    Line Input "Type Full Yes or No!   Are you 100 percent Sure? (Yes/No): ", ii$
Loop

ii$ = LCase$(ii$)

If ii$ = "no" Then
    ii$ = ""
    GoTo loop99
End If



Rem set up partitions.

aa$=""

Do While aa$ = ""

    Print
    Line Input "Do you want your home director in root? (Yes/No): ", aa$

Loop

aa$ = LCase$(aa$)

if aa$="y" or aa$="yes" Then
    homepart$="y"
    path$="parted -s /dev/"+dv$+" mklabel gpt mkpart primary 34 1000 mkpart primary 1001 100%"
else

    homepart$="n"
    path$="parted -s /dev/"+dv$+" mklabel gpt mkpart primary 34 1000 mkpart primary 1001 30% mkpart primary 30% 100%"

end if


Print

rem create partitions and wipe disk.

ptname$="AcreetionOS"

print 
print "Creating Partion now!"
shell path$
print "Done."
print
print "Formating Partion EUFI"
path$ = "mkfs.fat -F 32 /dev/"+dv$+"1"
print "Done."
print "Format Partion 2"
path$ = "mkfs.ext4 /dev/"+dv$+"2"
print "done."

if homepart$="y" Then
    print "Formating Partion Home"
    path$="mkfs.ext4 /dev/"+dv$+"3"
    shell path$
    print "Done."
end if


