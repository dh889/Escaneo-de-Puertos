#!/bin/bash
function ctrl_c(){
	tput civis
	echo -e "[!] Saliendo ....\n\n"
	tput cnorm
	exit 1
}

#ctrl_C
trap ctrl_c INT

echo -e -n "\nIngrese la IP a escanear -> " && read IP
echo -e "Iniciando Escaneo en la IP $IP\n"
tput civis
for port in $(seq 1 65535); do (echo '' > /dev/tcp/$IP/$port) 2>/dev/null && echo "[+] $port - OPEN" &done; wait
tput cnorm
