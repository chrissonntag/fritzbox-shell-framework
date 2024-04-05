#!/usr/bin/env bash
# This script will get the tickets from the fritzbox

# Load the configuration
source $(dirname "$0")/../config/.config.sh
# Load the page content of the access profile
source ${BASE_DIR}/pages/page_access_profile.sh

# Extract the ticket IDs from the tickets
readonly IDS=$(echo "$PAGE_ACCESS_PROFILE" | grep -o 'id="Ticket-[0-9]\+"' | awk -F'-' '{print $2}' | awk -F'"' '{print $1}')
echo $IDS
