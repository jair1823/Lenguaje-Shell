
setValues(){
  #NOERROR es la variable utilizada para detener la ejecucion si una compilacion falla
  NOERROR=1
  #Aqui se declara por defecto el valor de CC, si no es cambiado antes de entrar
  if [ "$CC" = "" ]
  then
    CC="gcc"
  fi
  #Aqui se declara por defecto el valor de CFLAGS, si no es cambiado antes de entrar
  if [ "$CFLAGS" = "" ]
  then
    CFLAGS="-std=gnu99 -Wall"
  fi
  #Aqui se declara por defecto el valor de SUFIJOS, si no es cambiado antes de entrar
  if [ "$SUFIJOS" = "" ]
  then
    SUFIJOS=".c"
  fi
  #Aqui se declara por defecto el valor de VERBOSE, si no es cambiado antes de entrar
  if [ "$VERBOSE" = "" ]
  then
    VERBOSE="0"
  fi
}
setValues

fullfile="./prueba (3rd copy).c"
filename=$(basename -- "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"

#echo "$fullfile"
#echo "$filename"
#echo "$extension"
#echo ""
#echo ""


for i in $(find -name "*$SUFIJOS")
do
  #echo "$i"
  if [ $NOERROR -eq 1 ]
  then
    $CC $CFLAGS "$i" -o "${i%.*}.log" #2> ${i%.*}.log
    if [ $? -ne 0 ]
    then
      NOERROR=0
      echo "Ocurrion un error al compilar el archivo $(basename $i)"
      #Se genero un .log con el error."
    #else
      #echo ""
      #cat ${i%.*}.log
      #echo ""
      #rm ${i%.*}.log
    fi
    if [ "$VERBOSE" != "0" ] && [ $NOERROR -eq 1 ]
    then
      echo "$CC $CFLAGS ${i} -o ${i%.*}.log"
    fi
  fi
done