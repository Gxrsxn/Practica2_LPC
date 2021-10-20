import socket
import base64


GN = (socket.gethostname())
GHBN = (socket.gethostbyname(socket.gethostname()))


s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect(("8.8.8.8", 80))
GS = (s.getsockname()[0])


Enc1 = base64.b64encode(bytes(GN, 'utf-8'))
Enc2 = base64.b64encode(bytes(GHBN, 'utf-8'))
Enc3 = base64.b64encode(bytes(GS, 'utf-8'))

print(Enc1)
print(Enc2)
print(Enc3)

fo = open ("LocalHost & IP address.txt", "w")
fo.write(str(Enc1))
fo.write(str(Enc2))
fo.write(str(Enc3))

fo.close()

