#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

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

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=dopinder \
    PRIVATE_BUILD_DESC="sti6140d360-user 10 QT 20220325 release-keys"

BUILD_FINGERPRINT := Onn/sti6140d360/sti6140d360:10/QT/20220325:user/release-keys
