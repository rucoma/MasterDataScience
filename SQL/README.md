# SQL

### Diferentes gestores (SGDB):  
* Oracle  
* MS SQL Server  
* MySQL  
* PostgreSQL  
* MS Access  

### Instalación:  
`sudo dnf install wget` para instalar el gestor de descargas  
`sudo dnf insall postgresql-upgrade`  
`sudo postgresql-setup --upgrade`  
`sudo systemctl restart postgresql.service`  

### Acceso a postgres:  
`psql`

### Para solucionar problemas con roles:  
[DigitalOcen](https://www.digitalocean.com/community/tutorials/how-to-use-roles-and-manage-grant-permissions-in-postgresql-on-a-vps--2)

Entramos en psql como usuario postgres (root):  
`su - postgres`  
Le damos a un suario privilegios de superuser:  
`ALTER USER myuser WITH SUPERUSER;`  
Luego ya podemos entrar en psql de foma normal con nuestro usuario, que ya tendrá privilegios

### Algunos comandos de postgres:  
`\c` Nos conecta a una bbdd  
`\d` Muestra las tablas que componen la bbdd a la que estamos conectados  
`\d nombre_tabla` Nos devuelve las características de la tabla  
`\l` lista de bases de datos  
`\q` Salir  

### Ejecutar comandos de consola dentro de postgres:  
`\! cd ..`  
`\! pwd`  

### Cargar un .csv en una tabla:  
`\copy fb_amigos from '/home/rucoma/Descargas/my_fb_friends.csv' delimiter '^' csv header;`  

# NoSQL:  
Uno de los principales problemas de las bases de datos son los joins, ya que consumen una gran cantidad de recursos que consumen.  
Las bases NoSQL consisten en supertablas con todos los campos.  

Algunos recursos de NoSQL:  
* [Más sencillo](https://academy.datastax.com/resources/ds201-foundations-apache-cassandra)  
* [Solución completa](https://academy.datastax.com/resources/ds220-data-modeling)
