
from bottle import static_file, get, route, run, template
from participant import Participant
from participant import Study
from analyzeCsv import Data


Data = Data()
Study = Data.getStudy()


@route('/')
def index():
	info = {'categories': Study.getDisplayCategories(), 'participants': Study.getDisplayParticipants() }
	return template("dashboard", info)

# Static Routes
#USED for our CSS, JS and other assets
@get('/<filename:path>')
def static(filename):
    return static_file(filename, root='static/')

run(host='localhost', port=8080)