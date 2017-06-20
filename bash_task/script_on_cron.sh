#!/bin/bash

# checking if everything is up-to-date
if git pull | grep 'up-to-date'
then
	echo "everything is up-to-date"
else
	# if no, then run test which run script to build everything and test
	echo "run test!"
	if ./script_to_test.sh 
	then
		# test pass
		echo "OK!"
	else
		# test fail
		cd ../	# need to run git bisect from top level of repo
		git bisect start HEAD HEAD~5
		git bisect run ./bash_task/script_to_test.sh | grep 'Author' | awk '{print $4}' | sed 's/[<>]//g'
	fi
fi
