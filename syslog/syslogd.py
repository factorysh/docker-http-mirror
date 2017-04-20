#!/usr/bin/env python3

# See https://gist.github.com/marcelom/4218010
import socketserver
import os

HOST, PORT = "0.0.0.0", 514


class SyslogHandler(socketserver.BaseRequestHandler):

    def handle(self):
        data = bytes.decode(self.request[0].strip())
        #socket = self.request[1]
        if self.client_address is not None:
            print("%s : %s " % (self.client_address[0], str(data)))
        else:
            print(str(data))


if __name__ == '__main__':
    import sys
    if len(sys.argv) > 1 and sys.argv[1] == "--unix":
        try:
            os.remove('/tmp/log')
        except:
            pass # At least, we trised
        server = socketserver.UnixDatagramServer('/tmp/log', SyslogHandler)
        print('listen socket')
    else:
        server = socketserver.UDPServer((HOST,PORT), SyslogHandler)
    try:
        server.serve_forever(poll_interval=0.5)
    except (IOError, SystemExit):
        raise
    except KeyboardInterrupt:
        print ("Crtl+C Pressed. Shutting down.")
