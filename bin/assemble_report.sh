#!/bin/bash

dir=$1

cat $dir/*_dist.html > $dir/distfiles.txt

bin/wrap_contents.sh $dir/distfiles.txt "html_components/summary_plots" $dir/failed_login_summary.html
