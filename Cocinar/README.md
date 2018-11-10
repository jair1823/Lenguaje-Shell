# Cocinar
Crear un script del shell, bake.sh, que automáticamente compila a ejecutable todos los archivos fuente que se encuentran en un subdirectorio.

# a) ¿Cómo manejó asignar valores default a las variables?
Con parameter expansion usando `CC=${CC:-"gcc"}`, donde si CC no ha sido declarada, se le asigna gcc, de esta misma forma se tratan todas las demas.

# b) ¿Cómo iteró por todos los archivos que hacian match con SUFIJOS?
- Para iterar por todos los archivos use for i in `$(find -name "*$SUFIJOS")`, donde `$(find -name "\*$SUFIJOS")` son todos los archivos que hacen match con SUFIJOS y i va tomado el valor de cada uno de estos, para tratar de se compilado.

# c) ¿Cómo manejó la variable VERBOSE.?
- Igual que *CC*, *CFLAGS*, *SUFIJOS*, dandole un valor por defecto si no es introducida.
Luego dentro del for que recorre los archivos que hacen match con SUFIJOS, se utiliza un `if` para comprobar que no tenga el valor por defecto.

# d) ¿Cómo hizo para terminar rápido una vez que la compilación fallaba?
- Justo despues de hacer la ejecucion de la linea donde se compila, utilizo un `if [ $? -ne 0 ]`, ya que `$?`, tiene el resultado de lo que se acaba de ejecutar, en el caso de que ese resultado sea 0 significa que la ejecucion fue exitosa. Entonces se hace un if para saber si hubo fallo(`$?` no es cero) si es que hay algún fallo se hace un `exit`, para terminar la ejecución.

# 2. Compara utilizar cocine.sh con make.
- La principal diferencia entre cocine.sh y make es que en make se debe indicar que archivos deben ser complidados.
- Otra diferencia es la forma de trabajar del make, este revisa los archivos antes de compilar algo que no es necesario compilar de nuevo.

# 3. ¿Cuáles son las ventajas y desventajas de ambos métodos de compilación automática?
- La ventaja del cocine.sh es la capacidad de compilar todo sin importar cuantos archivos se esten, siempre y cuando su compilación sea exitosa, el make por otro lado requiere un poco más de indicaciones para dar un resultado correcto.
- Una desventaja del cocine.sh es que a diferencia del make, no cuenta con esa capacidad de revisar que archivos ya fueron compilados y no han sufrido cambios en su codigo, es decir que el make no va a compilar algo si este ya fue compilado y no ha sido cambiado, pero el cocine si lo compilaría de nuevo.

# 4 .¿Qué utilizará en el futuro?
- El make, me agrada la característica de revisar lo que es y no necesario compilar.
