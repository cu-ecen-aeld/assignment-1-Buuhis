#!/bin/bash

# writefile is a full path to a file on the filesystem, writestr is a text string which will be written within this file 
writefile=$1;
writestr=$2;

#check 2 input arg:
if [ $# -ne 2 ]; then
		  echo "Error: Missing arguments. please provide both file path and a text string.";
		  exit 1;
fi

#create a new directory and write the string to file, overwrite if it exists
mkdir -p "$(dirname "$writefile")";

echo "$writestr" > "$writefile";

#check if the files was created 
if [ $? -ne 0 ]; then
		  echo "Error: Could not create file $writefile";
		  exit 1;
fi

echo "File has been created and content written.";
exit 0;
