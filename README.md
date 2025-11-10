# WiiLinkPatcherAndroid
Run the arm64 build of the WiiLink patcher through Termux on your Android device 

## DISCLAIMER - THIS IS NOT AN OFFICIAL WIILINK TOOL, THIS IS AN UNOFFICIAL SCRIPT. I AM NOT RESPONSIBLE FOR ANY DATA LOSS THAT COULD OCCUR THROUGH THE USE OF THIS TOOL.

For support with this script, join the [WiiLink Discord](https://discord.gg/wiilink), and ping me (@shmiggity_shmack) in #support-text, with a screenshot and description of your issue. Alternatively, you can send me an [email](mailto:contact@harrywalker.uk), or open an [issue on this repository](https://github.com/hwalker56/WiiLinkPatcherAndroid/issues/new).

### How it works
This project works through the Android app Termux, which allows the installation of a Linux environment. All this script does is install an Ubuntu environment, run the WiiLink patcher for arm64 linux inside of it, and copy the patched files to your phone's internal storage.

### Getting started
#### Step one
Install Termux from [F-Droid](https://f-droid.org/en/packages/com.termux/). The Google Play Store version is unstable and missing functionality, see [here](https://github.com/termux-play-store/) for more information.
#### Step two
Set your Termux repositories (I recommend choosing "Mirror Group"):
```
termux-change-repo
```
Give Termux storage permissions:
```
termux-setup-storage
```
#### Step three
Download and run the script:
```
bash <(curl -s https://raw.githubusercontent.com/hwalker56/WiiLinkPatcherAndroid/main/termux.sh)
```

After running the script, your device will ask you to give Termux storage permissions. This is needed to copy the patched wads to your device's internal storage. After granting the storage permission, the script will install an Ubuntu environment and all patcher dependencies, then run the patcher. This may take a while.

Once in the patcher, your SD card will **NOT** be detected. This behaviour is expected.
Run the patcher without choosing an SD card, and press 3 to exit it once it has patched the files. The script will then copy the files the patcher generated to the `WiiLink` folder on your device's internal storage. From there, you can either install the WADs in Dolphin, or copy them over to an SD card for use on a real Wii.
