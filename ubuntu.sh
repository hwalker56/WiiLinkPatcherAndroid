#!/bin/bash

DIRECTORY=/storage/emulated/0/WiiLink
DOWNLOAD_URL=$(curl -L -s https://api.github.com/repos/hwalker56/WiiLinkPatcherAndroid/releases/latest | grep -o -E "https://(.*)WiiLinkPatcher_Termux-ARM64(.*)" | sed 's/\"//g')

apt update
apt install libicu-dev -y

echo "Downloading patcher..."
curl $DOWNLOAD_URL -L -s -o WLP
chmod +x WLP

if [ -d "WiiLink/WAD" ]; then
  echo "Clearing up previous WADs..."
  rm -r WAD
fi
if [ -d "WiiLink/apps" ]; then
  echo "Clearing up previous apps..."
  rm -r apps
fi
if [ -d "$DIRECTORY" ]; then
  echo "Clearing up previous WiiLink folder..."
  rm -r $DIRECTORY
fi

DOTNET_GCHeapHardLimit=1C0000000 ./WLP

if [ ! -d "WiiLink/WAD" ] && [ ! -d "WiiLink/apps" ]; then
  echo "There are no files to copy!"
else
  mkdir $DIRECTORY
  echo Copying patched WADs...
  cp -r WiiLink/WAD/ $DIRECTORY/WAD
  echo Copying apps...
  cp -r WiiLink/apps/ $DIRECTORY/apps
  echo 'Done!'
  echo "You can find the 'WAD' and 'apps' folders in the WiiLink folder on your device's internal storage."
  echo ""
  echo "Refer to https://wiilink.ca/guide/install to continue with your installation."
fi
