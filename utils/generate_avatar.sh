#!/bin/bash


# method one -
convert -antialias -background darkred -fill white -family "Menlo" -pointsize 200 label:"\n ML \n" -trim -resize 144x144 -gravity center -extent 200x200 output.png

# method two - text has almost full width
convert -antialias -size 960x960 -background red -fill white -family OpenSans -gravity center caption:"ML" -density 144 -resample 72 -resize 200x200 ml.png
