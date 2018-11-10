#!/bin/sh
#parameter expansion
CC=${CC:-gcc}
CFLAGS=${CFLAGS:-"-std=gnu99 -Wall"}
SUFIJO=${SUFIJO:-".c"}
VERBOSE=${VERBOSE:-0}
#for por lo elementos que cumplen con el sufijo
for i in $(ls *$SUFIJO 2> /dev/null)
do
  $CC $CFLAGS "$i" -o "$(basename -s $SUFIJO $i)"
  if [ $? -ne 0 ]
  then
    echo "Ocurrio un error al compilar $i"
    exit 3
  fi
  if [ $VERBOSE -ne 0 ]
  then
    echo "$CC $CFLAGS $i -o $(basename -s $SUFIJO $i)"
  fi
done
