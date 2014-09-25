ELEMENTS = 3
def calculate_grade(bridge1,road1,bridge2):
	print("calculating: ", bridge1, road1, bridge2)
	avg = (bridge1 +road1 + bridge2)/ELEMENTS
	if avg > 30:
		grade = 'Excellent'
	elif avg >20:
		grade = 'Good'
	elif avg > 10:
		grade = 'Average'
	else:
		grade = 'Poor'
	return grade
def main():
	print(calculate_grade(25,30,12))
	print(calculate_grade(bridge2 = 10, road1=15, bridge1 = 18))
main()
