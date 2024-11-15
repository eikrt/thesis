set terminal svg size 512,512 enhanced font 'Arial,12'
set output 'cost_graph.svg'

# Set labels for the axes
set xlabel "Time (person-hours)"
set ylabel "Cost benefit tradeoff"

# Set axis ranges
set xrange [0:*]  # Automatically adjust based on data size
set yrange [-0.4:0.6]  # Adjust to fit data range

# Line styles
set style line 1 lc rgb "blue" lw 2  # Smooth line for costdata_open
set style line 2 lc rgb "red" lw 2   # Smooth line for costdata_closed
set style line 3 lc rgb "black" lw 1 dashtype 2  # Dashed line for x-axis

# Plot the two files and the x-axis
plot 0 with lines linestyle 3 notitle, \
     'costdata_open.csv' using 0:1 smooth cspline with lines linestyle 1 title "Benefit minus cost (open)", \
     'costdata_closed.csv' using 0:1 smooth cspline with lines linestyle 2 title "Benefit minus cost (closed)"