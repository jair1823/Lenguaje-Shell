# Uso de disco

# a. ¿Cómo parseo los argumentos de la linea de comandos?
La banderas son identificadas con un `while getopts`y con un `case` dentro de este. El `case` identifica cada bandera, revisa que esta sea correcta y también si la bandera tiene o no el argumento necesario.
Luego de revisar las banderas se hace uso de
```shell
shift $((OPTIND-1))
```
para ignorar las banderas y comenzar a leer los directorios que pasaron por parámetros.

# b. ¿Cómo manejó el caso cuando no había argumentos?
El getopts solo se ejecuta si las banderas fueron introducidas y con : se revisa que la bandera tenga su argumento si esta lo requiere.
Y para revisar que se introdujeron directorios se usa `if [ $# -eq 0 ]` para revisar que el numero de parametros no sea 0.
# c. ¿Cómo procesó cada argumento/directorio?
Con
```shell
for i in $@
do
  #code
done
```
se recorren todos los directorios y dentro de ese `for` se usa
```shell
  du $i -h  2> /dev/null | sort -h -r| head -n $N
```
para para obtener el tamaño de todo lo que se encuentra en el directorio, ordenarlo y luego mostrar los N archivos.

# d. ¿Cómo incorporo los comandos de la linea de comandos a los comandos que utilizó para calcular los primeros N items de cada directorio?
Con uso de `|` de la siguente manera:
```shell

du $i -h  2> /dev/null | sort -h -r| head -n $N

```
Con el `|` se ejecuta lo que este a la izquierda y se le pasa por parametro a lo que se encuentra a la derecha.
Entonces, primero con `du $i -h ` se toman todos los archivos/directorios del directorio (`$!`) con su respectivo tamaño y se le pasan a `sort -h -r` que se encarga de ordenarlos y para finalizar se le pasan a `head -n $N` para que este seleccine los N elementos.

# Discuta cual fué el problema más dificil de este punto y porqué. Adicionalmente indentifique cual fue la parte del programa que consumió la mayor parte del código. ¿Le sorprende esto? ¿Porqué? / ¿Porqué no?
- Realmente el punto era sencillo, lo unico que llevo trabajo fue enteder el uso de `getopts`
- Me parece que fue `getopts`, ya que hace un `while`, un `case` y luego un `shift`.
