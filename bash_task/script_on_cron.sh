#!/bin/bash

# checking if everything is up-to-date
if git pull | grep 'up-to-date'
then
	echo "everything is good"
else
	# if no, then run test
	echo "run test!"
fi
