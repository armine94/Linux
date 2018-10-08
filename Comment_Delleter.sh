#!/bin/bash

#in this line after the #! the path to the bash-interpreter, so if you have it installed in a different #location (where you can learn typing whereis bash) and change it on your way.

display_usage() { 
	echo " enter the file path and extension for example  .c  .m .h .H .cpp .java " 
	
	} 
#with display_usage we give users informations

display_usage1() { 
	echo "wrong file extension enter  .c , .h , .m , .H , .cpp or .java " 
	
	} 

display_usage2() { 
	echo " such a path does not exist, enter the correct path  " 
	
	} 

array=(.h .c .m .H .cpp .java)  # create an array that contains the file extensions

if [ $# -ne 2 ] 
then
if [ $# -eq 1 ]
then 
display_usage1
exit 1
else
display_usage
exit 3
fi
fi
#check the entered number of arguments is 2 if not then give the user the necessary information

cd  $1  # change the directory with the command cd
if [ $? != 0 ]
then
display_usage2
exit 4
fi
#check if the report is still the team is not equal to 0 give the user the necessary information

k=${#array[*]} # Number of items in the array

for i in ${array[*]}   #with the command for taking elements from the array
do 
if [ $2 != $i ] 
then
let k=$k-1
fi
if [ $k == 0 ]
then
display_usage1
exit 5
fi
done
#check the file extension, if not properly give information

if [ $# == 2 ]
then
find -type  f -name "*$2"
sed -re 's%.*//.*% %' -i  *$2   #searching lines  where are comments and delete it
sed -re ':a; s%(.*)/\*.*\*/%\1%; ta; /\/\*/ !b; N; ba' -i *$2 
fi




