# TWRP device tree for nubia NX809J

## Supported devices

- REDMAGIC 11 pro +

## Build

```shell
mkdir twrp && cd twrp

repo init --depth=1 -u https://github.com/TWRP-Test/platform_manifest_twrp_aosp.git -b twrp-16.0

repo sync

git clone --depth=1  https://github.com/ruoqing501/twrp1 device/nubia/NX809J

source build/envsetup.sh

export ALLOW_MISSING_DEPENDENCIES=true

lunch twrp_NX809J

make recoveryimage
```

If there is no error, recovery.img will be found in `out/target/product/NX809J/recovery.img`

## Features

Works:

- [x] ADB
- [ ] Display
- [ ] Decryption
- [ ] Fastbootd
- [ ] Flashing
- [X] OTA Flash
- [ ] MTP
- [ ] Sideload
- [ ] Touch
- [ ] USB OTG
- [ ] Vibrator

## To use it:

```shell
fastboot flash recovery_a recovery.img
```
