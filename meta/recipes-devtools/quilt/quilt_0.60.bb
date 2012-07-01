require quilt-${PV}.inc
inherit gettext 
RDEPENDS_${PN} += "patch diffstat bzip2 util-linux"
SRC_URI += "file://aclocal.patch \
            file://gnu_patch_test_fix_target.patch \
           "
PR = "r0"

PERLPATH = "${bindir}/env perl"
PERLPATH_virtclass-nativesdk = "/usr/bin/env perl"

# fix build-distro specific perl path in the target perl scripts
do_install_append() {
	for perlscript in ${D}${datadir}/quilt/scripts/remove-trailing-ws ${D}${datadir}/quilt/scripts/dependency-graph ${D}${datadir}/quilt/scripts/edmail ${D}${bindir}/guards
	do
		if [ -f $perlscript ]; then
			sed -i -e '1s,#!.*perl,#! ${PERLPATH},' $perlscript
		fi
	done
}
