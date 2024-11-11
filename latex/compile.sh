#/bin/bash

make clean
yes "" | make
cp "thesis.pdf" "../thesis.pdf"
firefox "./thesis.pdf" &
