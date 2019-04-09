#!/bin/bash
#creating instances

for ((i=1;i<=$1;i++))
do
        echo "Creating VM instance-$i"
        gcloud compute --project=$2 instances create instance-$i --zone=us-central1-c --machine-type=n1-standard-4 --subnet=default --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=18744604383-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=cloudera-hadoop-web-ui,http-server,https-server --image=rhel-6-v20190326 --image-project=rhel-cloud --boot-disk-size=10GB --boot-disk-type=pd-ssd --boot-disk-device-name=instance-$i
done
