require xorg-app-common.inc

SUMMARY = "Runtime configuration and test of XInput devices"

DESCRIPTION = "Xinput is an utility for configuring and testing XInput devices"

LIC_FILES_CHKSUM = "file://COPYING;md5=22c34ea36136407a77702a8b784f9bd0"

DEPENDS += " libxi"

PR = "${INC_PR}.7"

SRC_URI[md5sum] = "1e2f0ad4f3fa833b65c568907f171d28"
SRC_URI[sha256sum] = "6aade131cecddaeefc39ddce1dd5e8473f6039c2e4efbfd9fbb5ee2a75885c76"
