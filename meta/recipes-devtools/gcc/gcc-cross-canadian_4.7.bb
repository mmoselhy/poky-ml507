inherit cross-canadian

require recipes-devtools/gcc/gcc-${PV}.inc
require gcc-cross-canadian.inc
require gcc-configure-sdk.inc
require gcc-package-sdk.inc

DEPENDS += "gmp-nativesdk mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
RDEPENDS_${PN} += "mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"

SYSTEMHEADERS = "/usr/include"
SYSTEMLIBS = "/lib/"
SYSTEMLIBS1 = "/usr/lib/"

EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
		--disable-libgomp --disable-libmudflap \
		--with-mpfr=${STAGING_DIR_HOST}${layout_exec_prefix} \
		--with-mpc=${STAGING_DIR_HOST}${layout_exec_prefix}"

# to find libmpfr
# export LD_LIBRARY_PATH = "{STAGING_DIR_HOST}${layout_exec_prefix}"

PARALLEL_MAKE = ""

# gcc 4.7 needs -isystem
export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET} -isystem=${target_includedir}"
