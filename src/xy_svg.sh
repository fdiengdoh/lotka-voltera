#!/usr/local/bin/gnuplot -persist

set terminal svg enhanced font 'Arial,11'
set output "rk.svg"
set title "[X]/[Y] vs Time Plot"
set xlabel "Time (t)"
set ylabel "[X]/[Y]"
set yrange [0:450]
plot "lv-res.dat" u (column(0)):2 w l lw 3 title "[X]","lv-res.dat" u (column(0)):3 w l lw 3 title "[Y]"


set terminal svg enhanced font 'Arial,11'
set title "[X] vs [Y] Plot"
set xlabel "[X]"
set ylabel "[Y]"
set output "rk2.svg"
plot "lv-res.dat" using 2:3 w l lw 3 title ""
