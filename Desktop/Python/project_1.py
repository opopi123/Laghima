#CSE408 Summer
#Roy Joo 50016076 
#Python 3.4

import sys
import os.path

def counter(x):
	global letters
	if x == "a" or x == "A":
		letters['a']=letters['a'] + 1
	elif x == "b" or x == "B":
		letters['b']=letters['b'] + 1
	elif x == "c" or x == "C":
		letters['c']=letters['c'] + 1
	elif x == "d" or x == "D":
		letters['d']=letters['d'] + 1
	elif x == "e" or x == "E":
		letters['e']=letters['e'] + 1
	elif x == "f" or x == "F":
		letters['f']=letters['f'] + 1
	elif x == "g" or x == "G":
		letters['g']=letters['g'] + 1
	elif x == "h" or x == "H":
		letters['h']=letters['h'] + 1
	elif x == "i" or x == "I":
		letters['i']=letters['i'] + 1
	elif x == "j" or x == "J":
		letters['j']=letters['j'] + 1
	elif x == "k" or x == "K":
		letters['k']=letters['k'] + 1
	elif x == "l" or x == "L":
		letters['l']=letters['l'] + 1
	elif x == "m" or x == "M":
		letters['m']=letters['m'] + 1
	elif x == "n" or x == "N":
		letters['n']=letters['n'] + 1
	elif x == "o" or x == "O":
		letters['o']=letters['o'] + 1
	elif x == "p" or x == "P":
		letters['p']=letters['p'] + 1
	elif x == "q" or x == "Q":
		letters['q']=letters['q'] + 1
	elif x == "r" or x == "R":
		letters['r']=letters['r'] + 1
	elif x == "s" or x == "S":
		letters['s']=letters['s'] + 1
	elif x == "t" or x == "T":
		letters['t']=letters['t'] + 1
	elif x == "u" or x == "U":
		letters['u']=letters['u'] + 1
	elif x == "v" or x == "U":
		letters['v']=letters['v'] + 1
	elif x == "w" or x == "W":
		letters['w']=letters['w'] + 1
	elif x == "x" or x == "X":
		letters['x']=letters['x'] + 1
	elif x == "y" or x == "Y":
		letters['y']=letters['y'] + 1
	elif x == "z" or x == "Z":
		letters['z']=letters['z'] + 1
	else:
		letters['others']=letters['others'] + 1
	
def pro1(ifp,ofp):
	global letters
	global words
	global inp
	
	x = ifp.read()
	wordlist = x.split()
	for w in wordlist:
		if w in words:
			words[w] += 1
			for l in w:
				counter(l)
		else:
			words[w] = 1
			for l in w:
				counter(l)
	print(words)
	print(letters)
	wc = wordcount()
	swc = str(wc)
	lc = lettercount()
	slc = str(lc)
	ofp.write("This is the statistic report for the file ")
	ofp.write(inp)
	ofp.write("\n")
	ofp.write("the word count for this file is ")
	ofp.write(swc)
	ofp.write("\n")
	ofp.write("the letter count for this file is ")
	ofp.write(slc)
	ofp.write("\n")
	for i in range(97,123):
		percent = letters[chr(i)]/lc * 100
		ofp.write(chr(i))
		ofp.write(" = ")
		percent = str(percent)
		ofp.write(percent)
		ofp.write("%")
		lstr = str(letters[chr(i)])
		ofp.write(" : ")
		ofp.write(lstr)
		ofp.write("\n")
	printtoptenwords(words,ofp)	
	ifp.close()
	ofp.close()

def wordcount():
	global words
	x = 0
	for i in words:
		x = x + words[i]
	return x

def lettercount():
	global letters
	x = 0
	for i in letters:
		x = x +letters[i]
	return x
def printtoptenwords(words,ofp):
	ofp.write("The Ten Top Most Frequent Words: \n")
	for w in sorted(words, key=words.get, reverse=True)[:10]:
		ofp.write(w)
		ofp.write(" = ")
		wstr = str(words[w])
		ofp.write(wstr)
		ofp.write("\n")

def main():
	global letters
	global words
	global inp
	letters = {'a': 0, 'b': 0, 'c': 0, 'd': 0, 'e': 0, 'f': 0, 'g': 0, 'h': 0, 'i': 0, 'j': 0, 'k': 0, 'l': 0, 'm': 0, 'n': 0, 'o': 0, 'p': 0, 'q': 0, 'r': 0, 's': 0, 't': 0, 'u': 0, 'v': 0, 'w': 0, 'x': 0, 'y': 0, 'z': 0, 'others':0}
	words = {}
	inp = input("give me an input filename\n")
	if os.path.isfile(inp) == True:
		outp = input("give me an output filename\n")
		ifp=open(inp,'r')
		ofp=open(outp,'w')
		pro1(ifp,ofp)
	else:
		print("the filename ", inp, "does not exist in this directory")
		main()
main()
