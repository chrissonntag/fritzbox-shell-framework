#!/usr/bin/env bash
# This script loads the html content of the page access profile

# Load the login script which gives us the session ID
source ${BASE_DIR}/scripts/login.sh

# Get the html page with the tickets
readonly PAGE_ACCESS_PROFILE=$(curl -s -X POST -d "xhr=1&page=kidPro&sid=${SID}" "${FRITZBOX_HOST}/data.lua")
