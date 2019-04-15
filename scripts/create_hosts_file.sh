#!/bin/bash
gcloud compute instances list|awk '{print $4" "$1".""c.api-project-18744604383.internal" " " $1}'|sed 1d >/tmp/hosts

gcloud compute instances list|awk '{print $4" "$1".""c.api-project-18744604383.internal" " " $1}'
#for ((i=1;i<=$1;i++))
#do
#	sed '/instance-$i/d' /tmp/hosts
#done
