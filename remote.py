# remote.py
# from gpiozero import LED, Button
from time import sleep
import requests
import json
import threading

# button = Button(6)
# green = LED(17)
# red = LED(27)
# blue = LED(13)

import socket



HOST = '10.0.0.208' # Server IP or Hostname
PORT = 12345 # Pick an open Port (1000+ recommended), must match the client sport
s = socket.socket() # Keep it a stream. socket.AF_INET, socket.SOCK_STREAM
print('Socket created')

# MARK: To get host name
print(socket.gethostbyname_ex(socket.gethostname()))
print(socket.gethostname())

#managing error exception
try:
	s.bind((HOST, PORT))
except(socket.error):
	print('Bind failed')

s.listen(5)
print('Socket awaiting messages')
(conn, addr) = s.accept()
print('Connected')

# awaiting for message
while True:
	try:
		data = conn.recv(1024)
		print(str(data))
		reply = 'Working (from python)'

		# # process your message
		# if data == 'Hello':
		# 	reply = 'Hi, back!'
		# 	elif data == 'This is important':
		# 	reply = 'OK, I have done the important thing you have asked me!'
	    #
		# #and so on and on until...
		# elif data == 'quit':
		# 	conn.send('Terminating')
		# 	break
		# else:
		# 	reply = 'Unknown command'

		# Sending reply
		conn.send(reply.encode('utf-8'))
		conn.close() # Close connections
	except KeyboardInterrupt:
		print("Interrupted by keyboard")
		conn.close()
"""
The code below was used to connect via API rather than a socket.
"""
# # Remote API (https://timomak.github.io/Arduino-Remote/#/api-docs)
# url = "https://remote-rest-api.herokuapp.com/arduino/motor"
#
# state_of_motor = ""
#
# def set_motor_state_to(state):
#     if state != state_of_motor:
#         if state == "stop":
#             # Blue light on
#             print("Blue")
#         elif state == "forward":
#             # Green light on
#             print("Green")
#         elif state == "backward":
#             # Red light on
#             print("Red")
#     get_motor_state()
#
# def get_motor_state():
#     """
#     For the device to check what the motor actions should be.
#     Can only be one of these three: "forward", "backward", "stop"
#     """
#     myRequest = requests.get(url)
#
#     if (myRequest.ok):
#         print("Successful Connection")
#         response = myRequest.text
#         print("response:", response)
#         # TODO: Handle Response
#         set_motor_state_to(response)
#     else:
#       # If response code is not ok (200), print the resulting http error code with description
#         myRequest.raise_for_status()
#
# def start_thread():
#     set_motor_state_to("stop")
#
# threading.Thread(target=start_thread).start()
