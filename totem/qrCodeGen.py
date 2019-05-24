import pyqrcode
from PIL import Image

url = pyqrcode.QRCode('http://192.168.1.8:5000',error = 'H')
url.png('test.png',scale=13)
im = Image.open('test.png')
im = im.convert("RGBA")
logo = Image.open('static/img/logoPB.png')
#box = (135,135,235,235)
box = (215,215,315,315)
im.crop(box)
region = logo
region = region.resize((box[2] - box[0], box[3] - box[1]))
im.paste(region,box)
im.show()
im.save('/home/tux/DEV/python/totem/qrcode.png')

#im.save('static/img/qrcode.png')

#buffer = io.BytesIO()
#im.svg(buffer)
# do whatever you want with buffer.getvalue()


