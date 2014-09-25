import sys
from random import randint
counter = 0
for x in range(0,10):
	print 'python is ez {}' ,format(counter)
	print randint(1,10000)
	counter = counter + 1
print counter
