import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

def Conn(user,pwd,smtpServer):
    print "[+] Connect To Mail Server."
    smtpServer.ehlo()
    print "[+] Starting Encrypted Session."
    smtpServer.starttls()
    smtpServer.ehlo()
    print "[+] Logging Into Mail Server."
    smtpServer.login(user,pwd)
     

def sendMail(to,subject,text):
    html = MIMEText(text,'html')
    msg = MIMEMultipart('alternative')
    msg['From'] = "Facebook:"
    msg['to'] = to
    msg['Subject'] = subject
   
    msg.attach(html)
    
    try:
        smtpServer = smtplib.SMTP('smtp.gmail.com',587)
        user = "usuario@gmail.com"
        pwd = "password"
        Conn(user,pwd,smtpServer)
        print "[+] Sending Mail."
        smtpServer.sendmail("From: todoscontra@notificaciones.com",to,msg.as_string())
        smtpServer.close()
        print "[+] Mail Sent Successfully."
    except:
        print "[-] Sending Mail Failed."

def main():
    sendMail("mabixabor@balanc3r.com", "Revisa el intento de inicio de sesion bloqueado", "<h1>Hola mundo!!</h1>" )

if __name__ == "__main__":
    main()


