from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtCore import QThread, QObject, pyqtSlot, QTimer
import os
from time import sleep as sl

class Ui_Dialog(object):

    def setupUi(self, Dialog):

        Dialog.setObjectName("Dialog")
        Dialog.resize(659, 497)

        self.textBrowser = QtWidgets.QTextBrowser(Dialog)
        self.textBrowser.setGeometry(QtCore.QRect(20, 40, 291, 431))
        self.textBrowser.setObjectName("textBrowser")
        self.lineEdit = QtWidgets.QLineEdit(Dialog)
        self.lineEdit.setGeometry(QtCore.QRect(510, 130, 41, 25))
        self.lineEdit.setObjectName("lineEdit")
        self.label = QtWidgets.QLabel(Dialog)
        self.label.setGeometry(QtCore.QRect(340, 90, 301, 20))

        font = QtGui.QFont()
        font.setPointSize(14)

        self.label.setFont(font)
        self.label.setObjectName("label")
        self.label_2 = QtWidgets.QLabel(Dialog)
        self.label_2.setGeometry(QtCore.QRect(420, 130, 64, 21))

        font = QtGui.QFont()
        font.setPointSize(14)

        self.label_2.setFont(font)
        self.label_2.setObjectName("label_2")
        self.pushButton = QtWidgets.QPushButton(Dialog)
        self.pushButton.setGeometry(QtCore.QRect(430, 290, 111, 31))

        font = QtGui.QFont()
        font.setPointSize(13)

        self.pushButton.setFont(font)
        self.pushButton.setObjectName("pushButton")
        self.radioButton = QtWidgets.QRadioButton(Dialog)
        self.radioButton.setGeometry(QtCore.QRect(330, 230, 251, 23))

        font = QtGui.QFont()
        font.setPointSize(13)

        self.radioButton.setFont(font)
        self.radioButton.setObjectName("radioButton")
        self.radioButton_2 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_2.setGeometry(QtCore.QRect(330, 190, 321, 23))

        font = QtGui.QFont()
        font.setPointSize(13)

        self.radioButton_2.setFont(font)
        self.radioButton_2.setObjectName("radioButton_2")
        self.retranslateUi(Dialog)

        QtCore.QMetaObject.connectSlotsByName(Dialog)

    def retranslateUi(self, Dialog):

        _translate = QtCore.QCoreApplication.translate
        Dialog.setWindowTitle(_translate("Dialog", "Dialog"))

        self.label.setText(_translate("Dialog", "Application index to terminate"))
        self.label_2.setText(_translate("Dialog", "Index :"))
        self.pushButton.setText(_translate("Dialog", "Terminate"))
        self.radioButton.setText(_translate("Dialog", "Terminate linked apps too"))
        self.radioButton_2.setText(_translate("Dialog", "Terminate current application only"))

        self.timer = QtCore.QTimer()
        self.timer.timeout.connect(self.loop)
        self.timer.start(100) 

        self.pushButton.clicked.connect(self.dell)


    def dell(self):

        try:

            index = self.lineEdit.text()

            if self.radioButton_2.isChecked():

                a = "pkill " + str(self.run[int(index)])

                os.system(a)

                self.pushButton.setText("Successful")


            elif self.radioButton.isChecked():

                a = "killall " + str(self.run[int(index)])

                os.system(a)

                self.pushButton.setText("Successful")

            else:

                self.pushButton.setText("Error")

        except:

            self.pushButton.setText("Error")

    def loop(self):

        self.asd = self.textBrowser.verticalScrollBar().value()


        os.system("ps -a > asd.txt")

        file = open("asd.txt","r+")

        veri = file.read()

        veria = veri.split("\n")

        self.run = []

        x = 0

        for i in veria:

            if x == 0:
                x+=1
                continue

            gecici = i.split(" ")

            try:

                self.run.append(gecici[8])

            except:

                try:

                    self.run.append(gecici[7])

                except:

                    pass


        a = "Index | Application name\n\n"

        c = -1

        for i in self.run:

            c += 1

            a += "    {}    -  ".format(c)

            a += i + "\n"

            ge = 25 - len(i)

        self.textBrowser.setText(a)

        self.textBrowser.verticalScrollBar().setValue(self.asd)



if __name__ == "__main__":

    import sys
    
    app = QtWidgets.QApplication(sys.argv)
    Dialog = QtWidgets.QDialog()
    ui = Ui_Dialog()
    ui.setupUi(Dialog)
    Dialog.setFixedSize(659, 497)
    Dialog.setWindowTitle("Application Termination")
    Dialog.show()
    sys.exit(app.exec_())

