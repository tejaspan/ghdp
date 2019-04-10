for ((i=1;i<=5;i++))
do
	echo "Deleting instance-$i"
	gcloud compute instances delete instance-$i -q --zone "us-central1-c"
done

