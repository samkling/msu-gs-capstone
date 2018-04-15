
from bottle import static_file, get, route, run, template
from participant import Participant
from participant import Study
from analyzeCsv import Data


Data = Data()
Study = Data.getStudy()

def getInfo():
	info = {'participants': Study.getDisplayParticipants(), 'categories': Study.getDisplayCategories(), 'androidUsers': Study.getAndroidUsers() }
	info['stepsCompletedPdf1Test1'] = Study.getStepsCompletedPdf1Test1()
	return info

@route('/')
def index():
	info = getInfo()
	return template("dashboard", info)

# Static Routes
#USED for our CSS, JS and other assets
@get('/<filename:path>')
def static(filename):
    return static_file(filename, root='static/')

run(host='localhost', port=8080)