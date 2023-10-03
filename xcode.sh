#!/bin/bash

open -a Simulator

xcrun simctl list

xcrun simctl boot "$IPHONE_MODEL"

echo 'wait for booted'
while true; do
  status=$(xcrun simctl list | grep "Phone:" | grep "$IPHONE_MODEL" | awk '{print $5}')
  echo $(xcrun simctl list | grep "Phone:" | grep "$IPHONE_MODEL")
  echo "status: $status"
  if [[ "$status" == "(Booted)" ]]; then
    break
  fi
  sleep 1
done

echo 'openurl'
xcrun simctl openurl booted https://google.com
