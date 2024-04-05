#!/usr/bin/env bash
# Logging in to the Fritz!Box means to get a session ID (SID)

# Get the challenge
readonly CHALLENGE=$(curl -s -k "${FRITZBOX_HOST}${FRITBOX_LOGIN_PATH}" | grep -Po '(?<=<Challenge>).*(?=</Challenge>)')
# Calculate the MD5 hash of the challenge and the plaintext password
readonly MD5=$(echo -n ${CHALLENGE}"-"${FRITZBOX_PASSWORD} | iconv -f ISO8859-1 -t UTF-16LE | md5sum -b | awk '{print substr($0,1,32)}') 
# The response is the challenge and the MD5 hash separated by a hyphen
readonly RESPONSE=${CHALLENGE}"-"${MD5}
# Get the SID
readonly SID=$(curl -i -s -k -d "response=${RESPONSE}&username=${FRITZBOX_USERNAME}" "${FRITZBOX_HOST}" | grep -Po -m 1 '(?<=\"sid\"\:\")[a-f\d]+')
