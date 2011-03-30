USE_CAMERA_STUB := true
# inherit from the proprietary version
-include vendor/motorola/basil/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := omap3
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8

TARGET_BOOTLOADER_BOARD_NAME := basil

BOARD_KERNEL_CMDLINE := console=ttyS2,115200n8 rw init=/init ip=off motobldlabel=none mtdparts=omap2-nand.0:128k(mbmloader),640k(mbm),640k(mbmbackup),384k(bploader),384k(cdt),1536k(pds),384k(lbl),384k(lbl_backup),384k(cid),1536k(sp),384k(devtree),640k(logo),384k(misc),3584k(boot),3840k(bpsw),4608k(recovery),9088k(cdrom),384k(unused0),182656k(system),384k(unused1),133760k(cache),175232k(userdata),384k(unused2),2m(kpanic),512k(rsv)

BOARD_KERNEL_BASE := 0x10000000
BOARD_PAGE_SIZE := 0x00000800

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00380000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00480000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0b260000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0ab20000
BOARD_FLASH_BLOCK_SIZE := 131072

OMX_TI_OMAP_TIER_LEVEL := 10
# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := libCustomWifi
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := tiwlan0
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/tiwlan_drv.ko"
BOARD_WLAN_TI_STA_DK_ROOT   := system/wlan/ti/wilink_6_1
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := "tiwlan_drv"
WIFI_FIRMWARE_LOADER        := "wlan_loader"

BOARD_USES_GENERIC_AUDIO := true

BOARD_HAVE_BLUETOOTH := true
BOARD_EGL_CFG := device/motorola/basil/egl.cfg
TARGET_PREBUILT_RECOVERY_KERNEL := device/motorola/basil/recovery_kernel
TARGET_PREBUILT_KERNEL := device/motorola/basil/kernel
BOARD_HAS_SMALL_RECOVERY := true
BOARD_LDPI_RECOVERY := true

BOARD_RECOVERY_IGNORE_BOOTABLES := true
BOARD_DATA_DEVICE := /dev/block/mtdblock9
BOARD_DATA_FILESYSTEM := auto
BOARD_SYSTEM_DEVICE := /dev/block/mtdblock7
BOARD_SYSTEM_FILESYSTEM := auto
BOARD_CACHE_DEVICE := /dev/block/mtdblock8
BOARD_CACHE_FILESYSTEM := auto

#mtd partitions on MB502
# #dev:    size   erasesize  name
# #mtd0: 00180000 00020000 "pds"
# #mtd1: 00060000 00020000 "cid"
# #mtd2: 000a0000 00020000 "logo"
# #mtd3: 00060000 00020000 "misc"
# #mtd4: 00380000 00020000 "boot"
# #mtd5: 00480000 00020000 "recovery"
# #mtd6: 008e0000 00020000 "cdrom"
# #mtd7: 0b260000 00020000 "system"
# #mtd8: 082a0000 00020000 "cache"
# #mtd9: 0ab20000 00020000 "userdata"
# #mtd10: 00200000 00020000 "kpanic"
