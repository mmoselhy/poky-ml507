DESCRIPTION = "Evolution database backend server"
HOMEPAGE = "http://www.gnome.org/projects/evolution/"
BUGTRACKER = "https://bugzilla.gnome.org/"

LICENSE = "LGPLv2 & LGPLv2+"
LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
                    file://camel/camel.h;endline=24;md5=b02175c88f821224746b347a89731a2b \
                    file://libedataserver/e-data-server-util.h;endline=23;md5=9df8127bd8cfdc5469e938fc710d1f40 \
                    file://calendar/libecal/e-cal.h;endline=24;md5=5d496b9b6fd2a4fdbbfc31ef9455c9d0"

DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libiconv zlib libsoup-2.4 libglade libical gnome-keyring gperf-native"

SRCREV = "7337d11aed576e7caaa12b4e881ad8d33668799f"
PV = "2.30+git${SRCPV}"
PR = "r0"

SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
           file://oh-contact.patch;striplevel=0 \
           file://nossl.patch \
           file://optional_imapx_provider.patch \
           file://new-contact-fix.patch \
           file://old-gdk-api.patch \
           file://depbuildfix.patch \
           file://iconv-detect.h"

S = "${WORKDIR}/git"

inherit autotools pkgconfig

# -ldb needs this on some platforms
LDFLAGS += "-lpthread"

# Parallel make shows many issues with this source code.
# Current problems seem to be duplicate execution of the calander/backends
# directories by make resulting in truncated/corrupt .la files
#PARALLEL_MAKE = ""

do_configure_prepend () {
        echo "EXTRA_DIST = " > ${S}/gtk-doc.make
}

do_configure_append () {
        cp ${WORKDIR}/iconv-detect.h ${S}
}

EXTRA_OECONF = "--without-openldap --with-dbus --without-bug-buddy \
                --with-soup --with-libdb=${STAGING_DIR_HOST}${prefix} \
                --disable-smime --disable-ssl --disable-nntp --disable-gtk-doc --without-weather"

PACKAGES =+ "libcamel libcamel-dev libebook libebook-dev libecal libecal-dev \
             libedata-book libedata-book-dev libedata-cal libedata-cal-dev \
             libedataserver libedataserver-dev \
             libedataserverui libedataserverui-dev"

FILES_${PN} =+ "${datadir}/evolution-data-server-*/ui/"
FILES_${PN}-dev =+ "${libdir}/pkgconfig/evolution-data-server-*.pc"
FILES_${PN}-dbg =+ "${libdir}/evolution-data-server-*/camel-providers/.debug \
                    ${libdir}/evolution-data-server*/extensions/.debug/"
RRECOMMENDS_${PN}-dev += "libecal-dev libebook-dev"

FILES_libcamel = "${libexecdir}/camel-* ${libdir}/libcamel-*.so.* \
                  ${libdir}/libcamel-provider-*.so.* \
                  ${libdir}/evolution-data-server-*/camel-providers/*.so \
                  ${libdir}/evolution-data-server-*/camel-providers/*.urls"
FILES_libcamel-dev = "${libdir}/libcamel-*.so ${libdir}/libcamel-provider-*.so \
                      ${libdir}/pkgconfig/camel*pc \
                    ${libdir}/evolution-data-server-*/camel-providers/*.la \
                      ${includedir}/evolution-data-server*/camel"

FILES_libebook = "${libdir}/libebook-*.so.*"
FILES_libebook-dev = "${libdir}/libebook-1.2.so \
                      ${libdir}/pkgconfig/libebook-*.pc \
                      ${includedir}/evolution-data-server*/libebook/*.h"
RRECOMMENDS_libebook = "libedata-book"

FILES_libecal = "${libdir}/libecal-*.so.* \
                 ${datadir}/evolution-data-server-1.4/zoneinfo"
FILES_libecal-dev = "${libdir}/libecal-*.so ${libdir}/pkgconfig/libecal-*.pc \
                     ${includedir}/evolution-data-server*/libecal/*.h \
                     ${includedir}/evolution-data-server*/libical/*.h"
RRECOMMENDS_libecal = "libedata-cal tzdata"

FILES_libedata-book = "${libexecdir}/e-addressbook-factory \
                       ${datadir}/dbus-1/services/*.AddressBook.service \
                       ${libdir}/libedata-book-*.so.* \
                       ${libdir}/evolution-data-server-*/extensions/libebook*.so \
                       ${datadir}/evolution-data-server-1.4/weather/Locations.xml"
FILES_libedata-book-dev = "${libdir}/libedata-book-*.so \
                           ${libdir}/pkgconfig/libedata-book-*.pc \
                           ${libdir}/evolution-data-server-*/extensions/libebook*.la \
                           ${includedir}/evolution-data-server-*/libedata-book"

FILES_libedata-cal = "${libexecdir}/e-calendar-factory \
                      ${datadir}/dbus-1/services/*.Calendar.service \
                      ${libdir}/libedata-cal-*.so.* \
                      ${libdir}/evolution-data-server-*/extensions/libecal*.so"
FILES_libedata-cal-dev = "${libdir}/libedata-cal-*.so \
                          ${libdir}/pkgconfig/libedata-cal-*.pc \
                          ${includedir}/evolution-data-server-*/libedata-cal \
                          ${libdir}/evolution-data-server-*/extensions/libecal*.la"

FILES_libedataserver = "${libdir}/libedataserver-*.so.*"
FILES_libedataserver-dev = "${libdir}/libedataserver-*.so \
                            ${libdir}/pkgconfig/libedataserver-*.pc \
                            ${includedir}/evolution-data-server-*/libedataserver/*.h"

FILES_libedataserverui = "${libdir}/libedataserverui-*.so.* ${datadir}/evolution-data-server-1.4/glade/*.glade"
FILES_libedataserverui-dev = "${libdir}/libedataserverui-*.so \
                              ${libdir}/pkgconfig/libedataserverui-*.pc \
                              ${includedir}/evolution-data-server-*/libedataserverui/*.h"

