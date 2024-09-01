$ScreenHide
$Console
_Dest _Console

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


