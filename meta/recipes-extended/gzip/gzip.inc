SUMMARY = "Standard GNU compressor"
DESCRIPTION = "GNU Gzip is a popular data compression program originally written by Jean-loup Gailly for the GNU \
project. Mark Adler wrote the decompression part"
HOMEPAGE = "http://www.gnu.org/software/gzip/"
SECTION = "console/utils"
# change to GPLv3+ in 2007/07. Previous GPLv2 version is 1.3.12
LICENSE = "GPLv3+"
LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                    file://gzip.h;firstline=8;endline=20;md5=e2ec6b91fbe43a18f6081f3bbae46a01"

SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"

inherit autotools

do_install_append () {
	# Rename and move files into /bin (FHS), which is typical place for gzip
	install -d ${D}${base_bindir}
	mv ${D}${bindir}/gunzip ${D}${base_bindir}/gunzip
	mv ${D}${bindir}/gzip ${D}${base_bindir}/gzip
	mv ${D}${bindir}/zcat ${D}${base_bindir}/zcat
}

inherit update-alternatives

ALTERNATIVE_LINKS = "${base_bindir}/gunzip ${base_bindir}/gzip ${base_bindir}/zcat"
ALTERNATIVE_PRIORITY = "100"
