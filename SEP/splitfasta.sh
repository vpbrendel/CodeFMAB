#!/bin/bash
#

if [ $# -eq 0 ]; then
  echo "Usage: splitfasta <inputfile>"
  echo ""
  echo "... splits the multi-FASTA <inputfile> into individual"
  echo "    files fasta0000001, fasta0000002, ..., each containing"
  echo "    one sequence each."
  exit
fi

infile=$1

csplit -f fasta -n 7 $infile '/>/' '{*}' > /dev/null
\rm fasta0000000

echo "Output:"
ls fasta0*
