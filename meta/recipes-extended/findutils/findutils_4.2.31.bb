SUMMARY = "find, locate, and xargs binaries."
DESCRIPTION = "The GNU Find Utilities are the basic directory searching utilities of the GNU operating system. \
These programs are typically used in conjunction with other programs to provide modular and powerful directory \
search and file locating capabilities to other commands."
HOMEPAGE = "http://www.gnu.org/software/findutils/"
BUGTRACKER = "http://savannah.gnu.org/bugs/?group=findutils"
SECTION = "console/utils"

LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
PR = "r2"

SRC_URI = "${GNU_MIRROR}/findutils/findutils-${PV}.tar.gz \
           file://gnulib-extension.patch"

SRC_URI[md5sum] = "a0e31a0f18a49709bf5a449867c8049a"
SRC_URI[sha256sum] = "e0d34b8faca0b3cca0703f6c6b498afbe72f0ba16c35980c10ec9ef7724d6204"

inherit autotools gettext update-alternatives

ALTERNATIVE_LINKS = "${bindir}/find ${bindir}/xargs"
ALTERNATIVE_PRIORITY = "100"

# diffutils assumes non-glibc compilation with uclibc and
# this causes it to generate its own implementations of
# standard functionality.  regex.c actually breaks compilation
# because it uses __mempcpy, there are other things (TBD:
# see diffutils.mk in buildroot)
EXTRA_OECONF_libc-uclibc = "--without-included-regex"

BBCLASSEXTEND = "native"
