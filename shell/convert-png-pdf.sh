#!/bin/bash
IMGDIR="./img"
for f in $IMGDIR/*.png; do 
  convert $f ${f%.*}.pdf
done