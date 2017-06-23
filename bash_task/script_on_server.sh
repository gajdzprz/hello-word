#!/bin/bash

# just for show that script does work ;)
echo "Just initial script";

# cleaning content of file.txt
echo -n > /home/gajdzprz/git_repo/hello-word/bash_task/file.txt;

# writing to file.txt from 1 to 10 in new line
for i in {1..10}
do
	echo $i >> /home/gajdzprz/git_repo/hello-word/bash_task/file.txt;
done
