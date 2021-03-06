#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

## The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US_SUPL:system/etc/gps.conf

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/pantech/magnus/magnus-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/pantech/magnus/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Audio configuration
PRODUCT_COPY_FILES += \
   device/pantech/magnus/audio/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x \
   device/pantech/magnus/audio/audio_policy.conf:system/etc/audio_policy.conf

# Media config
PRODUCT_COPY_FILES += \
	device/pantech/magnus/configs/media_codecs.xml:system/etc/media_codecs.xml

# Keylayout
PRODUCT_COPY_FILES += \
	device/pantech/magnus/keylayout/cyttsp4-i2c.kl:system/usr/keylayout/cyttsp4-i2c.kl \
	device/pantech/magnus/keylayout/max11871-touchscreen.kl:system/usr/keylayout/max11871-touchscreen.kl \
	device/pantech/magnus/keylayout/qt602240_ts_input.kl:system/usr/keylayout/qt602240_ts_input.kl

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    init.target.rc \
    ueventd.qcom.rc

# Torch
PRODUCT_PACKAGES += Torch

# Vold configuration
PRODUCT_COPY_FILES += \
    device/pantech/magnus/vold.fstab:system/etc/vold.fstab

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Lights
PRODUCT_PACKAGES += lights.msm8960

# Increase the HWUI font cache since we have tons of RAM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.text_cache_width=2048

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

# QRNGD
PRODUCT_PACKAGES += qrngd

#common build.props
#PRODUCT_PROPERTY_OVERRIDES += \

# common msm8960
$(call inherit-product, device/pantech/msm8960-common/msm8960.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
