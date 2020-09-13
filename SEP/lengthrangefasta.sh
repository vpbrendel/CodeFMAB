#!/bin/bash
#

if [ $# -eq 0 ]; then
  echo "Usage: lengthrangefasta <inputfile> <<n>>"
  echo ""
  echo "... shows the ordered list of sequence lengths in the"
  echo "    FASTA-formatted <inputfile>."
  echo "    If the optional argument <n> is given, show only"
  echo "    the top and bottom <n> lengths."
  exit
fi

infile=$1

mkdir /tmp/tmpFASTAdir
cp $infile /tmp/tmpFASTAdir
cd /tmp/tmpFASTAdir
csplit -f fasta -n 7 $infile '/>/' '{*}' > /dev/null
\rm fasta0000000

for file in fasta0*
do
  fasta2length.sh $file >> lengths
done
if [ $# -eq 2 ]; then
  sort -nr lengths | head -n $2
  echo "..."
  sort -nr lengths | tail -n $2
else
  sort -nr lengths
fi

\rm -rf /tmp/tmpFASTAdir
