#!/bin/bash
#

if [ $# -eq 0 ]; then
  echo "Usage: fasta2oneline <inputfile>"
  echo ""
  echo "... writes the FASTA-formatted <inputfile> to output"
  echo "    OL<inputfile>, with the sequence on one line."
  exit
fi

infile=$1
outfile=OL$infile

cat <(head -1 $infile) <(tail -n +2 $infile   | \
  tr -d "\n") | sed '$a\' > $outfile
