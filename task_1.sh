#!/bin/bash

sites_array=("https://google.com/" "https://facebook.com" "https://x.com")

for site in "${sites_array[@]}"; do
  if curl -s -L --head --request GET "$site" | grep "HTTP/2 200"
  then
    echo "Record about $site added in website_status.log"
    echo "$site is UP" >> "website_status.log"
  else
    echo "$site is DOWN" >> "website_status.log"
  fi
done

