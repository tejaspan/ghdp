#!/bin/bash
gcloud compute instances list|awk '{print $4" "$1".""c.api-project-18744604383.internal" " " $1}'|sed 1d
