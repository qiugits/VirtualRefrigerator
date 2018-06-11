#!/bin/bash
for f in food_kinds_original/*.jpg; do
  #echo "${f}"
  #echo $(echo "${f}" | sed "s/food_kinds_original/food_kinds/g")
  newf=$(echo "${f}" | sed "s/food_kinds_original/food_kinds/g")
  convert "${f}" -gravity center -background white -resize 140 -extent 140x140 "${newf}"
  echo -n '.'
done
