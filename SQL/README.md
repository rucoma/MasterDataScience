# SQL

### Diferentes gestores (SGDB):  
* Oracle  
* MS SQL Server  
* MySQL  
* PostgreSQL  
* MS Access  

### Instalación:  
`sudo dnf install wget` para instalar el gestor de dscargas  
`sudo dnf insall postgresql-upgrade`  
`sudo postgresql-setup --upgrade`  
`sudo systemctl restart postgresql.service`  

### Acceso a postgres:  
`psql`

### Para solucionar problemas con roles:  
[https://www.digitalocean.com/community/tutorials/how-to-use-roles-and-manage-grant-permissions-in-postgresql-on-a-vps--2]

### Algunos comandos de postgres:  
`\c`  
`\d`  
`\l`  
`\q`  

### Ejecutar comandos de consola dentro de postgres:  
`\! cd ..`  
`\! pwd`  

### Cargar un .csv en una tabla:  
`\copy fb_amigos from '/home/rucoma/Descargas/my_fb_friends.csv' delimiter '^' csv header;`  
