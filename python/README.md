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
Para activar el entorno `source activate kschool` (Hay que activarlo siempre)  
Para desactivarlo `source deactivate kschool`  
(Bajo Windows no es necesario el `source`)  
Para desactivar un environment: `source deactivate env kschool`  
`conda list` Para ver el listado de paquetes instalados  
`conda env export > environment.yml` Para exportar el entorno virtual a otra máquina.  
Se envía el fichero a la otra máquina: `conda env create -f environment.yml`  
Para borrar el environment: `conda remove --name kschool --all`  
Para crear uno nuevo si tenemos el fichero: `conda env create -f environment.yml`  

## Profiling  
pip install line-profiler
conda install memory_profiler (para profiling de memoria)
## Debugging  
pip install ipdb  
kernprof --line-by-line ejemplo_profiling.py  
python -m line_profiler ejemplo_profiling.py.lprof  

Instalar nuevas librerías: `conda install matplotlib`  
Si la librería no está en conda podemos instalar la librería mediante pip  

La librería para leer ficheros Excel es xlrd  

## Decoradores  
Permiten ejecutar código antes y después de una llamada a una función. Se usa el símbolo `@nombre_funcion`  

## Formato fichero HDF5  

Algebra lineal:  
Youtube [3Blue1Brown](https://www.youtube.com/channel/UCYO_jab_esuFRV4b17AJtAw)  

Ejercicios resueltos de python:  
(https://www.w3resource.com/python-exercises/)
