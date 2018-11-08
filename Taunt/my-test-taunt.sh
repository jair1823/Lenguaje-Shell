#!/bin/sh
#My test taunt :)
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
