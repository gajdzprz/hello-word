#!/bin/bash

# checking if everything is up-to-date
if git pull | grep 'up-to-date'
then
	echo "everything is up-to-date"
else
	# if no, then run test
	echo "run test!"
	if ./script_to_test.sh 
	then
		echo "OK!"
	else
		git bisect start HEAD HEAD~10
		git bisect run ./script_to_test.sh | grep 'email'
	fi
fi
