### Comandos par instalar Spark en Linux:
* Actualizar sistema
`sudo apt-get update`
`pip install --upgrade pip`
* Instalar git si no teníamos
`sudo apt-get install git`
* Instalar Máquina java.
`sudo apt-get install default-jdk`
* Instalar scala
`sudo apt-get install scala`
* [Descargar última versión de spark](https://spark.apache.org/downloads.html)
`tar xvf spark-2.3.0-bin-hadoop2.7.tgz`
`cd spark-2.0.2-bin-hadoop2.7.tgz`
`cd bin`
* Creamos un enlace dentro de usr/local que apunte a la carpeta de spark
`ln -s ~/Dropbox/spark-2.3.0-bin-hadoop2.7 /usr/local/spark`
* Añadimos dentro de .bashrc o .zshrc. los siguientes comandos:
`export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS=notebook
export PATH=/usr/local/spark/bin:$PATH
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre`
* ejecutar bashrc desde la $home para que se recargue
`source .bashrc`
* otra manera es ejecutar desde la $home . .bashrc
* para ver si funciona y arrancar el JUPYTER CON SPARK ejecutar
`pyspark`
* Creamos un nuevo notebook en introducimos instrucción
`sc`
* Si nos muestra la versión de spark es que todo ha ido bien.

### [Instalar Spark en Windows](http://changhsinlee.com/install-pyspark-windows-jupyter/)
