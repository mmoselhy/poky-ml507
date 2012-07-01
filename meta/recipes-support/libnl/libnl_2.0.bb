DESCRIPTION = "libnl is a library for applications dealing with netlink sockets."
HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
SECTION = "libs/network"

LICENSE = "LGPLv2.1"
LIC_FILES_CHKSUM = "file://COPYING;md5=2b41e13261a330ee784153ecbb6a82bc"

DEPENDS = "flex-native bison-native"
PE = "1"
PR = "r6"

SRC_URI = "\
  http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
  file://fix-pktloc_syntax_h-race.patch \
  file://fix-pc-file.patch \
"

SRC_URI[md5sum] = "6aaf1e9802a17a7d702bb0638044ffa7"
SRC_URI[sha256sum] = "5a40dc903d3ca1074da7424b908bec8ff16936484798c7e46e53e9db8bc87a9c"

inherit autotools pkgconfig

PACKAGES =+ "${PN}-route ${PN}-nf ${PN}-genl ${PN}-cli"
FILES_${PN}-route = "${libdir}/libnl-route.so.*"
FILES_${PN}-nf    = "${libdir}/libnl-nf.so.*"
FILES_${PN}-genl  = "${libdir}/libnl-genl.so.*"
FILES_${PN}-cli   = "${libdir}/libnl-cli.so.*"
