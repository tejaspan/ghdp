#!/bin/bash
#creating instances

for ((i=1;i<=$1;i++))
do
	gcloud compute ssh root@instance-1 -- "sshpass -p 'root' ssh-copy-id -i .ssh/id_rsa.pub root@instance-$i"
done
