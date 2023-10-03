#!/bin/bash
# 定义模拟器设备和系统版本
DEVICE="iPhone 15"
OS_VERSION="17.0"

# 使用 xcrun 工具启动模拟器
xcrun simctl boot "${DEVICE}" "${OS_VERSION}"

# 等待模拟器启动完成
while ! xcrun simctl launch booted safari; do
  echo $(xcrun simctl list | grep "iPhone 15")
  sleep 10
done

echo "booted"
xcrun simctl openurl booted https://google.com
