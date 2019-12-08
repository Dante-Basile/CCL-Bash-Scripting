#!/usr/bin/env bash
if [ $# -ne 3 ]; then
	echo "Usage: ssh-copypubkey publicKeyPath serverUsername serverIP"
	exit 1
fi
pubKeyPath=$1
serverUname=$2
serverIP=$3
#add commands to create key on client
#	use -t ed25519 for better Win compatability
#	will have to revise how var pubKeyPath is used
pubKeyText=$(cat $pubKeyPath)
	ssh "$serverUname@$serverIP" "echo $pubKeyText >> C:\Users\\$serverUname\.ssh\authorized_keys"

