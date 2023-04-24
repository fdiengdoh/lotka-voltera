#!/usr/local/bin/gnuplot -persist

set terminal svg enhanced font 'Arial,11'
set output "rk.svg"
set title "[X]/[Y] vs Time Plot"
set xlabel "Time (t)"
set ylabel "[X]/[Y]"
set yrange [0:450]
plot "rk.dat" u (column(0)):2 w l lw 3 lc rgb '#9400d4' title "[X]","rk.dat" u (column(0)):3 w l lw 3 lc rgb '#0060ad' title "[Y]"


set terminal svg enhanced font 'Arial,11'
set title "[X] vs [Y] Plot"
set xlabel "[X]"
set ylabel "[Y]"
set output "rk2.svg"
plot "rk.dat" using 2:3 w l lw 3 lc rgb '#0060ad' title ""