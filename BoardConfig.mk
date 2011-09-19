# Camera
USE_CAMERA_STUB := false
#BOARD_USES_TI_CAMERA_HAL := true

# inherit from the proprietary version
-include vendor/motorola/daytona/BoardConfigVendor.mk

# CPU
TARGET_NO_BOOTLOADER := false
TARGET_BOARD_PLATFORM := tegra
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_BOOTLOADER_BOARD_NAME := daytona
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := vfpv3-d16
TARGET_HAVE_TEGRA_ERRATA_657451 := true

# Kernel
TARGET_PREBUILT_KERNEL := device/motorola/daytona/kernel
TARGET_PREBUILT_RECOVERY_KERNEL := device/motorola/daytona/kernel
BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x10000000

# Wifi
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := libCustomWifi
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := tiwlan0
#BOARD_SOFTAP_DEVICE         := tiap0
BOARD_WLAN_TI_STA_DK_ROOT   := system/wlan/ti/wilink_6_1
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/tiwlan_drv.ko"
WIFI_DRIVER_MODULE_NAME     := "tiwlan_drv"
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_FIRMWARE_LOADER        := "wlan_loader"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/wifi/fw_wlan1281.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/wifi/fw_wlan1281_AP.bin"

# Audio
BOARD_USES_GENERIC_AUDIO := false
#BOARD_USES_ALSA_AUDIO := true
#BOARD_WITH_ALSA_UTILS := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Recovery
#BOARD_CUSTOM_GRAPHICS := ../../../device/motorola/daytona/recovery/graphics.c
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PRE_COMMAND := "echo 1 > /data/.recovery_mode; sync;"
TARGET_RECOVERY_PRE_COMMAND_CLEAR_REASON := true
BOARD_ALWAYS_INSECURE := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_MKE2FS := device/motorola/daytona/releaseutils/mke2fs

# OpenGL
BOARD_EGL_CFG := device/motorola/daytona/prebuilt/egl.cfg

# OMX
#HARDWARE_OMX := true
#ifdef HARDWARE_OMX
#OMX_VENDOR := ti
#OMX_VENDOR_WRAPPER := TI_OMX_Wrapper
#BOARD_OPENCORE_LIBRARIES := libOMX_Core
#BOARD_OPENCORE_FLAGS := -DHARDWARE_OMX=1
#endif

# FM Radio
#BUILD_FM_RADIO := true
#BUILD_TI_FM_APPS := true

# Packaging
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/motorola/daytona/releasetools/daytona_ota_from_target_files
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := device/motorola/daytona/releasetools/daytona_img_from_target_files

# Hijack
TARGET_NEEDS_MOTOROLA_HIJACK := true
#BOARD_HIJACK_LOG_ENABLE := true

# Misc
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_USE_BATTERY_CHARGE_COUNTER := true
BOARD_FLASH_BLOCK_SIZE := 131072
HAVE_2_3_DSP := 1
#BOARD_NEEDS_CUTILS_LOG := true
