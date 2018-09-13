#!/bin/bash

dir=$1

cat $dir/*/failed_login_data.txt | awk '{ print $5 }' | sort | join - "etc/country_IP_map.txt" | awk '{ print $2 }' | sort | uniq -c | awk '{ print "data.addRow([\x27" $2 "\x27, " $1 "]);"}' > $dir/country_dist.txt

bin/wrap_contents.sh $dir/country_dist.txt "html_components/country_dist" $dir/country_dist.html
