#!/bin/bash

function nmap_ip(){
	ip="(nmap 127.0.0.1)
	echo "Segmento de red privado: " $ip
}

funtion nmap_snc(){
	ip2=$(nmap scanme.nmap.org)
	echo "Segmentopagina web: $ip2 
}

nmap_ip
nmap_scn
