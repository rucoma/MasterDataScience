# Main commands for shell

`cd`
`cp`
`cat`
(...)

### Very useful csvkits
Installed from pip

### Some resources for shell scripts:
* [http://linuxcommand.org/lc3_wss0010.php]
* [TutorialsPoint](https://www.tutorialspoint.com/awk/awk_workflow.htm)
* [IBM](https://www.ibm.com/developerworks/library/l-awk1/index.html)

### Sustituir en un fichero desde shell
Sustituir ', ' por ',':
`sed 's/, /,/g'`

### Instalar consola en Windows
Cygwin

### htop
Equivalente al monitor del sistema, pero más detallado.

### Configurar shell zsh
Si queremos convertir a Zsh en nuestra shell principal lo haremos mediante la siguiente orden:
`$ chsh -s /bin/zsh`

Editar el fichero .zshrc:
* Cambiar el tema:
  ZSH_THEME="agnoster"
*

### Libros:
* [Data science from the command line](https://www.datascienceatthecommandline.com/)

### Configure AWS insrtances:
* [Tutorial AWS](https://aws.amazon.com/es/getting-started/tutorials/launch-a-virtual-machine/?sc_channel=em&sc_campaign=global_F90D_DF_F7D_E1_GetStarted_2017.F90D_F7D_E1_GetStarted_2017&sc_publisher=aws&sc_medium=em_50315&sc_content=f90d_f90d_ot&sc_country=ES&sc_geo=&sc_category=mult&sc_outcome=f90d&trk=em_50315&mkt_tok=eyJpIjoiTTJGaVlXVXdORFE0TTJKaiIsInQiOiJkVlM1d2M1QnJyd2EzRTQzK2c0WXBKQnYzZlliU2tmZUlpZEZcL0VBV0Q3dFgxYXVuZVNkYTRJeWpIUFRVUHE0UUZpVEVlQzBWV3MzYjVDNktidStyeVZUb25iZU0wb1ppMkJubUgrN0tOeFFSd09TR0pNVFlZWkU4cEw1UFdmZG8ifQ%3D%3D)
* SSH: With Git bash `ssh -i 'c:\Users\sunombreusuario\.ssh\MyKeyPair.pem' ec2-user@{dirección_IP} ` o `ssh -i "UbuntuKeyPair.pem" ubuntu@ec2-50-112-24-13.us-west-2.compute.amazonaws.com  `
