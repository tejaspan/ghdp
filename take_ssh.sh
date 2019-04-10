#generating ssh-key & importing for all machine

#echo "connecting Instance-1"
#gcloud compute ssh root@instance-1


#password-less ssh
gcloud compute ssh root@instance-1 -- 'service iptables stop'
gcloud compute ssh root@instance-1 -- 'file=/etc/ssh/sshd_config'
gcloud compute ssh root@instance-1 -- "cp -p $file $file.old && awk ' $1=="PermitRootLogin" {$2="yes"} $1=="PasswordAuthentication" {$2="yes"} $1=="#PubkeyAuthentication" {$1="PubkeyAuthentication"} {print} ' $file.old > $file"
gcloud compute ssh root@instance-1 -- 'service sshd restart'
gcloud compute ssh root@instance-1 -- "sed -i '/SELINUX/ s/enforcing/disabled/' /etc/sysconfig/selinux"
#gcloud compute ssh root@instance-1 -- "echo never > /sys/kernel/mm/transparent_hugepage/enabled"

