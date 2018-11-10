#!/bin/sh
A=0;
N=10;
#Lectura de banderas
while getopts ":N: a" flag
do
    case $flag in
        a ) a=1;;
        N )
              if echo "$OPTARG" | egrep -q '^\+?[0-9]+$';
              then
                 N=$OPTARG;
              else
                  echo "-N requiere un parametro entero positivo"; exit 5;
              fi
              ;;
        \? ) echo "Opcion invalida -$OPTARG"; exit 2;;
        : ) echo "Opcion -$OPTARG requiere un argumento"; exit 2;;
    esac
done
shift $((OPTIND-1))
#revision de parametros
if [ $# -eq 0 ]
then
  echo "Faltan directorio"; exit 4;
fi
#proceso de recorrer todos los parametros e imprimir la lista de los mayores archivos
for i in $@
do
    cd $i 2> /dev/null
    if [ $? -ne 0 ]
    then
      echo $i " no es un directorio valido"
      echo ""
    else
        echo $i;
        if [ $A -eq 0 ]
        then
          du $i -h  2> /dev/null | sort -h -r| head -n $N
        else
          du $i -a -h  2> /dev/null | sort -h -r| head -n $N
        fi
        echo ""
    fi
done
