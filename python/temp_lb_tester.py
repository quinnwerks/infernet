import socket
import networking532 as n532
import sys

HOST = sys.argv[1]  # The server's hostname or IP address
PORT = n532.LB_TCP_PORT        # The port used by the server

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.settimeout(3)
    try:
        s.connect((HOST, PORT))
        s.sendall(n532.CLIENT_DONE_STR + b'1.1.2.2')
        data = s.recv(1024)
        print('Received', repr(data))
    except socket.timeout as e:
        print(e)
