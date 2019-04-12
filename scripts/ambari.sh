#!/bin/bash

gcloud compute ssh root@instance-1 -- "init 6"
echo "waiting to reboot for instance-1"
sleep 2m

#installing java
gcloud compute ssh root@instance-1 -- "yum -y install java-1.8.0-openjdk"

#installing repo for ambari
#yum-config-manager --add-repo http://public-repo-1.hortonworks.com/HDP/centos6/2.x/updates/2.6.3.0/hdp.repo
#yum-config-manager --add-repo http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.6.0.0/ambari.repo

gcloud compute ssh root@instance-1 -- "cd /etc/yum.repos.d/ && wget http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.6.2.2/ambari.repo"
gcloud compute ssh root@instance-2 -- "cd /etc/yum.repos.d/ && wget http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.6.2.2/ambari.repo"
gcloud compute ssh root@instance-3 -- "cd /etc/yum.repos.d/ && wget http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.6.2.2/ambari.repo"

#installing ambari & ambari agent
gcloud compute ssh root@instance-1 -- "yum -y install ambari-server ambari-agent"
gcloud compute ssh root@instance-2 -- "yum -y install ambari-agent"
gcloud compute ssh root@instance-3 -- "yum -y install ambari-agent"

#setting up ambari
gcloud compute ssh root@instance-1 -- "ambari-server setup -s"
gcloud compute ssh root@instance-1 -- "a=`hostname -f`|sed -i "s/localhost/$a/" /etc/ambari-agent/conf/ambari-agent.ini"
gcloud compute ssh root@instance-2 -- "a=`hostname -f`|sed -i "s/localhost/$a/" /etc/ambari-agent/conf/ambari-agent.ini"
gcloud compute ssh root@instance-3 -- "a=`hostname -f`|sed -i "s/localhost/$a/" /etc/ambari-agent/conf/ambari-agent.ini"

#starting ambari
gcloud compute ssh root@instance-1 -- "ambari-server start && ambari-agent start"
gcloud compute ssh root@instance-2 -- "ambari-agent start"
gcloud compute ssh root@instance-3 -- "ambari-agent start"

