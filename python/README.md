# Python  
## Instalación de Anaconda:
[Anaconda](https://www.anaconda.com/downloads)  

## Creación de un entorno virtual
Hay que poner el path correctamente (esto es una movida que hay que revisar):  
`vim ~/.bashrc`  
`vim ~/.zshrc`  
`source ~/.zshrc`  

Dentro de una carpeta:  
`conda create -n kschool python=3.6 ipython jupyter`  
Para activar el entorno `source activate kschool`  
Para desactivarlo `source deactivate kschool`  
(Bajo Windows no es necesario el `source`)  

`conda list` Para ver el listado de paquetes instalados  
`conda env export > environment.yml` Para exportar el entorno virtual a otra máquina.  
Se envía el fichero a la otra máquina: `conda env create -f environment.yml`  
Instalar nuevas librerías: `conda install matplotlib`  
