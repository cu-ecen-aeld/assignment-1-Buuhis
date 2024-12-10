#!/bin/bash 

# initialize 2 arguments: filesdir is a path to directory on the filesystem and searchstr is a text string which will be searched within these files
filesdir=$1;
searchstr=$2;

# check 2 input arguments:
if [ $# -ne 2 ];then
		  echo "Error: Missing arguments. please provide both directory path cand search string";
		  exit 1;
fi 

# check filesdir, is that a folder?
if [ ! -d "$filesdir" ]; then
		  echo "Error: $filesdir isn't a valid directory.";
		  exit 1;
fi 

#count the number of files and  number of lines
file_count=0;
line_count=0;

#check searchstr
for file in $(find "$filesdir" -type f); do
		  file_count=$((file_count + 1));
		  match_count=$(grep -c "$searchstr" "$file");
		  line_count=$((line_count + match_count));
done

#result
echo "The number of files are $file_count and the number of matching lines are $line_count.";
