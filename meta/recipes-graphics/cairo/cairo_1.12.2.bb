require cairo.inc

LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"

PR = "r0"

SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"

SRC_URI[md5sum] = "87649eb75789739d517c743e94879e51"
SRC_URI[sha256sum] = "b786bc4a70542bcb09f2d9d13e5e6a0c86408cbf6d1edde5f0de807eecf93f96"

PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"

SUMMARY_${PN} = "The Cairo 2D vector graphics library"
DESCRIPTION_${PN} = "Cairo is a multi-platform library providing anti-aliased \
vector-based rendering for multiple target backends. Paths consist \
of line segments and cubic splines and can be rendered at any width \
with various join and cap styles. All colors may be specified with \
optional translucence (opacity/alpha) and combined using the \
extended Porter/Duff compositing algebra as found in the X Render \
Extension."

SUMMARY_cairo-gobject = "The Cairo library GObject wrapper library"
DESCRIPTION_cairo-gobject = "A GObject wrapper library for the Cairo API."

SUMMARY_cairo-script-interpreter = "The Cairo library script interpreter"
DESCRIPTION_cairo-script-interpreter = "The Cairo script interpreter implements \
CairoScript.  CairoScript is used by tracing utilities to enable the ability \
to replay rendering."

DESCRIPTION_cairo-perf-utils = "The Cairo library performance utilities"

FILES_${PN} = "${libdir}/libcairo.so.*"
FILES_${PN}-dev += "${libdir}/cairo/*.la ${libdir}/cairo/*.so"
#FILES_${PN}-dbg += "${libdir}/cairo/.debug"
#FILES_${PN}-staticdev += "${libdir}/cairo/*.a"
FILES_cairo-gobject = "${libdir}/libcairo-gobject.so.*"
FILES_cairo-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
FILES_cairo-perf-utils = "${bindir}/cairo-trace ${libdir}/cairo/libcairo-trace.so.*"

do_install_append () {
	rm -rf ${D}${bindir}/cairo-sphinx
	rm -rf ${D}${libdir}/cairo/cairo-fdr*
	rm -rf ${D}${libdir}/cairo/cairo-sphinx*
	rm -rf ${D}${libdir}/cairo/.debug/cairo-fdr*
	rm -rf ${D}${libdir}/cairo/.debug/cairo-sphinx*
}
