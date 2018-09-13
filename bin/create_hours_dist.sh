#!/bin/bash

dir=$1

cat $dir/*/failed_login_data.txt | awk '{ print $3 }' | sort | uniq -c | awk '{ print "data.addRow([\x27" $2 "\x27, " $1 "]);"}' > $dir/hours_dist.txt

bin/wrap_contents.sh $dir/hours_dist.txt "html_components/hours_dist" $dir/hours_dist.html
