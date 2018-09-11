#!/bin/bash

dir=$1

cat $dir/*/failed_login_data.txt | awk '{ print $4 }' | sort | uniq -c | awk '{ print "data.addRow([\x27" $2 "\x27, " $1 "]);"}' > $dir/username_dist.txt

bin/wrap_contents.sh $dir/username_dist.txt "html_components/username_dist" $dir/username_dist.html
