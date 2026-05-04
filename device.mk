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

PRODUCT_PACKAGES_ENG += \
    qcom_decrypt \
    qcom_decrypt_fbe

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

# Shipping API level
BOARD_SHIPPING_API_LEVEL    := 36
PRODUCT_SHIPPING_API_LEVEL  := 36
PRODUCT_TARGET_VNDK_VERSION := 36

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Kernel
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS   := false
PRODUCT_ENABLE_UFFD_GC                          := true

PRODUCT_CHECK_PREBUILT_MAX_PAGE_SIZE := false

# Touch and display kernel modules for recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/vendor/modules/zte_tpd.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1/zte_tpd.ko \
    $(LOCAL_PATH)/recovery/root/vendor/modules/panel_event_notifier.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1/panel_event_notifier.ko \
    $(LOCAL_PATH)/recovery/root/vendor/modules/haptic_86938.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1/haptic_86938.ko \
    $(LOCAL_PATH)/recovery/root/vendor/modules/ifas.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1/ifas.ko

# OTA certs
PRODUCT_EXTRA_RECOVERY_KEYS += \
	$(DEVICE_PATH)/security/releasekey

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)
