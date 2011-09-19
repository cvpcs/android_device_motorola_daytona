#
# This is the product configuration for a generic daytona,
#

# Vendor-specifics
$(call inherit-product-if-exists, vendor/motorola/daytona/daytona-vendor.mk)

# GPS
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Prop overrides
PRODUCT_PROPERTY_OVERRIDES += \

# Device overlay
DEVICE_PACKAGE_OVERLAYS += device/motorola/daytona/overlay

# Permissions files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Prebuilts
PRODUCT_COPY_FILES += \
    device/motorola/daytona/prebuilt/apns-conf.xml:system/etc/apns-conf.xml \
    device/motorola/daytona/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
    device/motorola/daytona/prebuilt/mount_ext3.sh:system/bin/mount_ext3.sh \
    device/motorola/daytona/prebuilt/vold.fstab:system/etc/vold.fstab

# Rootfs
PRODUCT_COPY_FILES += \
    device/motorola/daytona/root/init.mapphone_cdma.rc:root/init.mapphone_cdma.rc \
    device/motorola/daytona/root/ueventd.mapphone_cdma.rc:root/ueventd.mapphone_cdma.rc

# HW Libs
#PRODUCT_PACKAGES += \
#    gps.daytona \
#    gralloc.tegra \
#    lights.tegra \
#    overlay.tegra \
#    sensors.daytona \

# OMX
#PRODUCT_PACKAGES += \
#    OMXCore \
#    libomxcameraadapter \
#    libOMX_CoreOsal \
#    libOMX_Core \
#    libomx_proxy_common \
#    libomx_rpc \
#    libOMX.TI.DUCATI1.IMAGE.JPEGD \
#    libOMX.TI.DUCATI1.MISC.SAMPLE \
#    libOMX.TI.DUCATI1.VIDEO.CAMERA \
#    libOMX.TI.DUCATI1.VIDEO.DECODER \
#    libOMX.TI.DUCATI1.VIDEO.H264D \
#    libOMX.TI.DUCATI1.VIDEO.H264E \
#    libOMX.TI.DUCATI1.VIDEO.MPEG4D \
#    libOMX.TI.DUCATI1.VIDEO.MPEG4E \
#    libOMX.TI.DUCATI1.VIDEO.VP6D \
#    libOMX.TI.DUCATI1.VIDEO.VP7D \
#    libVendor_ti_omx \
#    libVendor_ti_omx_config_parser

# Syslink and Tiler
# Wifi
#PRODUCT_PACKAGES += \
#    libtiOsLib \
#    libCustomWifi \
#    wlan_loader \
#    wlan_cu \
#    wpa_supplicant.conf \
#    dhcpcd.conf

# Release utilities
PRODUCT_PACKAGES += \
    daytona_releaseutils-check_kernel \
    daytona_releaseutils-finalize_release \
    daytona_releaseutils-mke2fs \
    daytona_releaseutils-tune2fs \

# Misc
#PRODUCT_PACKAGES += \
#    librs_jni \
#    libreference-ril \
#    libreference-cdma-sms \
#    Usb

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# daytona uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# copy all kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell \
    find device/motorola/daytona/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/motorola/daytona/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product-if-exists, vendor/motorola/daytona/daytona-vendor.mk)

# stuff common to all Motorola phones
$(call inherit-product, device/motorola/common/common_hijack.mk)

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_NAME := generic_daytona
PRODUCT_DEVICE := daytona
