#!/bin/bash

source /Users/arun/.oath_profile

OATH_VAL=$(/usr/local/bin/oathtool --totp -b $OATH_KEY)

if [ "$1" = "copy" ]; then
  # Copy the IP to clipboard
  echo -n "$OATH_VAL" | pbcopy
fi

POST_RESPONSE=""

if [ "$1" = "postReq" ]; then
  curl -H "Content-Type: application/json" -X POST -d '{"accountId": "'$OATH_USER'","otp": "'$OATH_VAL'"}' https://access.tools.btcsp.co.uk/request
fi

echo "GAuth"
echo "---"
echo "$OATH_VAL"
echo "Copy KEY | terminal=false bash='$0' param1=copy"
echo "---"
echo "Send request | terminal=false bash='$0' param1=postReq"
echo "---"
echo "Refresh... | refresh=true"
