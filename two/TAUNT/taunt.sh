#!/bin/sh
msjEspecial(){
  cowsay << END
Este es un mensaje especial

Escrito por Jair

Con Here Documents
END
exit 1;
}
msjBurla(){
  cowsay << END
Jair es una burla

Con Here Documents
END
exit 1;
}

trap msjEspecial 1
trap msjBurla 2
trap msjBurla 15


for i in `seq 1 10`
do
  sleep 1
done

cowsay << END
Este es un mensaje gracioso

Escrito por Jair

Con Here Documents
END
