#!/bin/bash

# run script to build file.txt
/home/gajdzprz/git_repo/hello-word/bash_task/script_on_server.sh

# compare result with script_on_server.sh
i="1"
for line in $(cat /home/gajdzprz/git_repo/hello-word/bash_task/file.txt)
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
