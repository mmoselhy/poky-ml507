require linux.inc

DESCRIPTION = "Linux kernel for Xilinx platforms"
COMPATIBLE_MACHINE = "(virtex4|virtex5|spartan6-lx9mb)"

LICENSE = "GPL"
LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"

TAG="xilinx_v2.6.37"
PV = "2.6.37"
PR = "r8"

SRCREV = "${TAG}"
SRC_URI = "git://git.xilinx.com/linux-2.6-xlnx.git;protocol=git \
           file://linux-xilinx-do-not-use-OS-option.patch \
		   file://defconfig"

inherit kernel xilinx-kernel xilinx-utils

XILINX_BOARD = "${@find_board(bb.data.getVar('XILINX_BSP_PATH', d, 1), d)}"
KERNEL_DEVICETREE = "${@device_tree(bb.data.getVar('TARGET_ARCH', d, 1), d)}"

S = "${WORKDIR}/git"
