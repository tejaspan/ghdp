#!/bin/bash


#variables
t_node=3
proj_name=api-project-18744604383

#gcloud authentication 
#gcloud auth login

#selecting project
#gcloud config set project api-project-18744604383


#creating instances
bash scripts/deploy.sh $t_node $proj_name


#generating ssh-keygen and adding for password-less ssh
bash scripts/setup_instance_1.sh

#setting passworless-ssh
bash scripts/passwordless-ssh.sh

#installing ambari and ambari agent
bash scripts/ambari.sh
