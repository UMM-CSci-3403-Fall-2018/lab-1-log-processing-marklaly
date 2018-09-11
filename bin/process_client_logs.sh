#!/bin/bash

dir=$1

cd $dir/var/log

cat * | awk '/Failed password for invalid user/ { print $1, $2, $3, $11, $13 } /Failed password for/ && !/Failed password for invalid user/ { print $1, $2, $3, $9, $11 }' | sed 's/:[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]]//g' > $dir/failed_login_data.txt 

