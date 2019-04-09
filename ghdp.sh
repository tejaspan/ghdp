#!/bin/bash


#variables
t_node=3
proj_name=api-project-18744604383

#gcloud authentication 
#gcloud auth login

#selecting project
#gcloud config set project api-project-18744604383


#create firewall rule


#creating instances
bash deploy.sh $t_node $proj_name

