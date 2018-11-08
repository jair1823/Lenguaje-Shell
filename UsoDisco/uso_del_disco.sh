#!/bin/sh
a=0;
N=10;

revisarNumero(){
  if echo "$1" | egrep -q '^\+?[0-9]+$'; then
     N=$1;
  else
      echo "-N requiere un parametro entero positivo"
      exit 5;
  fi
}

#Lectura de banderas
while getopts ":N: a" flag
do
    case $flag in
        a ) a=1;;
        N ) revisarNumero $OPTARG;;
        \? ) echo "Opcion invalida -$OPTARG"
              exit 2 ;;
        : ) echo "Opcion -$OPTARG requiere un argumento"
              exit 2 ;;
    esac
done
shift $((OPTIND-1))

#revision de parametros
if [ $# -eq 0 ] then
  echo "Falta el o los directorios"
  exit 4;
fi

#proceso de recorrer todos los parametros
#e imprimir la lista de los mayores archivos
for i in $@
do
    cd $i 2> /dev/null
    if [ $? -ne 0 ] then
      echo $i " no es un directorio valido"
      echo ""
    else
        echo $i;
        if [ $a -eq 0 ] then
          du $i -h  2> /dev/null | sort -h -r| head -n $N
        else
          du $i -a -h  2> /dev/null | sort -h -r| head -n $N
        fi
        echo ""
    fi
done
exit 1;
