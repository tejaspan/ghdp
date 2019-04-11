#!/bin/bash


#variables
t_node=2
proj_name=api-project-18744604383

#gcloud authentication 
#gcloud auth login

#selecting project
#gcloud config set project api-project-18744604383


#create firewall rule


#creating instances
bash scripts/deploy.sh $t_node $proj_name


#generating ssh-keygen and adding for password-less ssh
#bash scripts/passwordless-ssh.sh
