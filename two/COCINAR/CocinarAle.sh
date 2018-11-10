#!/bin/sh
CC=${CC:-gcc}
SUFIJOS=${SUFIJOS:-.c}
CFLAGS=${CFLAGS:-"-std=gnu99 -Wall"}
VERBOSE=${VERBOSE:-0}

for i in $(find -name "*$SUFIJOS")
do
  $CC $CFLAGS $i -o $(basename -s $SUFIJOS $i)

  if [ $? -ne 0  ]
  then
    echo "Error al compilar $i"
    exit 1
  fi

  if [ $VERBOSE -ne 0 ]
  then
    echo "$CC $CFLAGS $i -o $(basename -s $SUFIJOS $i)"
  fi

done
