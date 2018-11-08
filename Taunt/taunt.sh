#!/bin/sh
timeOut(){
  #echo "Time Out $$";
  #fortune | cowsay -f kitty
  cowsay -f tux << EA
[insert a witty message]
EA
  exit #$
}
interrupt(){
  #echo "SIGINT $$";
  #fortune | cowsay -f head-in
  cowsay -f tux << EA
[insert a taunt]
EA
  exit #$
}
#You can't terminate with me...
#because her already did.
#:(
#bye
terminate(){ ###
  #echo "SIGTERM $$";
  cowsay -f tux <<EA
[insert taunt]
EA
  #fortune | cowsay -f tux
  exit #$
}

sighup(){ ##
  #echo "SIGHUP"
  cowsay -f tux <<EA
[insert a special message]
EA
  exit #$
}
trap interrupt 2;
trap sighup 1;
trap terminate 15;

cowsay -f tux "Hello, Human"
#echo "pid is $$"
#for i in `seq 1 10`
#do
  sleep 10 &
  wait
#  #echo $i
#done

timeOut
