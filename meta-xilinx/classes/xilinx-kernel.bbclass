# Copyright (C) 2007, Stelios Koroneos - Digital OPSiS, All Rights Reserved
# Copyright (C) 2010, Adrian Alonso <aalonso00@gmail.com>
# Released under the MIT license (see packages/COPYING)
#
#This class handles all the intricasies of getting the required files from the
#ISE/EDK/project to the kernel and prepare the kernel for compilation.
#The Xilinx EDK supports 2 different architectures : PowerPC (ppc 405,440) and Microblaze
#Only the PowerPC BSP has been tested so far
#For this to work correctly you need to add XILINX_BSP_PATH and XILINX_BOARD to your
#local.conf
#XILINX_BSP_PATH should have the complete path to your project dir
#XILINX_BOARD should have the board type i.e ML403
#
#Currently tested on
#Xilinx ML405
#Xilinx ML507
#More to come soon ;)

def device_tree(a, d):
    # Device tree helper function
    import re

    board = bb.data.getVar('XILINX_BOARD', d, 1)
    cpu = bb.data.getVar('TARGET_CPU', d, 1)

    if re.match('powerpc', a):
        target = cpu + '-' + board
        dts = 'arch/' + a + '/boot/dts/virtex' + target + '.dts'
    else:
        target = 'system'
        dts = 'arch/' + a + '/boot/dts/' + target + '.dts'

    bb.data.setVar('KERNEL_TARGET', target, d)

    return dts


do_configure_prepend() {
#first check that the XILINX_BSP_PATH and XILINX_BOARD have been defined in local.conf
#now depending on the board type and arch do what is nessesary
if [ -n "${XILINX_BSP_PATH}" ]; then
	if [ "${XILINX_BOARD}" != "unknown" ]; then
		dts=`find "${XILINX_BSP_PATH}" -name *.dts -print`
		if [ -e "$dts" ]; then
			bbnote "Replacing device tree to match hardware model"
			if [ "${TARGET_ARCH}" == "powerpc" ]; then
				cp -pP ${dts} ${S}/arch/powerpc/boot/dts/virtex${KERNEL_TARGET}.dts
			else
				cp -pP ${dts} ${S}/arch/microblaze/platform/generic/${KERNEL_TARGET}.dts
			fi
		else
			bbfatal "No device tree found, missing hardware ref design?"
			exit 1
		fi
	else
		bbnote "Xilinx board model: ${XILINX_BOARD}"
        bbfatal "XILINX_BSP_PATH points to a valid Xilinx XPS project directory? ! Exit"
		exit 1
	fi
else
	bbfatal "XILINX_BSP_PATH not defined ! Exit"
	exit 1
fi
}
