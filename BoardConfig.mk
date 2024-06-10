#
# Copyright (C) 2021-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/askey/dopinder

## Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sti6140d360

## DTB
TARGET_DTB_NAME := g12a_s905x2_u212_sti6130d3x0

## Partitions
BOARD_SUPER_PARTITION_SIZE := 1677721600

## Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

## SELinux
SELINUX_IGNORE_NEVERALLOWS := true
BOARD_VENDOR_SEPOLICY_DIRS += device/google/sabrina/sepolicy/vendor

## Wi-Fi
BOARD_WLAN_DEVICE := realtek
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_rtl
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_rtl
WIFI_DRIVER_SOCKET_IFACE := wlan0
PRODUCT_CFI_INCLUDE_PATHS += hardware/realtek/wlan/wpa_supplicant_8_lib

## Include the common tree BoardConfig makefile
include device/amlogic/g12-common/BoardConfigCommon.mk

## Include the proprietary BoardConfig makefile
include vendor/askey/dopinder/BoardConfigVendor.mk
