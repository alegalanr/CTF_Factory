# CTF_Factory

CTF_Factory es un reto diseñado para el *Capture The Flag* organizado durante el [Cyber Bootcamp Málaga](https://www.nics.uma.es/cyber-bootcamp-malaga/) por los mentores de su primera edición. Esta máquina busca explorar diversas habilidades aprendidas durante el curso, centrándose en la parte de forense y siendo accesible para los distintos niveles de habilidad.

## Temática y especificaciones

Una fábrica ha sido víctima de un ataque de *ransomware* y necesitan recuperar la clave privada que descifra las comunicaciones de los sensores con el controlador de SCADA. En el proceso se encuentran los vectores de ataque y diversa información adicional sobre los cibercriminales.

El reto consta de 4 partes principales:

### Partición sin cifrar

En este trozo del volcado forense se encuentra una *flag* y el enlace a la página web en el **README.txt**

### Página web de ransomware

La página estática está desplegada sobre un servidor con un dominio de los hackers. Para el reto alojé la web en mi propio servidor y bajo un subdominio (www.candadocifrado.iaclover.com) En el código se encuentran algunas *flags*.

### Partición cifrada

Esta es la parte principal del disco, el sistema cifrado. Una vez encontrada la clave de descifrado del disco en la página web, se puede encontrar la **SCADA.key** cifrada. Para descifrarla hay que encontrar la clave simétrica utilizada, que te revelan que es la misma que utilizaba el *iotmanager* en su usuario, pero no hay forma de comunicarse con él y nadie más conoce su contraseña. Otras *flags* se pueden encontrar en las trazas de *logs* del sistema, que te llevan a otros puntos de la intrusión.

### Imagen bonus

Se puede obtener una imagen "eliminada" utilizando herramientas de recuperación. Es un código qr que funciona como muñeca rusa, necesitando encadenar varias herramientas de análisis y *reversing* para encontrar todas las *flags*.
