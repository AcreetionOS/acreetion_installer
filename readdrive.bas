Rem read the drive info into memory
Dim info$(1000)
Shell "lsblk > temp.txt"
count = 0

Open "temp.txt" For Input As #1

Do While Not EOF(1)

    count = count + 1
    Input #1, A$
    info$(count) = A$
    Print ".";

Loop


Close #1



Shell "rm temp.txt"

Print Chr$(12);

Print "Drive Info Fucker!"
Print
Print

For x = 1 To count

    Print info$(x)

Next x

Line Input "Press enter, i am finished: ", A$



System
