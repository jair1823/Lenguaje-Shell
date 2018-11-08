#!/bin/sh

echo "TIMEOUT"
./taunt.sh &
sleep 10
sleep 2

echo ""
echo ""

echo "SIGTERM"
./taunt.sh &
sleep 2
kill -s 15 $!
sleep 2

echo ""
echo ""

echo "SIGHUP"
./taunt.sh &
sleep 2
kill -s 1 $!
sleep 2


#echo ""
#echo ""
#echo "SIGINT"
#./taunt.sh &
#sleep 2
#./my_test.sh $!
#sleep 2
