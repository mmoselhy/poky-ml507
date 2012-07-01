inherit xilinx-boot xilinx-utils
require recipes-bsp/u-boot/u-boot.inc

PR = "r15"
PV = "v2009.11"
LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://COPYING;md5=4c6cde5df68eff615d36789dc18edd3b"

KBRANCH = "master"
KBRANCH_microblaze = "microblaze"
# Microblaze src location
SRC_URI = "git://git.xilinx.com/u-boot-xlnx.git;branch=${KBRANCH};protocol=git \
           file://ml405-add-uartlite-config-options.patch \
           file://ml405-replace-hardcode-macros-for-uartns550.patch \
           file://ml507-add-uartlite-config-options.patch \
           file://ml507-replace-hardcode-macros-for-uartns550.patch"
SRU_URI_microblaze += " file://microblaze-genric-add-spi-flash-config.patch \
                        file://board-microblaze-monitor-flash-len.patch \
                        file://cfi_flash-define-monitor_flash_len.patch"

XILINX_BOARD ?= "${@find_board(bb.data.getVar('XILINX_BSP_PATH', d, 1), d)}"

S = "${WORKDIR}/git"
