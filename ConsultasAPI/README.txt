Documentacion de API https://hunter.io/api-documentation/v2#email-verifier
Esta url está dentro de la documentacion

El resultado devuelve el estado principal de la verificación. Puede tomar 3 valores posibles:
  1. "Derivarable": La verificación del correo es exitosa y la dirección de correo electronico es válida.
  2. "Undeliverable": La dirección del correo electronico no es valida.
  3. "Risky" La verificación no puede ser validada.


Puntuación: es la puntuación de entregabilidad que damos a la dirección de correo electrónico.
ExpReg: es verdadero si la dirección de correo electrónico pasa nuestra expresión regular.
gibberish: es verdadero si encontramos que se trata de una dirección de correo electrónico generada automáticamente (por ejemplo, "e65rc109q@company.com").
Desechable: es verdadero si encontramos que se trata de una dirección de correo electrónico de un servicio de correo electrónico desechable.
webmail: es verdadero si encontramos que se trata de un correo electrónico de un webmail (por ejemplo Gmail).
mx_records: es verdadero si encontramos que existen registros MX en el dominio de la dirección de correo electrónico dada.
smtp_server: es verdadero si nos conectamos al servidor SMTP con éxito.
smtp_check: es verdadero si la dirección de correo electrónico no rebota.
accept_all: es verdadero si el servidor SMTP acepta todas las direcciones de correo electrónico. Esto significa que puede tener falsos positivos en las comprobaciones SMTP.
Bloque: es verdadero si el servidor SMTP nos impidió realizar la comprobación STMP.
fuentes: Si hemos encontrado la dirección de correo electrónico dada en algún lugar de la web, mostramos las fuentes aquí. El número de fuentes está limitado a 20. 

El atributo extracted_on contiene la fecha en que se encontró por primera vez, mientras que el atributo last_seen_on contiene la fecha en que se encontró por última vez.

Tenga en cuenta que esta llamada a la API está limitada a 300 solicitudes por minuto, con "tics" de 10 solicitudes por segundo.
