#!/bin/bash

# just for show that script does work ;)
echo "Just initial script";

# cleaning content of file.txt
echo -n > file.txt;

# writing to file.txt from 1 to 10 in new line
for i in {2..10}
do
	echo $i >> file.txt;
done
