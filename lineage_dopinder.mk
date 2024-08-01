#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Not set in time to check, so set before everything else
PRODUCT_IS_ATV := true

# Inherit some common AOSP stuff
$(call inherit-product, device/google/atv/products/atv_base.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_tv.mk)

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_BRAND := Onn
PRODUCT_DEVICE := dopinder
PRODUCT_GMS_CLIENTID_BASE := android-askey-tv
PRODUCT_MANUFACTURER := askey
PRODUCT_MODEL := sti6140d360
PRODUCT_NAME := lineage_dopinder

PRODUCT_SYSTEM_NAME := sti6140d360
PRODUCT_SYSTEM_DEVICE := sti6140d360

PRODUCT_ATV_CLIENTID_BASE := ATV00100021

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=dopinder \
    PRIVATE_BUILD_DESC="sti6140d360-user 12 SC 20240424 release-keys" \
    TARGET_DEVICE=$(PRODUCT_DEVICE) \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)

BUILD_FINGERPRINT := Onn/sti6140d360/sti6140d360:12/SC/20240424:user/release-keys
