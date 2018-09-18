#!/bin/bash

scratchdir=`mktemp -d`

for f in $@
do
	tmpdir=`basename $f "_secure.tgz"`
	mkdir $scratchdir/$tmpdir
	tar -zxf $f -C $scratchdir/$tmpdir
	bin/process_client_logs.sh $scratchdir/$tmpdir
done

bin/create_username_dist.sh $scratchdir
bin/create_hours_dist.sh $scratchdir
bin/create_country_dist.sh $scratchdir
bin/assemble_report.sh $scratchdir

mv $scratchdir/failed_login_summary.html .
