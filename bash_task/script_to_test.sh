#!/bin/bash

# run basic script
./script_on_server.sh

# compare result of upper script
i="1"
for line in $(cat file.txt)
do
	if [ $i -eq $line ]
	then
		((i++))
		continue;
	else
		echo "something is wrong $i and $line"
		exit
	fi
done
