#!/bin/sh
timeOut(){
  cowsay -f tux << EA
[insert a witty message]
EA
  exit #$
}
#sigint
sigint(){
  cowsay -f head-in << EA
[insert a taunt]
EA
  exit #$
}
#sigterm
sigterm(){
  cowsay -f head-in <<EA
[insert taunt]
EA
  exit #$
}
#sighup
sighup(){
  cowsay -f tux <<EA
[insert a special message]
EA
  exit #$
}
#atrapar las banderas
trap sighup 1;
trap sigint 2;
trap sigterm 15;
#cowsay inicial :)
cowsay -f tux "Hello, Human"
#espera de 10 segundos
sleep 10 &
wait
#caso de no obtener niguna signal
timeOut
