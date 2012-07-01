require psplash.inc
require psplash-ua.inc

ALTERNATIVE_PRIORITY = "20"

# You can create your own pslash-poky-img.h by doing
# ./make-image-header.sh <file>.png POKY
# and rename the resulting .h to pslash-poky-img.h (for the logo)
# respectively psplash-bar-img.h (BAR) for the bar.
# You might also want to patch the colors (see patch)

SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
          file://psplash-18bpp.patch \
          file://0001-configurability-for-rev-422.patch \
          file://psplash-poky-img.h \
          file://psplash-bar-img.h \
          file://psplash-default \
          file://splashfuncs \
          file://psplash-init"
S = "${WORKDIR}/git"

