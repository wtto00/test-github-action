#!/bin/bash

echo 'start to boot iPhone 15'
xcrun simctl boot "iPhone 15"

# 等待模拟器启动完成
while true; do
  status=$(xcrun simctl list | grep "iPhone 15" | awk '{print $5}')
  echo "boot status: $status"
  if [[ "$status" == "Booted" ]]; then
    break
  fi
  sleep 1
done

# 在模拟器中打开链接
xcrun simctl openurl booted https://google.com
