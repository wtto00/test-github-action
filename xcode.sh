#!/bin/bash

xcrun simctl list

xcrun simctl boot "$IPHONE_MODEL"

# 等待模拟器启动完成
while true; do
  status=$(xcrun simctl list | grep "Phone: iPhone 15 (" | awk '{print $4}')
  echo "boot status: $status"
  if [[ "$status" == "(Booted)" ]]; then
    break
  fi
  sleep 1
done

# 在模拟器中打开链接
xcrun simctl openurl booted https://google.com
