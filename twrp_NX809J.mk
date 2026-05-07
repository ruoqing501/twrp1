#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/nubia/NX809J

# Inherit from device.mk configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Device identifier
PRODUCT_DEVICE := NX809J
PRODUCT_NAME := twrp_NX809J
PRODUCT_BRAND := nubia
PRODUCT_MANUFACTURER := nubia
PRODUCT_MODEL := RedMagic 11 Pro +

# Assert
TARGET_OTA_ASSERT_DEVICE := NX809J

# Fingerprint
BUILD_FINGERPRINT := REDMAGIC/NX809J/NX809J:16/BQ2A.250705.001-BP2A.250605.031.A3/20260317.232707:user/release-keys

# Theme
TW_STATUS_ICONS_ALIGN := center
