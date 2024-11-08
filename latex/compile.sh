#/bin/bash

make clean
yes "" | make
firefox "./thesis.pdf" &
