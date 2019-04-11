#generating ssh-key & importing for all machine

#echo "connecting Instance-1"
#gcloud compute ssh panchaltn@instance-1


:gcloud compute ssh panchaltn@instance-1 -- "echo never > /sys/kernel/mm/transparent_hugepage/enabled"

