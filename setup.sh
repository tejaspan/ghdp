#!/bin/bash

#variables

#log function
#source scripts/write_log.sh

#taking user input
echo "--------------------------------------------------"
echo "Welcome to Hortonworks auto deploy on Google Cloud"
echo -e "--------------------------------------------------\n"
read -p "Total number of node:" t_node
read -p "Project Name: " proj_name


#getting confirmation
echo -e "\nPlease verify..."
echo -e "Number of node: $t_node"
echo -e "Project Name: $proj_name"
read -r -p "do you want to continue? [y/N] " response

#INFO "No of node: $t_node, Project Name: $proj_name, response: $response"
#initializing functions

#checking user input
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
	#gcloud authentication 
	#gcloud auth login

	#selecting project
	#gcloud config set project api-project-18744604383


	#creating instances
	bash scripts/deploy.sh $t_node $proj_name

	#manually adding entries in hosts file for now
	echo "Please add below entries in hosts files for all nodes. This step has to be manual for now, i'm trying to make it automate."
	gcloud compute instances list|awk '{print $4" "$1".""c.api-project-18744604383.internal" " " $1}'
	read -p "Please enter 'Y' and press enter to continue settting up Ambari and Ambari-agents on all nodes." r
	if [[ "$r" =~ ^([yY][eE][sS]|[yY])+$ ]]
	then

		#generating ssh-keygen and adding for password-less ssh
#		INFO "setup_instance_1 initiated."
		bash scripts/setup_instance_1.sh
		#setting passworless-ssh
#		INFO "passwordless-ssh.sh initiated."
		bash scripts/passwordless-ssh.sh $t_node

		#installing ambari and ambari agent
#		INFO "ambari.sh initiated."
#		bash scripts/ambari.sh $t_node
	fi
fi
