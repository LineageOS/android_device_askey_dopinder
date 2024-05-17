#
# Copyright (C) 2021-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

## Bluetooth
BOARD_HAVE_BLUETOOTH_RTK_TV := true
include hardware/realtek/rtkbt/rtkbt.mk

PRODUCT_PACKAGES += \
    DopinderBluetoothOverlay

## CEC
PRODUCT_IS_ATV := true

## GMS
ifeq ($(WITH_GMS),true)
GMS_MAKEFILE=gms_minimal.mk
endif

## Init-Files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init-files/init.amlogic.wifi_buildin.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.amlogic.wifi_buildin.rc \
    $(LOCAL_PATH)/init-files/init.recovery.dopinder.rc:recovery/root/init.recovery.dopinder.rc

## Kernel Modules
PRODUCT_PACKAGES += \
    8822cs

## Keylayout (IR)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/Vendor_0001_Product_0001.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Vendor_0001_Product_0001.kl

## Inherit from the common tree product makefile
$(call inherit-product, device/amlogic/g12-common/g12.mk)

## Inherit from the proprietary files makefile
$(call inherit-product, vendor/askey/dopinder/dopinder-vendor.mk)
