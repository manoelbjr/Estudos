from django.core.management.base import BaseCommand

from bs4 import BeautifulSoup # Include on Requeriments.txt

import requests # Include on Requeriments.txt
import re

def matchBetweenQuotes(text):      
  import re
  matches=re.findall(r'\"(.+?)\"',text)
  return matches


pagina = requests.get("https://www.tecmundo.com.br")
soup = BeautifulSoup(pagina.content,'html.parser')

soup2 = soup.find(id="json-script")
texto = soup2.text

#print(soup.prettify())

lista = matchBetweenQuotes(texto)
tamanhoLista = len(lista)

indiceTitulos= []
indiceUrl = []

listaTitulos = []
listaUrl = []

position=0
while(position < tamanhoLista):
    if lista[position] == "Title": indiceTitulos.append(position)
    if lista[position] == "Url" : indiceUrl.append(position)
    position+=1

position2=0
while(position2 < len(indiceTitulos)):
    idx = indiceTitulos[position2] + 1
    if lista[idx+3] == "Image" : listaTitulos.append(lista[idx])
    position2 +=1

position3=0
while(position3 < len(indiceUrl)):
    index = indiceUrl[position3]+1
    if lista[index+1] == "Image" : listaUrl.append(lista[index])
    position3 +=1

#print(indiceTitulos)
#print(indiceUrl)
#print(lista[31])
#print(doit(texto))
#print(listaUrl)

print("Ok!")