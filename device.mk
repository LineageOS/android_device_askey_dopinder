#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

## Bluetooth
BOARD_HAVE_BLUETOOTH_RTK_TV := true
include hardware/realtek/rtkbt/rtkbt.mk

PRODUCT_PACKAGES += \
    BluetoothOverlayTarget

## GMS
ifeq ($(WITH_GMS),true)
GMS_MAKEFILE=gms_minimal.mk
endif

## Init
PRODUCT_PACKAGES += \
    init.amlogic.target.rc \
    init.amlogic.wifi_buildin.rc \
    init.recovery.dopinder.rc

## Keylayout (IR)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/Vendor_0001_Product_0001.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Vendor_0001_Product_0001.kl

## Netflix
PRODUCT_PACKAGES += \
    NetflixConfig \
    DopinderNetflixConfigOverlay

## Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

## Wi-Fi
PRODUCT_CFI_INCLUDE_PATHS += hardware/realtek/wlan/wpa_supplicant_8_lib

## Inherit from the common tree product makefile
$(call inherit-product, device/amlogic/g12-common/g12.mk)

## Inherit from the proprietary files makefile
$(call inherit-product, vendor/askey/dopinder/dopinder-vendor.mk)
