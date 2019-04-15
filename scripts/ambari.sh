#!/bin/bash

gcloud compute ssh root@instance-1 -- "init 6"
echo "waiting to reboot for instance-1"
sleep 2m

#installing java

#installing repo for ambari
#yum-config-manager --add-repo http://public-repo-1.hortonworks.com/HDP/centos6/2.x/updates/2.6.3.0/hdp.repo
#yum-config-manager --add-repo http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.6.0.0/ambari.repo


for ((i=1;i<=$1;i++))
do
	#installing java & wget
	gcloud compute ssh root@instance-$i -- "yum -y install java-1.8.0-openjdk wget"
	#getting repository
	gcloud compute ssh root@instance-$i -- "cd /etc/yum.repos.d/ && wget http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.6.2.2/ambari.repo"
	#installing ambari & ambari agent
	gcloud compute ssh root@instance-$i -- "yum -y install ambari-agent"
	#setting up ambari
	gcloud compute ssh root@instance-$i -- "a=`hostname -f`|sed -i "s/localhost/$a/" /etc/ambari-agent/conf/ambari-agent.ini"
	#starting ambari
	gcloud compute ssh root@instance-$i -- "ambari-agent start"
done

#installing & starting ambari server on instance-1
gcloud compute ssh root@instance-1 -- "yum -y install ambari-server"
gcloud compute ssh root@instance-1 -- "ambari-server setup -s"
gcloud compute ssh root@instance-1 -- "ambari-server start"
