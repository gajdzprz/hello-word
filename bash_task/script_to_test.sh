#!/bin/bash

# compare result with script_on_server.sh
i="1"
for line in $(cat file.txt)
do
	if [ $i -eq $line ]
	then
		((i++))
		continue;
	else
		echo "something is wrong"
		exit 1
	fi
done
