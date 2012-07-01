# Tune options for microblaze endian little
DEFAULTTUNE ?= "microblazeel"

require conf/machine/include/microblaze/arch-microblaze.inc

TUNEVALID[microblazeel] = "Enable microblaze endian little optimizations"
TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "microblazeel", "-mcpu=v8.10a", "", d)}"
TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "microblazeel", "microblazeel", "microblazeel", d)}"

TARGET_FPU = "soft"

AVAILTUNES += "microblazeel"
TUNE_FEATURES_tune-microblazeel = "m32 microblazeel"
PACKAGE_EXTRA_ARCHS_tune-microblazeel = "microblazeel"

#MACHINEOVERRIDES .= "microblaze"
