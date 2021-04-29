#!/bin/bash
clear
echo list of choices
echo 1. Display list of files and their permissions
echo 2. Make a file executable to all
echo 3. Make a directory
echo 4. Make a 0-length file
echo 5. Write your information to a file
echo 6. Write list of tasks to a file
echo 7. Change timestamp of file
echo "Type 1-7 or anything else to end:"
read answer
echo You entered $answer
if [ $answer = "1" ]; then
	echo "Here are the files and their permissions:"
	ls -l 
	echo "Your choice:"
	read fileanswer
	echo "current permissions:"
	ls -l $fileanswer
	chmod ugo+x $fileanswer
	echo "new permissions"
	ls -l $fileanswer
elif [ $answer = "3" ]; then
	echo "New directory name:"
	read diranswer
	mkdir $diranswer
	ls
elif [ $answer = "4" ]; then
	echo "New filename:"
	read touchanswer
	touch $touchanswer
	ls
elif [ $answer = "5" ]; then
	echo "Write to file:"
	read writeanswer
	echo "Name of user:"
	read useranswer
	echo "Last name of user:"
	read lastanswer
	echo "Job title:"
	read titleanswer
	echo File edited by $useranswer $lastanswer with the job $titleanswer >> $writeanswer
elif [ $answer = "6" ]; then
	num=1
	echo "Number of tasks:"
	read tasknum
	echo "Write to file:"
	read taskfile
	while [ $num -le $tasknum ]
	do
		echo What is task number $num
		read task
		echo $task >> $taskfile
		((num++))
	done
	cat $taskfile
elif [ $answer = "7" ]; then
	ls -l
	echo "File to change:"
	read change
	echo "Would you like to change the timestamp of this file?:" $change "(y/n)"
	read yes
	if [ $yes = "y" ]; then
		touch $change
		ls -l
	fi
fi

