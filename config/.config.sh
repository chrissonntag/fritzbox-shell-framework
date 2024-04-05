#!/usr/bin/env bash
# Reference: https://avm.de/fileadmin/user_upload/Global/Service/Schnittstellen/AVM_Technical_Note_-_Session_ID.pdf

declare -xr FRITZBOX_HOST="${FRITZBOX_HOST:-fritz.box}"
declare -xr FRITZBOX_USERNAME="${FRITZBOX_USERNAME:-}"
declare -xr FRITZBOX_PASSWORD="${FRITZBOX_PASSWORD:-}"
declare -xr FRITBOX_LOGIN_PATH="/login_sid.lua"
declare -xr BASE_DIR=$(dirname "$0")/../

if [ -z "$FRITZBOX_USERNAME" ]; then
  echo "Please set the environment variable FRITZBOX_USERNAME"
  exit 1
fi

if [ -z "$FRITZBOX_PASSWORD" ]; then
  echo "Please set the environment variable FRITZBOX_PASSWORD"
  exit 1
fi
