# Registro de Hoteles

Aplicativo Web de Criptomonedas desarrollada con Symfony + Vue.


### Pre-requisitos 📋


_Instalar Composer_

Se requiere este paquete de instalación que nos facilita la instalación de Symfony, ya que desde su linea de comandos (CLI) se gestionará este proceso.
Link de Instalación:
```
https://getcomposer.org/doc/00-intro.md
```

_Instalar WampServer o Xampp_

Se requiere un programa que genere un servidor local, recomendamos alguno de estos dos, pero puede ser el que más desee. Con este programa, instalaremos Apache,
como servidor, y PHP, que son herramientas que permitiran la conexión de nuestro aplicativo desde la base de datos hacia el backend y posteriormente al frontend.
Si ya tiene alguno instalado, asegurese de tener la version de PHP superior a 8.0, si no es así, actualice el programa.

_Link Xampp_
```
(https://www.apachefriends.org/docs/)
```
_Link WampServer_ 
```
(https://www.wampserver.com/en/category/documentation-en/)
```


_Instalar Npm_

Tambien para nuestro Frontend, requerimos del paquete de instalación NPM, en su versión 8.1.2 o superior.
Link para instalación 
```
(https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
```

_Instalar PHP_

Debemos tener una versión superior a la 8
```


_Instalar Postgresql_

Para este proyecto se instaló la versión 15, el backup de la base de datos esta en esa versión, pero si lo prefiere puede usar la versión de Postgresql
u otro gestor de base de datos que prefiera, solo debe configurar el archivo .ENV, el cuál se explica en este documento.
_Link de instalación_
```
https://Symfony.com/docs/7.x/installation
```

_Instalar GIT_

Para poder clonar el repositorio, modificar, y crear versiones, utilizaremos Git y GitHub, para esto es necesario instalarlo de manera local, en el siguiente link podrá seguir el paso a paso para su instalación.
```
https://git-scm.com/book/es/v2/Inicio---Sobre-el-Control-de-Versiones-Instalaci%C3%B3n-de-Git
```


## Instalación 🔧

_Clonar Repositorio_

_Vaya al carpeta donde instaló el software para el servidor Apache_

Para Xampp seria:
```
C:\xampp\htdocs
```
Para WampServer:
```
C:\wamp64\www
```
_Abrimos una terminal de comandos o CMD, luego en ella, clonamos el repositorio con la siguiente instrucción_
```
git clone https://github.com/brian623/viewCoins.git
```
_Allí quedarán todos los archivos de nuestro aplicativo, junto con el backup de la base de datos_

_Abra pgAdmin4, para gestionar la base de datos, en la carpeta BD de nuestro proyecto, encontrará un archivo llamado "viewCoins.sql", este es el backup_

_En pgAdmin vamos a crear la BD y para luego restaurarla


#### Instalar dependencias  ⚙️

_Abrimos una terminal o consola de comandos y ejecutamos:
```
composer install
npm install
```

#### Configurar conexión entre BD y Symfony ⚙️

_Para configurar la conexión a la base de datos con Symfony, vaya a la carpeta del proyecto y luego a la carpeta viewCoins, que es la carpeta con nuestro backend_
_luego abra el arcivo_ .env.example _y le cambiamos el nombre a_ .env 
_luego editará las siguientes lineas, poniendo como contraseña la configurada al momento de instalar_ Postgresql

```
DATABASE_URL="postgresql://postgres:YOU_PASSWORD@127.0.0.1:5432/viewCoins"
```

#### Crear token JWT ⚙️
_Ejecutar el siguiente comando:_
```
php bin/console lexik:jwt:generate-keypair
```

#### Ejecutar API 🔩

_Luego de configurar la base de datos, podemos ejecutar la APIREST creada desde Symfony, para esto, ejecute lo siguiente:_

```
symfony server:start
```


## Despliegue 📦

_Ya con la API ejecutandose, podemos ejecutar nuestro aplicativo web, para esot vaya a la carpeta_ viewCoins _dentro del proyecto y abra una terminal y ejecute:_
```
npm install
```
_Esto instalará las dependencias necesarias para el aplicativo realizado con Vue, luego para ejecutarlo y abrirlo en el navegador ejecute:_
```
npm start
```
_Abra su navegador y en una pestaña vaya a:_
```
http://localhost:8000/
```
# Todo listo! Ya puedes usar la aplicación!
## Construido con 🛠️


* [PostgreSql] (https://www.postgresql.org/) - Gestor de Bases de Datos
* [VueJs] (https://es.Vuejs.org/) - Framework FrontEnd
* [Symfony] (https://Symfony.com/) - Framework Backend


## Autores ✒️

* **Brian Rincón Daza** - ([https://github.com/villanuevand](https://github.com/brian623))


