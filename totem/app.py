from flask import Flask, flash, redirect, render_template, request, session, abort, url_for
from random import randint
import datetime
import pyqrcode
from PIL import Image


import time
#import mysql.connector
#from dataB.dbCon import mydb,dBase,dBaseClose

from random import randint
#import pandas as pd

#atendimento = pd.read_csv('atendimento.csv')
#filaComum = pd.read_csv('filacomum.csv')
#filaPref = pd.read_csv('filapref.csv')
#usuario = pd.read_csv('usuario.csv')


app = Flask(__name__)

@app.route('/loginwebapp')
def loginwebapp():
    return render_template('loginWebApp.html')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/fila_comum')
def fila_comum():
    get_qrcode()
#    get_bd_filaComum()
    return render_template('fila_comum.html')

@app.route('/fila_pref')
def fila_pref():
    get_qrcode()
#    get_bd_filaPref()
    return render_template('fila_pref.html')

@app.route('/numero_totem')
def numero_totem():
    num = randint(0,10)
    return render_template('numero_totem.html',numero = num)

@app.route('/numero_tela')
def numero_tela():
    num = randint(0,10)
    return render_template('numero_tela.html',numero=num)

def get_db_filaComum():
    dBase.execute( 'SELECT atendC_N FROM fila_comum ORDER BY id DESC LIMIT 1;' )
    myresult = dBase.fetchall()
    for x in myresult:
        print(x)
    dBaseClose()
    return myresult


def get_qrcode():
    url = pyqrcode.QRCode('http://192.168.0.100:5000/numero_totem',error = 'H')
    url.png('test.png',scale=10)
    im = Image.open('test.png')
    im = im.convert("RGBA")
    logo = Image.open('static/img/logoPB.png')
    box = (185,185,285,285)
    im.crop(box)
    region = logo
    region = region.resize((box[2] - box[0], box[3] - box[1]))
    im.paste(region,box)
    #im.show()
    im.save('/home/tux/DEV/python/totem/static/img/qrcode.png')
    return 0



@app.errorhandler(404)
def page_not_found(error):
    return render_template('404.html'), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True )
