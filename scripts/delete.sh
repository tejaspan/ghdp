#!/bin/bash
#source write_log.sh

for ((i=1;i<=$1;i++))
do
	echo "Deleting instance-$i"
	gcloud compute instances delete instance-$i -q --zone "us-central1-c"
#	INFO "instance-$i deleted."
done

