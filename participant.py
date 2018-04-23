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
    def getPdfEase(self):
        return int(self.pdfEasyScale)
    def getVpubEase(self):
        return int(self.vPubEasyScale)

    def getPdf1Test1Time(self):
        return int(self.pdf1Test1Time)
    def getPdf2Test1Time(self):
        return int(self.pdf2Test1Time)
    def getVPub1Time(self):
        return int(self.vPub1Time)
    def getVPub2Time(self):
        return int(self.vPub2Time)
    def getPdf1Test1Completed(self):
        return int(self.pdf1Test1Completed)
    def getPdf2Test1Completed(self):
        return int(self.pdf2Test1Completed)
    def getVPub1Completed(self):
        return int(self.vPub1Completed)
    def getVPub2Completed(self):
        return int(self.vPub2Completed)

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
        self.pdfDelta = 0
        self.vPubDelta = 0
        self.vPubCompletedTest1 = 0
        self.pdfCompletedTest1 = 0
        self.pdfEaseOfUse = [0,0,0,0,0]
        self.vPubEaseOfUse = [0,0,0,0,0]

    def getPdfEaseOfUse(self):
        return self.pdfEaseOfUse
    def getVpubEaseOfUse(self):
        return self.vPubEaseOfUse
    def addParticipant(self, pList):
        if pList[0].upper() == "ID" and len(self.categories) == 0:
            self.categories = pList
        else:
            p = Participant(pList)
            self.pdfEaseOfUse[p.getPdfEase()-1] += 1 
            self.vPubEaseOfUse[p.getVpubEase()-1] += 1 
            self.participants.append(p)

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

    def getAverageTimePerTask(self):
        tasksCompleted = [0,0,0,0]
        timeForTest = [0,0,0,0]
        retAvg = [0,0,0,0] 



        for p in self.participants:
            timeForTest[1] += p.getPdf1Test1Time()
            timeForTest[0] += p.getPdf2Test1Time()
            timeForTest[2] += p.getVPub1Time()
            timeForTest[3] += p.getVPub2Time()
            tasksCompleted[1] += p.getPdf1Test1Completed()
            tasksCompleted[0] += p.getPdf2Test1Completed()
            tasksCompleted[2] += p.getVPub1Completed()
            tasksCompleted[3] += p.getVPub2Completed()
        
        for i in range(4):
            if tasksCompleted[i] > 0:
                retAvg[i] = timeForTest[i] // tasksCompleted[i]
        #print("retAverage",retAvg)
        if self.pdfDelta == 0 and self.vPubDelta == 0:
            self.pdfDelta = retAvg[0]-retAvg[1]
            self.vPubDelta = retAvg[2]-retAvg[3]

        return retAvg

    def getDeltas(self):
        return [self.pdfDelta,self.vPubDelta]

    def getTest1Completed(self):
        return [self.pdfCompletedTest1, self.vPubCompletedTest1]


    def getCompletedAll(self):
        tasksCompleted = [0,0,0,0]
        timeForTest = [0,0,0,0]
        retAvg = [0,0,0,0] 
        check = True

        if self.vPubCompletedTest1 > 0:
            check = False 

        for p in self.participants:
            if p.getPdf1Test1Completed() == 4:
                timeForTest[1] += p.getPdf1Test1Time()
                tasksCompleted[1] += p.getPdf1Test1Completed()
                if check == True:
                    self.pdfCompletedTest1 += 1
            if p.getPdf2Test1Completed() == 4:
                timeForTest[0] += p.getPdf2Test1Time()
                tasksCompleted[0] += p.getPdf2Test1Completed()
            if p.getVPub1Completed() == 4:
                timeForTest[2] += p.getVPub1Time()
                tasksCompleted[2] += p.getVPub1Completed()
            if p.getVPub2Completed() == 4:
                timeForTest[3] += p.getVPub2Time()
                tasksCompleted[3] += p.getVPub2Completed()
                if check == True:
                    self.vPubCompletedTest1 += 1
        for i in range(4):
            if tasksCompleted[i] > 0:
                retAvg[i] = timeForTest[i] // tasksCompleted[i]
        print("pdf/vpub",self.vPubCompletedTest1, self.pdfCompletedTest1)
        return retAvg
    def davidVrobin(self):
        tasksCompleted = [8,8]
        timeForTest = [0,0]
        retAvg = [0,0] 

        for p in self.participants:
            if p.name.strip() == "David":
                timeForTest[0] += p.getVPub1Time()
                timeForTest[0] += p.getVPub2Time()
            if p.name.strip() == "Robin":
                timeForTest[1] += p.getVPub1Time()
                timeForTest[1] += p.getVPub2Time()
        
        for i in range(2):
            if tasksCompleted[i] > 0:
                retAvg[i] = timeForTest[i] / tasksCompleted[i]
        print("ret",timeForTest)
        return retAvg




