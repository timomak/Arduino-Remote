from time import sleep
import socket



HOST = '10.68.75.203' # Enter IP or Hostname of your server
PORT = 12345 # Pick an open Port (1000+ recommended), must match the server port
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((HOST,PORT))

#Lets loop awaiting for your input
while True:
	command = input('Enter your command: ')
	s.send(command.encode('utf-8'))
	reply = s.recv(1024)
	if reply == 'Terminate':
		break
	print(reply)
