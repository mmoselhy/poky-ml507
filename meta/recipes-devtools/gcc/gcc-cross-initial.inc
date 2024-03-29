DEPENDS = "virtual/${TARGET_PREFIX}binutils ${NATIVEDEPS}"
PROVIDES = "virtual/${TARGET_PREFIX}gcc-initial"
PACKAGES = ""

INHIBIT_AUTOTOOLS_DEPS = "1"
INHIBIT_DEFAULT_DEPS = "1"

CROSS_TARGET_SYS_DIR_append = ".${PN}"

# This is intended to be a -very- basic config
# sysroot is needed in case we use libc-initial
EXTRA_OECONF = "--with-newlib \
		--without-headers \
		--disable-shared \
		--disable-threads \
		--disable-multilib \
		--disable-__cxa_atexit \
		--enable-languages=c \
                ${OPTSPACE} \
		--program-prefix=${TARGET_PREFIX} \
		--with-sysroot=${STAGING_DIR_TARGET} \
		--with-build-sysroot=${STAGING_DIR_TARGET} \
		${EXTRA_OECONF_INITIAL} \
		${@get_gcc_fpu_setting(bb, d)}"

do_compile () {
    oe_runmake all-gcc all-target-libgcc
}
