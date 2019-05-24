import mysql.connector

mydb = mysql.connector.connect(
    host='localhost',
    user='root',
    password='QAHlyi_52K',
    database='totem'
)

dBase = mydb.cursor()

def dBaseClose():
    mydb.commit()
    dBase.close()
    mydb.close()



