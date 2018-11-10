#!/bin/sh
flagA=0
flagN=10

# -a mostrar archivos
# -N n debo mostrar n archivos


#Con esta funcion se revisa el argumento que se le coloco a N
#si este es argumento es un numero, se deja pasar, de lo contrario
#se da un error y termina
revisarNumero(){
  if echo "$1" | egrep -q '^\+?[0-9]+$'; then
     flagN=$1;
  else
      echo "-N requiere un parametro entero positivo"
      exit 5;
  fi
}

#esto revisa las banderas
while getopts ":N: a" f
do
    case $f in
        a ) flagA=1;;#caso de que se escribiera -a
        N ) revisarNumero $OPTARG;; #caso de que se escribiera -N con argumento
        \? ) echo "Opcion invalida -$OPTARG" #cualquier caso que no sea -a o -N
              exit 2 ;;
        : ) echo "Opcion -$OPTARG requiere un argumento" # caso en el que -N no tiene argumento
              exit 2 ;;
    esac
done



shift $((OPTIND-1)) #esto es para que $1 sea el primer parametro y no una de las banderas


#/uso_disco.sh -a p1 p2
for i in $@
do
  if [ $flagA -eq 0 ]
  then
    du $i -h  2> /dev/null | sort -h -r| head -n $flagN
  else
    du $i -a -h  2> /dev/null | sort -h -r| head -n $flagN
  fi
done
