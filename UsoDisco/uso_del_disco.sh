#!/bin/sh
a=0;
N=10;
revisarNumero(){
  es_numero='[0-9]'
  if ! [[ $1 =~ $es_numero ]] ; then
     echo "-N debe tener valor numerico";
     exit 3;
  fi
}
while getopts ":N: a" flag
do
    case $flag in
        a ) a=1;;
        N ) N=$OPTARG
            revisarNumero $N;;
        \? ) echo "Opcion invalida -$OPTARG"
              exit 2 ;;
        : ) echo "Opcion -$OPTARG requiere un argumento"
              exit 2 ;;
    esac
done
shift $((OPTIND-1))

if [ $# -eq 0 ]
then
  echo "Falta el o los directorios"
  exit 4;
fi

for i in $@
do
    echo $i;
    if [ $a -eq 0 ]
    then
      du $i -h  2> /dev/null | sort -h -r| head -n $N
    else
      du $i -a -h  2> /dev/null | sort -h -r| head -n $N
    fi
    echo ""
done
exit 1;
