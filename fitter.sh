#!/bin/bash

GUESSFILE="data/guess"
OUTFILE='output/rb-fits'

rm $OUTFILE

while read record; do
  read -a fields <<< $record

  FILENAME="${fields[0]}"

  R1=${fields[1]}
  R2=${fields[2]}

  X1=${fields[3]}
  A1=${fields[4]}
  D1=${fields[5]}

gnuplot -e "filename='$FILENAME'; r1=$R1; r2=$R2; x1=$X1; a1=$A1; d1=$D1" fitter.gnu -p

  printf "${fields[0]}\n\nR1=$R1\nR2=$R2\n" >> $OUTFILE
  cat fit.log | tail -n 16 | head -n 8 >> $OUTFILE
  printf "%s\n" "-------------------------------------------------------------" >> $OUTFILE

done < $GUESSFILE

rm fit.log