ERROR=0

if [ "$CC" = "" ]
then
  CC="gcc"
fi

if [ "$CFLAGS" = "" ]
then
  CFLAGS="-std=gnu99 -Wall"
fi

if [ "$SUFIJOS" = "" ]
then
  SUFIJOS=".c"
fi

if [ "$VERBOSE" = "" ]
then
  VERBOSE="0"
fi

#=echo "CC is $CC"
#echo "CFLAGS is $CFLAGS"
#echo "SUFIJOS is $SUFIJOS"
#echo "VERBOSE is $VERBOSE"

a=textfile.asas.txt
#echo ${a/*./} #Este es mejor ya que agarra siempre el ultimo.

#echo "${a#*.}"

for i in $(ls -C1)
do
  echo "${i#*.}"
  if [ ".${i#*.}" = "$SUFIJOS" ] && [ $ERROR -eq 0 ]
  then
    $CC $CFLAGS ${i} -o ${i%.*}
    if [ $? -ne 0 ]
    then
      ERROR=1
      echo "Fin por error"
    fi
    if [ "$VERBOSE" != "0" ]
    then
      echo "$CC $CFLAGS ${i} -o ${i%.*}"
    fi
  fi
done
