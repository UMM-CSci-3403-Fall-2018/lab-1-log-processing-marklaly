#!/bin/bash

dir=$1

cd $dir/var/log
cat * | awk '{ print $1, $2, $3, $4, $13}' | sed 's/:[[:digit:]][[:digit:]]:[[:digit:]][[:digit:]]//g' > failed_login_data.txt
