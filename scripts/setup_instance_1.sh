gcloud compute ssh root@instance-1  --zone "us-central1-c" -- "echo never > /sys/kernel/mm/transparent_hugepage/enabled"
gcloud compute ssh root@instance-1  --zone "us-central1-c" -- "ssh-keygen -f /root/.ssh/id_rsa -t rsa -N ''"
gcloud compute ssh root@instance-1  --zone "us-central1-c" -- "echo "StrictHostKeyChecking no" > .ssh/config"
gcloud compute ssh root@instance-1  --zone "us-central1-c" -- "yum install -y sshpass"
