#
# Copyright (C) 2009 The Android Open Source Project
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

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/motorola/umts_basil/init.mapphone_umts.rc:root/init.mapphone_umts.rc \
    device/motorola/umts_basil/init.mapphone30_umts.rc:root/init.mapphone30_umts.rc \
    device/motorola/umts_basil/init.mapphone_cdma.rc:root/init.mapphone_cdma.rc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/motorola/umts_basil/umts_basil-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.error.receiver.system.apps=com.google.android.feedback \
	ro.setupwizard.enterprise_mode=1 \
        ro.com.google.clientid=android-motorola \
	ro.com.google.clientidbase=android-motorola \
	ro.com.google.locationfeatures=1 \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
	ro.config.vc_call_vol_steps=7 \
	ro.telephony.call_ring.multiple=false \
	ro.telephony.call_ring.delay=3000 \
	ro.url.safetylegal=http://www.motorola.com/staticfiles/Support/legal/?model=A853 \
	ro.setupwizard.enable_bypass=1 \
	ro.media.dec.jpeg.memcap=20000000 \
	dalvik.vm.lockprof.threshold=500 \
	dalvik.vm.dexopt-flags=m=y \
        ro.product.multi_touch_enabled=true \
        ro.product.max_num_touch=2 \
        ro.com.google.gmsversion=2.1_r12 

# Enable TI HotSpot
#PRODUCT_PROPERTY_OVERRIDES += \
#    wifi.hotspot.ti=1

DEVICE_PACKAGE_OVERLAYS += device/motorola/umts_basil/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/motorola/umts_basil/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
    librs_jni \
    tiwlan.ini \
    dspexec \
    libbridge \
    overlay.omap3 \
    wlan_cu \
    libtiOsLib \
    wlan_loader \
    libCustomWifi \
    wpa_supplicant.conf \
    dhcpcd.conf \
    libOMX.TI.AAC.decode \
    libOMX.TI.AAC.encode \
    libOMX.TI.AMR.decode \
    libOMX.TI.AMR.encode \
    libOMX.TI.MP3.decode \
    libOMX.TI.WBAMR.decode \
    libOMX.TI.WBAMR.encode \
    libOMX.TI.JPEG.Encoder \
    libLCML \
    libOMX_Core \
    libOMX.TI.Video.Decoder \
    libOMX.TI.Video.encoder \
    libVendor_ti_omx \
    gps.basil \
    sensors.basil \
    lights.basil \
    libaudiopolicy

# HotSpot
#PRODUCT_PACKAGES += \
#    tiap_loader \
#    tiap_cu \
#    tiwlan_ap.ini \
#    hostap \
#    hostapd.conf

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Passion uses high-density artwork where available
PRODUCT_LOCALES += ldpi

PRODUCT_COPY_FILES += \
    device/motorola/umts_basil/vold.conf:system/etc/vold.conf \
    device/motorola/umts_basil/prebuilt/default.prop:system/default.prop \
    device/motorola/umts_basil/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/motorola/umts_basil/prebuilt/etc/location.cfg:/system/etc/location.cfg \
    device/motorola/umts_basil/prebuilt/bin/tcmd:/system/bin/tcmd \
    device/motorola/umts_basil/prebuilt/usr/keychars/basilp1-keypad.kcm.bin:/system/usr/keychars/basilp1-keypad.kcm.bin \
    device/motorola/umts_basil/prebuilt/lib/libgki.so:/system/lib/libgki.so \
    device/motorola/umts_basil/prebuilt/lib/modules/tiwlan_drv.ko:/system/lib/modules/tiwlan_drv.ko \
    device/motorola/umts_basil/prebuilt/lib/modules/kineto_gan.ko:/system/lib/modules/kineto_gan.ko \
    device/motorola/umts_basil/prebuilt/lib/modules/modem_pm_driver.ko:/system/lib/modules/modem_pm_driver.ko \
    device/motorola/umts_basil/prebuilt/lib/modules/netmux.ko:/system/lib/modules/netmux.ko \
    device/motorola/umts_basil/prebuilt/lib/modules/netmux_linkdriver.ko:/system/lib/modules/netmux_linkdriver.ko \
    device/motorola/umts_basil/prebuilt/lib/modules/pcbc.ko:/system/lib/modules/pcbc.ko \
    device/motorola/umts_basil/prebuilt/lib/modules/output.ko:/system/lib/modules/output.ko \
    device/motorola/umts_basil/prebuilt/lib/modules/sec.ko:/system/lib/modules/sec.ko \
    device/motorola/umts_basil/prebuilt/lib/modules/wl127x-test.ko:/system/lib/modules/wl127x-test.ko \

$(call inherit-product-if-exists, vendor/motorola/umts_basil/umts_basil-vendor.mk)

# media profiles and capabilities spec
# $(call inherit-product, device/motorola/sholes/media_a1026.mk)

# stuff common to all HTC phones
#$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)


PRODUCT_NAME := umts_basil
PRODUCT_DEVICE := umts_basil
