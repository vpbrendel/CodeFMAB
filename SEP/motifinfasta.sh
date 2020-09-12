#!/bin/bash
#

if [ $# -ne 2 ]; then
  echo "Usage: motifinfasta <inputfile> <pattern>"
  echo ""
  echo "... tells us how often the motif <pattern> occurs"
  echo "    in the FASTA-formatted file <inputfile>."
  exit
fi

infile=$1
pattern=$2

echo $infile
echo ${pattern}

sed -e "s/>.*//" $infile | tr -d "\n"  | \
sed -e "s/${pattern}/${pattern}X/g"   | \
tr "X" "\n" | egrep -c "${pattern}$"
