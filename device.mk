#
# Copyright (C) 2026 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/nubia/NX809J

# Configure base.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Configure core_64_bit_only.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Configure virtual_ab compression.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression_with_xor.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Configure twrp common.mk
$(call inherit-product, vendor/twrp/config/common.mk)

# API
BOARD_SHIPPING_API_LEVEL := 36
PRODUCT_SHIPPING_API_LEVEL := 36

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_CHECK_PREBUILT_MAX_PAGE_SIZE := false

# Required for Android 16 CrashRecovery APEX
PRODUCT_APEX_SYSTEM_SERVER_JARS += com.android.crashrecovery:service-crashrecovery

# Enable Fuse Passthrough
PRODUCT_PROPERTY_OVERRIDES += persist.sys.fuse.passthrough.enable=true

# Otacert
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(DEVICE_PATH)/security/releasekey

# Required modules
TWRP_REQUIRED_MODULES += \
    prebuilt

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# fstab — copied to both recovery root and vendor ramdisk for first-stage init
# manifest 同时拷贝为 manifest_sm8850.xml，消除 Keymaster_Ver 按 ro.board.platform 找文件时的 "not found" 噪音
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/recovery.fstab \
    $(DEVICE_PATH)/recovery.fstab:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.sun \
    $(DEVICE_PATH)/recovery/root/vendor/etc/vintf/manifest.xml:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/vintf/manifest.xml \
    $(DEVICE_PATH)/recovery/root/vendor/etc/vintf/manifest.xml:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/vintf/manifest_sm8850.xml

# Init scripts
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/init.recovery.qcom.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.qcom.rc \
    $(DEVICE_PATH)/recovery/root/init.recovery.usb.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.usb.rc
