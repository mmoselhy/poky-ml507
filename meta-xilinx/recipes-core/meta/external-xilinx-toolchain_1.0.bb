# Copyright (C) 2011 SecretLab Technologies Ltd.
# Adrian Alonso <aalonso@secretlab.ca>
# Released under the MIT license (see packages/COPYING)
# License applies to this recipe code, not the toolchain itself
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"

PROVIDES = "\
    virtual/${TARGET_PREFIX}gcc \
    virtual/${TARGET_PREFIX}gcc-initial \
    virtual/${TARGET_PREFIX}binutils \
    virtual/${TARGET_PREFIX}libc-for-gcc \
    virtual/${TARGET_PREFIX}compilerlibs \
    virtual/libc \
    virtual/libintl \
    virtual/libiconv \
    "
# This are also provided by prebuilt toolchain
# linux-libc-headers \
# virtual/linux-libc-headers \
RPROVIDES = "glibc-utils libsegfault glibc-thread-db libgcc-dev libstdc++-dev libstdc++"
PACKAGES_DYNAMIC = "glibc-gconv-*"
INHIBIT_DEFAULT_DEPS = "1"
PR = "r0"

do_package[noexec] = "1"
do_package_write_ipk[noexec] = "1"
do_package_write_rpm[noexec] = "1"
do_package_write_deb[noexec] = "1"
