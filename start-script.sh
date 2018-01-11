#!/bin/bash

#gnome-screenshot -f ./temp.png
#convert ./temp.png -crop 600x450+2700+150 ./output.png

#Generate text from question
tesseract output.png output

tr '\n' ' ' < output.txt > question.txt


value=$(<question.txt)

temp_query=`echo $value | cut -f1 -d"?"`

echo $temp_query

query=`echo ${temp_query// /+}`

#Search on Google
firefox google.com/search?q=$query
