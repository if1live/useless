#!/bin/bash

if [ -z "$1" ] || [ "1" == "$1" ]; then
	echo 1
else
	next=$(( $1 - 1 ))
	prev=$(./factorial.sh $next)
	echo $(( $prev * $1 ))
fi

# $ ./factorial.sh 1
# 1
# $ ./factorial.sh 2
# 2
# $ ./factorial.sh 3
# 6
# $ ./factorial.sh 4
# 24
# $ ./factorial.sh 5
# 120
# $ ./factorial.sh 6
# 720

