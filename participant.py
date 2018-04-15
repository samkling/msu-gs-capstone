import json

#CLASS to define the participants
class Participant:

    def __init__(self,pList):
        self.infoList = pList

        self.id = pList[0]
        self.name = pList[1]
        self.gender = pList[2]
        self.major = pList[3]
        self.age = pList[4]
        self.phone = pList[5]
        self.androidScale = pList[6]
        self.iosScale = pList[7]
        self.pdfScale = pList[8]
        self.vPubScale = pList[9]

        self.pdf1Test1 = pList[10]
        self.pdf1Test1Completed = pList[11]
        self.pdf1Test1Time = pList[12]
        self.pdf2Test1 = pList[13]
        self.pdf2Test1Completed = pList[14]
        self.pdf2Test1Time = pList[15]
        self.pdfTest2BookMark = pList[16]
        self.pdfTest2Completed = pList[17]
        self.pdfTest2Time = pList[18]

        self.vPub1 = pList[19]
        self.vPub1Completed = pList[20]
        self.vPub1Time = pList[21]
        self.vPub2 = pList[22]
        self.vPub2Completed = pList[23]
        self.vPub2Time = pList[24]
        self.vPubPlaylist = pList[25]
        self.vPubPlaylistCompleted = pList[26]
        self.vPubPlaylistTime = pList[27]

        self.pdfEasyScale = pList[28]
        self.vPubEasyScale = pList[29]
        self.storeRetVPub = pList[30]
        self.storeRetPdf = pList[31]
        self.seeUsingVPub = pList[32]
        self.preferedApp = pList[33]
        self.comments = pList[34]

    def getId(self):
        return self.id
    def getComments(self):
        return self.comments
    def getInfoList(self):
        return self.infoList
    def getAndroidScale(self):
        return self.androidScale
    def getIosScale(self):
        return self.iosScale
    def getPdfScale(self):
        return self.pdfScale
    def getVPubScale(self):
        return self.pdfScale
    def getStepsCompletedPdf1Test1(self):
        return self.pdf1Test1Completed
    def getStepsCompletedPdf2Test1(self):
        return self.pdf1Test1Completed
    def getStepsCompletedPdfTest1(self):
        return self.pdfTest2Completed

#CLASS to define the group of participants
class Study:
    def __init__(self):
        self.categories = []
        self.displayCategories = []
        self.participants = []
        self.displayParticipants = []
        self.selectList = ['0','2','6','7','8','9','11','14','17','20','23','26','28','29','30','31','32','33']

    def addParticipant(self, pList):
        if pList[0].upper() == "ID" and len(self.categories) == 0:
            self.categories = pList
        else:
            self.participants.append(Participant(pList))

    def getParticipants(self):
        return self.participants
        
    def getCategories(self):
        return self.categories

    def getDisplayCategories(self):        
        if len(self.displayCategories) > 0:
            return self.displayCategories

        for i in range(len(self.categories)):
            if str(i) in self.selectList:
                self.displayCategories.append(self.categories[i])
        return self.displayCategories

    def getDisplayParticipants(self):
        #### TODO: delete this 
        newList = []
        for i in range(35):
            newList.append(str(i))
        self.selectList = newList

        if len(self.displayParticipants) > 0:
            return self.displayParticipants
        for p in self.participants:
            infoList = p.getInfoList()
            insertList = []
            for i in range(len(infoList)):
                if str(i) in self.selectList:
                    insertList.append(infoList[i])
            self.displayParticipants.append(insertList)  
        return self.displayParticipants

    def getAndroidUsers(self):
        c = 0
        for p in self.participants:
            if p.getAndroidScale() > p.getIosScale():
                c += 1
        return c
    def getStepsCompletedPdf1Test1(self):
        data = [0,0,0,0,0]

        for p in self.participants:
            if p.getStepsCompletedPdf1Test1() == '0':
                data[0] += 1
            elif p.getStepsCompletedPdf1Test1() == '1':
                data[1] += 1
            elif p.getStepsCompletedPdf1Test1() == '2':
                data[2] += 1   
            elif p.getStepsCompletedPdf1Test1() == '3':
                data[3] += 1
            elif p.getStepsCompletedPdf1Test1() == '4':
                data[4] += 1
        #json_data = json.dumps(data)
        return data









