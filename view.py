
from bottle import static_file, get, route, run, template
from participant import Participant
from participant import Study
from analyzeCsv import Data


Data = Data()
Study = Data.getStudy()

def getInfo():
	info = {'participants': Study.getDisplayParticipants(), 'categories': Study.getDisplayCategories(), 'androidUsers': Study.getAndroidUsers() }
	info['stepsCompletedPdf1Test1'] = Study.getStepsCompletedPdf1Test1()
	info['show_header_footer'] = False
	info['averageTimePerTask'] = Study.getAverageTimePerTask()
	deltas = Study.getDeltas()
	info['pdfDelta'] = deltas[0]
	info['vPubDelta'] = deltas[1]
	info['completedAll'] = Study.getCompletedAll()
	completedTest1 = Study.getTest1Completed()
	info['pdfTest1Completed'] = completedTest1[0]
	info['vPubTest1Completed'] = completedTest1[1]
	info['davidVrobin'] = Study.davidVrobin()
	info['pdfEaseOfUse'] = Study.getPdfEaseOfUse()
	info['vPubEaseOfUse'] = Study.getVpubEaseOfUse()
	info['averageTaskCompletedPdf'] = Study.getAverageTaskCompletedPdf()
	info['averageTaskCompletedVPub'] = Study.getAverageTaskCompletedVPub()
	info['vPubTimeTest1'] = Study.getCompletedTimeVPub()


	return info

@route('/')
def index():
	info = getInfo()
	return template("dashboard", info)
@route('/<name>')
def index(name):
	info = getInfo()
	if name != "dashboard":
		info['show_header_footer'] = True
	return template(name, info)

# Static Routes
#USED for our CSS, JS and other assets
@get('/<filename:path>')
def static(filename):
    return static_file(filename, root='static/')

run(host='localhost', port=8080)