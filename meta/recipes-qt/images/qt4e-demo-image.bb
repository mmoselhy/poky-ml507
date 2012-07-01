DESCRIPTION = "Version 1.0-r1 of the qtr3-demo-image."
LICENSE = "MIT"
PR="r1"

LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

DEPENDS += "task-qt4e"

RDEPENDS_${PN} += " \
	task-qt4e-base \
	"

IMAGE_INSTALL += "\
	${CORE_IMAGE_BASE_INSTALL} \
	module-init-tools \
	task-qt4e-base \
"

inherit core-image

