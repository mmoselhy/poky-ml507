require busybox.inc
PR = "r5"

SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
           file://B921600.patch \
           file://get_header_tar.patch \
           file://busybox-appletlib-dependency.patch \
           file://run-parts.in.usr-bin.patch \
           file://watch.in.usr-bin.patch \
           file://busybox-udhcpc-no_deconfig.patch \
           file://find-touchscreen.sh \
           file://busybox-cron \
           file://busybox-httpd \
           file://busybox-udhcpd \
           file://busybox-udhcpc \
           file://default.script \
           file://simple.script \
           file://hwclock.sh \
           file://mount.busybox \
           file://syslog \
           file://syslog-startup.conf \
           file://mdev \
           file://mdev.conf \
           file://umount.busybox \
           file://defconfig"

SRC_URI[tarball.md5sum] = "9c0cae5a0379228e7b55e5b29528df8e"
SRC_URI[tarball.sha256sum] = "9b853406da61ffb59eb488495fe99cbb7fb3dd29a31307fcfa9cf070543710ee"

EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
