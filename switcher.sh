#!/bin/bash
#┏━━━┓╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋┏┓
#┃┏━┓┃╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋╋┃┃
#┃┗━━┳┓┏┳━━┳━━┳━┳━┓┏━━┳━┓┏━┛┣┓┏┓
#┗━━┓┃┃┃┃┏┓┃┃━┫┏┫┏┓┫┏┓┃┏┓┫┏┓┃┃┃┃
#┃┗━┛┃┗┛┃┗┛┃┃━┫┃┃┃┃┃┏┓┃┃┃┃┗┛┃┗┛┃
#┗━━━┻━━┫┏━┻━━┻┛┗┛┗┻┛┗┻┛┗┻━━┻━━┛
#╋╋╋╋╋╋╋┃┃
#╋╋╋╋╋╋╋┗┛
#You can modify my c0de, make it better
#EmaiL : < ilovunandu@yahoo.com >
#it will shutdown your graphics card for your linux session,
#without affecting it. Increase your battery life and work cool.
#works with both noisy ATI/AMD Radeon and Nvidia graphics card.
vga="/sys/kernel/debug/vgaswitcheroo/switch";
clear
if [ $# -lt 1 ]
then
	echo "Please Pass Appropriate Arguments to #0 to Switch Between Graphics Card"
	echo "	type \"$0 0\" to view help page"
	exit
fi
if [ $1 -eq 0 ]
then
	echo "Required Arguments"
	echo "	usage: \"$0 1\" : turns off the Discrete VGA Card."
	echo "	usage: \"$0 2\" : turns on the Discrete VGA Card."
	exit
fi
if [ $1 -eq 1 ]
then
	if [ -w $vga ]
	then
		echo "Kernel Debug Directory Alerady Mounted"
	else
		echo "Mounting Kernel Debug Directory. Please Wait.."
		mount -t debugfs none /sys/kernel/debug
		if [ -w $vga ]
		then
	        	echo "Mounting Successfull.."
		else
			echo "Directory Mount Failed Please Restart Your system and Retry"
		fi 
	fi
		if [ -w $vga ]
		then	
			echo "Detecting VGA Cards."
			echo "Cards Found: "
			int=`lspci -nn | grep VGA`;
			echo "$int"
			echo "Okay."
			echo "Writing New Kernel VGA Configuration"
			echo "Disabling Discrete Graphics."
			echo OFF > $vga
			echo "DONE!"
			echo "Yeah!! Successful Enjoy High Battery Performance.. :) :) :)" 
		else	
			echo "failed... :( :("
		fi
		echo "Unmounting Kernel Directory"
		umount /sys/kernel/debug
		echo "DONE!"
fi
if [ $1 -eq 2 ]
then
	if [ -w $vga ]
	then
		echo "Kernel Debug Directory Alerady Mounted"
	else
		echo "Mounting Kernel Debug Directory. Please Wait.."
		mount -t debugfs none /sys/kernel/debug
		if [ -w $vga ]
		then
	        	echo "Mounting Successfull.."
		else
			echo "Directory Mount Failed Please Restart Your system and Retry"
		fi 
	fi
		if [ -w $vga ]
		then	
			echo "Detecting VGA Cards."
			echo "Cards Found: "
			int=`lspci -nn | grep VGA`;
			echo "$int"
			echo "Okay."
			echo "Writing New Kernel VGA Configuration"
			echo "Enabling Discrete Graphics."
			echo ON > $vga
			echo "DONE!"
			echo "High Graphics Performance.. Turned On" 
		else	
			echo "failed... :( :("
		fi 
		echo "Unmounting Kernel Directory"
		umount /sys/kernel/debug
		echo "DONE!"
fi
exit