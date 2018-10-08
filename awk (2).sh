#!/bin/bash

if [ $# -ne 1 ]
then
  echo "Please specify example #"
  exit
fi

alo=$1

case $alo in 
1)
#Number of words:
awk '{ total = total + NF }; END {print total}' Ray.txt
;;

2)
#  Number of lines:
awk '{print  FNR }' Ray.txt 


;; 3)
#  Max words in the line:
awk '{ max = NF > max ? NF : max } END { print max }' Ray.txt


;; 4)
#  Max line length: 

awk '{ if (length($0) > max) {max = length($0)} } END { print max }' Ray.txt


 
;;
 *) echo "Invalid task number" ; exit ;;
esac


