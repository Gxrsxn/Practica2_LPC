import requests
from bs4 import BeautifulSoup as bs

page = requests.get ("https://www.uanl.mx/eventos/")
print (page.status_code)                                #Status code 200 significa "Ok", 

print (input(1))
soup = bs(page.content,"html.parser")                   #Clase beautifulSoup

##Creamos el archivo .txt (puede ser de otra extensión unicamente indicando .html, etc)
fo = open ("WebScraping.txt","wb")
fo.write (soup.prettify().encode()) 
fo.close()
##Cerramos el archivo txt

po = soup.find_all("p") ##Buscamos todos los párrafos html p = paragraph
potext = po[0].getText()
print (input(2))

## Con select buscamos los elementos dentro de 4h que sean a
## Con select buscamos los elementos dentro de .dia
## Con select buscamos los elementos dentro de .mes
## Con select buscamos los elementos dentro de .col-xs-9 que sean p
## Ver archivo txt para referencia
fa = soup.select("h4 a")
print(fa)
dia = soup.select(".dia")
mes = soup.select(".mes")
lugar = soup.select(".col-xs-9 p")


for p,i, day, month, place in zip (fa, range (len(fa)),dia,mes, lugar):
    print (day.getText(),"\t",month.getText(),"\t",p.getText(),"\n",place.getText())
    print ("URL:", p.get("href"))
