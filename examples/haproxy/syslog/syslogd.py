#!/usr/bin/env python3

# See https://gist.github.com/marcelom/4218010
import socketserver

HOST, PORT = "0.0.0.0", 514


class SyslogUDPHandler(socketserver.BaseRequestHandler):

    def handle(self):
        data = bytes.decode(self.request[0].strip())
        socket = self.request[1]
        print( "%s : %s " % (self.client_address[0], str(data)))

if __name__ == '__main__':
    try:
        server = socketserver.UDPServer((HOST,PORT), SyslogUDPHandler)
        server.serve_forever(poll_interval=0.5)
    except (IOError, SystemExit):
        raise
    except KeyboardInterrupt:
        print ("Crtl+C Pressed. Shutting down.")
