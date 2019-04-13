#!/bin/bash


#variables

#taking user input
echo "--------------------------------------------------"
echo "Welcome to Hortonworks auto deploy on Google Cloud"
echo -e "--------------------------------------------------\n"
read -p "Total number of node:" t_node
read -p "Project Name: " proj_name

#getting confirmation
echo -e "\n\nPlease verify..."
echo -e "Number of node: $t_node"
echo -e "Project Name: $proj_name"
read -r -p "do you want to continue? [y/N] " response

#checking user input
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
	echo "said yes"
	#gcloud authentication 
	#gcloud auth login

	#selecting project
	#gcloud config set project api-project-18744604383


	#creating instances
	#bash scripts/deploy.sh $t_node $proj_name


	#generating ssh-keygen and adding for password-less ssh
	#bash scripts/setup_instance_1.sh

	#setting passworless-ssh
	#bash scripts/passwordless-ssh.sh $t_node

	#installing ambari and ambari agent
	#bash scripts/ambari.sh
fi
