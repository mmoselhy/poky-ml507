# Microblaze ABI interface definition
DEFAULTTUNE ?= "microblaze"

TUNEVALID[m32] = "Microblaze ELF32 standard ABI"
TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "microblaze", "", d)}"

TUNEVALID[fpu-soft] = "Use software FPU."
TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "-msoft-float", "", d)}"
TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}"

TUNE_PKGARCH ?= "${TUNE_ARCH}"

AVAILTUNES += "microblaze"
TUNE_FEATURES_tune-microblaze ?= "m32 fpu-soft"
PACKAGE_EXTRA_ARCHS_tune-microblaze = "microblaze"

