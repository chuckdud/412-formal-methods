#! /usr/bin/bash

echo "-------- building verifier --------"
spin -a processRAM.pml

echo "-------- compiling verifier --------"
gcc -w -o pan pan.c

echo "-------- running verifier --------"
./pan -a

echo "-------- simulating with trail --------"
spin -p -s -r -X -v -n123 -l -g -k processRAM.pml.trail -u10000 processRAM.pml

echo "-------- cleaning up  --------"
rm pan* *.trail *.tmp
