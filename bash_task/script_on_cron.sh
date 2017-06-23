#!/bin/bash

# changing directory for git pull
cd /home/gajdzprz/git_repo/hello-word/bash_task/

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
		new_good_commit=`git log -1`
		echo $new_good_commit | sed -e 's/.*commit \(.*\) Author.*/\1/' > last_good_commit.txt
	else
		# test fail
		cd ../	# need to run git bisect from top level of repo
		good_commit=`cat bash_task/last_good_commit.txt`
		git bisect start HEAD $good_commit
		bad_commit=`git bisect run ./bash_task/script_to_test.sh`
		git bisect reset
		mail=`echo $bad_commit | sed -e 's/.*<\(.*\)>.*/\1/'`
		bad_commit=`echo $bad_commit | sed -e 's/.*commit\(.*\)Author.*/\1/'`
		echo $bad_commit | mail -s "Your commit broke the project" $mail
	fi
fi
