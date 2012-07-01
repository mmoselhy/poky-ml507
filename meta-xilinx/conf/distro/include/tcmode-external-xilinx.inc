# Copyright (C) 2011 SecretLab Technologies Ltd.
# Adrian Alonso <aalonso@secretlab.ca>
# Released under the MIT license (see packages/COPYING)
# License applies to this recipe code, not the toolchain itself
#
# Configuration to use a external toolchain built by xilinx
# git://git.xilinx.com/xldk/microblaze_v2.0.git

python __anonymous () {
    extpath = bb.data.getVar('XILINX_TOOLCHAIN', d, 1)
    if not (extpath and os.path.exists(os.path.join(extpath, "bin"))):
        bb.fatal("XILINX_TOOLCHAIN incorrect path")
}

#XILINX_TOOLCHAIN ?= "/opt/xlnx/microblaze_v2.0/microblaze-unknown-linux-gnu"
PATH =. "${XILINX_TOOLCHAIN}/bin:"

#TCLIBC = "glibc"
TARGET_VENDOR = "-unknown"
TARGET_OS = "linux-gnu"
GLIBCTARGETOS = "linux-gnu"

PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-xilinx-toolchain"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-xilinx-toolchain"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-xilinx-toolchain"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "external-xilinx-toolchain"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "external-xilinx-toolchain"
PREFERRED_PROVIDER_virtual/libc = "external-xilinx-toolchain"
PREFERRED_PROVIDER_virtual/libintl = "external-xilinx-toolchain"
PREFERRED_PROVIDER_virtual/libiconv = "external-xilinx-toolchain"

# This are also provided in prebuilt toolchain
#PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-xilinx-toolchain"
#PREFERRED_PROVIDER_linux-libc-headers = "external-xilinx-toolchain"

TOOLCHAIN_OPTIONS = " --sysroot=${XILINX_TOOLCHAIN}/${TARGET_SYS}/sys-root "
