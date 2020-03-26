#!/bin/bash

TOKEN="YOUR_TOKEN"
ID="YOUR_CHAT_ID"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"
SSH=`echo $SSH_CLIENT | awk '{ print $1}'`
IP=`w -h | awk '{print""$3}'`

if [ "$PAM_TYPE" != "open_session" ]
then
	exit 0
else
	curl -s -X POST $URL -d chat_id=$ID -d text="$(echo -e "Host: `hostname`\nUser: $PAM_USER\nHost: $PAM_RHOST")" > /dev/null 2>&1
	exit 0
fi
