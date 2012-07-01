# Tune options for microblaze

require conf/machine/include/microblaze/arch-microblaze.inc

TARGET_FPU = "soft"
TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "microblaze", "-mcpu=v8.10a", "", d)}"

#MACHINEOVERRIDES .= "microblaze"
