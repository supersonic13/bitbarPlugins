#!/bin/bash

CONTENT=$(curl -Ls http://developerexcuses.com | grep "text-decoration" | sed 's/<\/*[^>]*>//g')

echo "Excuse #$RANDOM:$CONTENT"
echo "---"
echo "Refresh... | refresh=true"
