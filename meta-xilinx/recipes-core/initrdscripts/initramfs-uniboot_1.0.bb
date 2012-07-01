LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = "file://init.sh"
PR = "r0"
DESCRIPTION = "A modular initramfs init script system."
RRECOMMENDS_${PN} = "kernel-module-mtdblock"

do_install() {
        install -m 0755 ${WORKDIR}/init.sh ${D}/init
}

PACKAGE_ARCH = "all"
FILES_${PN} += " /init "
