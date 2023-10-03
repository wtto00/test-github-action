#!/bin/bash

xcrun simctl list

xcrun simctl boot "$IPHONE_MODEL"

echo 'wait for booted'
while true; do
  status=$(xcrun simctl list | grep "$IPHONE_MODEL" | awk '{print $5}')
  echo $(xcrun simctl list | grep "$IPHONE_MODEL")
  if [[ "$status" == "(Booted)" ]]; then
    break
  fi
  sleep 1
done

echo 'openurl'
xcrun simctl openurl booted https://google.com
