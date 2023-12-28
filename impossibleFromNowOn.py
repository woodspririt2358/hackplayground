import socket

UDP_IP = "172.16.2.250"
UDP_PORT = 5005
MESSAGE = b"Hi"

sock = socket.socket(socket.AF_INET, # Internet
                     socket.SOCK_DGRAM) # UDP
while(1):
  for i in range(0,65000):
    sock.sendto(MESSAGE, (UDP_IP, i))
