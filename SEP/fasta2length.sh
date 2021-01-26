#!/bin/bash
#

if [ $# -eq 0 ]; then
  echo "Usage: fasta2length <inputfile>"
  echo ""
  echo "... prints the sequence length for the FASTA-formatted input file."
  exit
fi

infile=$1

sed -e "s/^>.*//" $infile | tr -d "\n" | wc -c
