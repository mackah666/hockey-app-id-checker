#!/bin/bash
curl  -H "Accept: application/json" \
-H "Content-Type: application/json"  \
"X-HockeyAppToken: 8366f531cb62443992cec88b92b09ea9" \
-X GET https://rink.hockeyapp.net/api/2/apps/"$1"  | python -mjson.tool
