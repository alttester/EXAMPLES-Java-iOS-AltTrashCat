#!/bin/sh
cd "../AltTrashCat Unity iOS/sampleGame"
instruments -s devices
echo -e "Enter your device's UDID:"
read DEVICE_UDID
echo "Installing a clean build of Endless Runner;"
xcodebuild clean build-for-testing -scheme Unity-iPhone -destination generic/platform=iOS
xcodebuild test-without-building -destination "platform=iOS,id=$DEVICE_UDID" -scheme Unity-iPhone

cd "../"
echo "Killing existing xcode processes;"
killall xcodebuild || true