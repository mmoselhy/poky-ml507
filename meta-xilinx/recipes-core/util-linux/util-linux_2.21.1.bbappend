FILESEXTRAPATHS := "${THISDIR}/${PN}"
# Disable microblaze ncurses support
EXTRA_OECONF_microblaze += " --without-ncurses "
