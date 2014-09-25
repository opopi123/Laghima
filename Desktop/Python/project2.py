#CSE408 Summer 2014
import os
#Roy Joo 50016076
#Project 2 Python

import subprocess
import itertools
from os import listdir
from os.path import isfile, join


def filecomparator(filelist): // main method for comparing all files to each other  and printing results 
	print("File Comparisons:\n")
	fulllist = list(itertools.combinations(filelist,2))
	for (x,y) in fulllist:
		comparefile(x,y)
	print("\n")

def comparefile(file1,file2): // compares file1 to file 2 using unix diff
	try:
		cmpresult = subprocess.check_output(['diff', file1, file2])
		if not cmpresult:
			print(" {0} and {1} have the exact same contents!".format(file1,file2))
		else:
			pass
	except subprocess.CalledProcessError as e:
		pass

def datechecker(filelist, month, day):		// checks to see if month/day for each file > than month/day specified by user. Uses the ls -l command into unix
	print(" Date Checks : for {0} / {1} /this year\n".format(month,day))
	cmdresult = subprocess.check_output(['ls', '-l'],universal_newlines = True)
	str = cmdresult.split()
	str.pop(0)
	str.pop(0)
	counter = 0
	lengthoflist = len(str)
	while counter < lengthoflist:
		str.pop(0)
		str.pop(0)
		str.pop(0)
		str.pop(0)
		str.pop(0)
		m = str.pop(0)
		m = monthconverter(m)
		counter = counter + 6
		if m > month:
			str.pop(0)
			str.pop(0)
			fn = str.pop(0)
			print("{0} is older than inputted date".format(fn))
			counter = counter + 3
		elif m == month:
			d = str.pop(0)
			if d > day:
				str.pop(0)
				fn = str.pop(0)
				counter = counter + 3
				print("{0} is older than inputted date".format(fn))
		else: 
			str.pop(0)
			str.pop(0)
			str.pop(0)
			counter = counter + 3
		
	
		
def monthconverter(mth):		// converts Months to number format 
	if mth == "Jan" or mth == b'Jan':
		return 1
	elif mth == "Feb" or mth == b'Feb':
		return 2
	elif mth == "Mar" or mth == b'Mar':
		return 3
	elif mth == "Apr" or mth == b'Apr':
		return 4
	elif mth == "May" or mth == b'May':
		return 5
	elif mth == "Jun" or mth == b'Jun':
		return 6
	elif mth == "Jul" or mth == b'Jul':
		return 7
	elif mth == "Aug" or mth == b'Aug':
		return 8
	elif mth == "Sep" or mth == b'Sep':
		return 9
	elif mth == "Oct" or mth == b'Oct':
		return 10
	elif mth == "Nov" or mth == b'Nov':
		return 11
	elif mth == "Dec" or mth == b'Dec':
		return 12
	else: 
		return 0

def main():
	month = input("Please specify a Month ex: Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec\n")
	month = monthconverter(month)
	if month != 0:
		day = input("Please specify a Day of the Month\n")	
		files = [ f for f in listdir() if isfile(join(f))]
		print("\n")
		filecomparator(files)
		datechecker(files, month, day)
	else:
		print("Invalid Month. Please type one of the following : Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec\n")
		main()
main()
