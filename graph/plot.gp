set terminal svg size 512,512 enhanced font 'Arial,12'
set output 'barchart.svg'

# Set labels for the axes
set xlabel "Time (person-hours)"
set ylabel "Probability"

# Set the x-axis range to match the number of data points
set xrange [0.5:7]  # Add a buffer on both ends for visibility
set yrange [0.0:0.6]

# Set bar width and style
set boxwidth 0.8 relative
set style fill solid 0.5 border -1
set nokey 

# Change default line style to blue
set style line 1 lc rgb "#0F52BA"

# Plot as a bar chart using boxes
plot 'data.csv' using ($0+1):1 with boxes linestyle 1