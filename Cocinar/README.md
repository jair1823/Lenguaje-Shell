# Cocinar
Crear un script del shell, bake.sh, que automáticamente compila a ejecutable todos los archivos fuente que se encuentran en un subdirectorio.

# ¿Cómo manejó asignar valores default a las variables?
Con ayuda de un IF, preguntado si la variable era igual a "" lo que significa que no fue asignada, entonces se debe proceder a asignar el valor por defecto que se pedia.

# ¿Cómo iteró por todos los archivos que hacian match con SUFIJOS?
Para iterar por todos los archivos use for i in $(find -name "\*$SUFIJOS"), donde $(find -name "\*$SUFIJOS") son todos los archivos que hacen match
con SUFIJOS y i va tomado el valor de cada uno de estos, para tratar de se compilado.

# ¿Cómo manejó la variable VERBOSE.?
Igual que CC, CFLAGS, SUFIJOS, dandole un valor por defecto si no es introducida.
Luego dentro del for que recorre los archivos que hacen match con SUFIJOS, se utiliza un if para comprobar que no tenga el valor por defecto, es decir que tenga cualquier cosa diferente a ''.

# ¿Cómo hizo para terminar rápido una vez que la compilación fallaba?
Justo despues de hacer la ejecucion de la linea donde se compila, utilizo un if [ $? -ne 0 ], ya que $?, tiene el resultado de lo que se acaba de ejecutar, en el caso de que ese resultado sea 0 significa que la ejecucion fue exitosa. Entonces se hace un if para saber si hubo fallo($? no es cero) si es que hay algun fallo se hace un exit, para terminar la ejecucion.

#Falta punto 2
