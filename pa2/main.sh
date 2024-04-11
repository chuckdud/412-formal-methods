#! /usr/bin/bash

echo "-------- building verifier --------"
spin -a processRAM.pml

echo "-------- compiling verifier --------"
gcc -w -o pan pan.c

echo "-------- running verifier --------"
./pan -a

if [ -e processRAM.pml.trail ]
then
    echo "-------- ERROR FOUND  --------"
    echo "-------- simulating with trail --------"
    spin -p -s -r -X -v -n123 -l -g -k processRAM.pml.trail -u10000 processRAM.pml
    rm *.trail
else
    echo "-------- no error found  --------"
fi

    

echo "-------- cleaning up  --------"
rm pan* *.tmp
