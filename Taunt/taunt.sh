#git log -1 | cowsay -f dragon-and-cow | lolcat

#!/bin/bash

text=caca
echo -n "Enter some text > "
echo ""
read -t 10 text
if [ "$text" = "" ]
then
  fortune | cowsay -f kitty
else
  cowsay -f kitty $text
fi