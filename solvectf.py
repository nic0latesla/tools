#!/usr/bin/env  python

import socket
from  uszipcode import ZipcodeSearchEngine


def findd(codigo,opc):
    res = 0
    try:                                                     
        f1 = open("codigos.txt","r")                         
        i=0                                                
        l = f1.read().splitlines()  
        for cood in l:                                       
            r = cood.split("\t")                             
            if(r[0] == codigo ): 
                land = r[3]                                  
                water = r[4]                                 
                lat = r[7]                              
                lon = r[8]                                       
                if int(opc) == 1:
                    res = land
                elif int(opc) == 2:
                    res = water
                elif int(opc) == 3:
                    res =  lat.replace(" ","")
                elif int(opc) == 4:
                    res = lon.replace(" ","")
                f1.close()
                break
        return res
    except:                                                  
        pass                                                 
        print "Problem!!!"


def coordinates(code):
    #code = raw_input('Enter zip code: ')
    search = ZipcodeSearchEngine()
    zipcode = search.by_zipcode(code)
    return zipcode
    
def getzipcode(banner):
    c = banner.split(" ")
    return str(c[len(c)-2].replace("?",""))

def conn():
    s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    try:
        s.connect(("165.227.110.243",12483))
        r = s.recv(1024)
        r = s.recv(1024)
        r = s.recv(1024)
        r = s.recv(1024)
        #print r
        #rep = coordinates()
        print r
        i = 0
        
        while i <= 50:

            if r.find("longitude") != -1:
                code = getzipcode(str(r))
                print "zipcode: " + str(code)
                coo = findd(code,4)
                print "Lon: " + str(coo) 
                s.sendall(str(coo) + "\r\n")
                r = s.recv(1024)
                print r
                i = i + 1

            if r.find("latitude") != -1:
                code = getzipcode(str(r))
                print "zipcode: " + str(code)
                coo = findd(code,3)
                print "Lat: " + str(coo)
                s.sendall(str(coo) + "\r\n")
                r = s.recv(1024)
                print r
                i = i + 1

            if r.find("land area") != -1:
                code = getzipcode(str(r))
                print "zipcode: " + str(code)
                coo = findd(code,1)
                print "land area: " + str(coo)
                #la = 2590000*float(coo)
                print "land area2:" + str(coo)
                s.sendall(str(int(coo)) + "\r\n")
                r = s.recv(1024)
                print r
                i = i + 1
        
            if r.find("water area") != -1:
                code = getzipcode(str(r))
                print "zipcode: " + str(code)
                coo = findd(code,2)
                print "water area: " + str(coo)
                #wa = 2590000*float(coo)
                print "water area2:" + str(int(coo))
                s.sendall(str(coo) + "\r\n")
                r = s.recv(1024)
                print r
                i = i + 1
    except:
        print "Error mio"
        pass
        s.close()

def main():
    conn()
    #coordinates()
    #zipcode = raw_input("zipcode:")
    #opc = raw_input("opcion:")
    #print findd(zipcode,opc)

if __name__ == "__main__":
    main()
