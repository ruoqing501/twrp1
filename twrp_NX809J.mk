#
# Copyright (C) 2026 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/nubia/NX809J

# Inherit from device.mk configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

## Device identifier
PRODUCT_DEVICE  := NX809J
PRODUCT_NAME    := twrp_NX809J
PRODUCT_BRAND   := nubia
TARGET_OTA_ASSERT_DEVICE := NX809J

# Theme
TW_STATUS_ICONS_ALIGN   := center
TW_CUSTOM_CLOCK_POS := 65
TW_CUSTOM_CPU_POS := 240
TW_CUSTOM_BATTERY_POS := 790
