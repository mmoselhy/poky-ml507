DEFAULTTUNE ?= "ppc440"

require conf/machine/include/powerpc/arch-powerpc.inc

TUNEVALID[ppc440] = "Enable ppc440 specific processor optimizations"
TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc440", "-mcpu=440", "", d)}"
TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppc440", "ppc440", "${PPCPKGARCH}", d)}"

TARGET_FPU = "soft"
AVAILTUNES += "ppc440"
TUNE_FEATURES_tune-ppc440 = "m32 ppc440"
PACKAGE_EXTRA_ARCHS_tune-ppc440 = "ppc440"

#MACHINEOVERRIDES .= "ppc440"
