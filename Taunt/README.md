# Taunt

El script taunt.sh script, no toma argumentos. Cuando es ejecutado debe emitir un mensaje utilizando cowsay.

# a. ¿Cómo manejó las distintas señales?

Con ayuda de un `trap` y con dos parámetros `trap foo signals`, donde `foo` es la función que se tiene que hacer con respeto a las `signals` que reciba.
Por ejemplo:
```shell
trap "echo 'signal sighup'" 1;
```
La linea anterio imprimira `'signal sighup'` si recibe la señal SIGHUP.

# b. ¿Cómo le pasó los mensajes cowsay?

Los mensajes son pasados utilizado here document de la siguente forma:
```shell
cowsay -f tux <<EA
  [insert taunt]
EA
```
Esta estructura indica que va a recibir cowsay va a recibir texto hasta encontrar un EA en el script.

# c. ¿Cómo manejó timeout?

Con un unico sleep de la forma:
```shell
sleep 10 &
wait
```
Con esto consigo hacer un sleep en un proceso y continuar capturando señales, cuando una señal es capturada utilizo `exit #$` para detener el script.
Si no se recibe niguna de la señales el `sleep` terminaria sin problemas y continuaria con el resto del codigo.

# Compare el escribir shell scripts con el escribir programas en C.
- ¿Cuál es más facil?
  - Shell scripts, por la simplicidad del codigo.
- ¿Cuál prefiere?
  - C por estar más acostumbrado a su uso, sin embargo shell me parecio muy divertido e interesante.
- ¿Cuando es que usaría una en vez del otro?
  - Cuando se necesiten automatizar procesos del sistema operativo sin duda Shell, ya que me facilita esa comunicación con el sistema.
