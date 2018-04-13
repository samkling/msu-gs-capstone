import csv

from participant import Study
from participant import Participant

class Data:
	def __init__(self):
		self.study = Study()

		with open('results.csv', 'rt') as csvfile:
		     reader = csv.reader(csvfile)
		     for row in reader:
		     	self.study.addParticipant(row)
		csvfile.close()
		
	def getStudy(self):
		return self.study

# def setData():
# 	study = Study()

# 	with open('results.csv', 'rt') as csvfile:
# 	     reader = csv.reader(csvfile)
# 	     for row in reader:
# 	     	study.addParticipant(row)
# 	csvfile.close()

# 	return study
# def main():
# 	studyData = setData()

# 	for p in studyData.getAll():
# 		print(p.getId(), p.getComments())

# 	return 0
# main()