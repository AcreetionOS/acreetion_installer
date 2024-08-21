
For t = 1 To 255
    bb = bb + 1

    Print t; " = "; "/"; Chr$(t); "/ "

    If bb = 1 Then
        bb = 0
        Line Input "Press Enter: ", aa$
    End If

Next t

