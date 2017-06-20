#!/bin/bash

# checking if everything is up-to-date
if git pull | grep 'up-to-date'
then
	echo "everything is up-to-date"
else
	# if no, then run script to build everything
	./script_on_server.sh

	# then run test
	echo "run test!"
	if ./script_to_test.sh 
	then
		# test pass
		echo "OK!"
	else
		# test fail
		cd ../	# need to run git bisect from top level of repo
		git bisect start HEAD HEAD~10
		git bisect run ./script_to_test.sh | grep 'email'
	fi
fi
