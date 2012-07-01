#################################################################
# Makefile generated by Xilinx Platform Studio 
# Project:/home/aalonso/workspace/ppc44x/xlnx/xilinx-ml507/system.xmp
#
# WARNING : This file will be re-generated every time a command
# to run a make target is invoked. So, any changes made to this  
# file manually, will be lost when make is invoked next. 
#################################################################

XILINX_EDK_DIR = /opt/Xilinx/11.4/EDK
NON_CYG_XILINX_EDK_DIR = /opt/Xilinx/11.4/EDK

SYSTEM = system

MHSFILE = system.mhs

MSSFILE = system.mss

FPGA_ARCH = virtex5

DEVICE = xc5vfx70tff1136-1

LANGUAGE = vhdl

SEARCHPATHOPT = 
GLOBAL_SEARCHPATHOPT = 

SUBMODULE_OPT = 

PLATGEN_OPTIONS = -p $(DEVICE) -lang $(LANGUAGE) $(SEARCHPATHOPT) $(SUBMODULE_OPT) -msg __xps/ise/xmsgprops.lst

LIBGEN_OPTIONS = -mhs $(MHSFILE) -p $(DEVICE) $(SEARCHPATHOPT) -msg __xps/ise/xmsgprops.lst

OBSERVE_PAR_OPTIONS = -error yes

TESTAPP_MEMORY_PPC440_0_OUTPUT_DIR = TestApp_Memory_ppc440_0
TESTAPP_MEMORY_PPC440_0_OUTPUT = $(TESTAPP_MEMORY_PPC440_0_OUTPUT_DIR)/executable.elf

TESTAPP_PERIPHERAL_PPC440_0_OUTPUT_DIR = TestApp_Peripheral_ppc440_0
TESTAPP_PERIPHERAL_PPC440_0_OUTPUT = $(TESTAPP_PERIPHERAL_PPC440_0_OUTPUT_DIR)/executable.elf

MICROBLAZE_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/microblaze/mb_bootloop.elf
PPC405_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/ppc405/ppc_bootloop.elf
PPC440_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/ppc440/ppc440_bootloop.elf
BOOTLOOP_DIR = bootloops

PPC440_0_BOOTLOOP = $(BOOTLOOP_DIR)/ppc440_0.elf

BRAMINIT_ELF_FILES =   $(PPC440_0_BOOTLOOP) 
BRAMINIT_ELF_FILE_ARGS =   -pe ppc440_0  $(PPC440_0_BOOTLOOP) 

ALL_USER_ELF_FILES = $(TESTAPP_MEMORY_PPC440_0_OUTPUT) $(TESTAPP_PERIPHERAL_PPC440_0_OUTPUT) 

SIM_CMD = vsim

BEHAVIORAL_SIM_SCRIPT = simulation/behavioral/$(SYSTEM)_setup.do

STRUCTURAL_SIM_SCRIPT = simulation/structural/$(SYSTEM)_setup.do

TIMING_SIM_SCRIPT = simulation/timing/$(SYSTEM)_setup.do

DEFAULT_SIM_SCRIPT = $(BEHAVIORAL_SIM_SCRIPT)

MIX_LANG_SIM_OPT = -mixed no

SIMGEN_OPTIONS = -p $(DEVICE) -lang $(LANGUAGE) $(SEARCHPATHOPT) $(BRAMINIT_ELF_FILE_ARGS) $(MIX_LANG_SIM_OPT) -msg __xps/ise/xmsgprops.lst -sd implementation/ -s mti


LIBRARIES =  \
       ppc440_0/lib/libxil.a 

LIBSCLEAN_TARGETS = ppc440_0_libsclean 

PROGRAMCLEAN_TARGETS = TestApp_Memory_ppc440_0_programclean TestApp_Peripheral_ppc440_0_programclean 

CORE_STATE_DEVELOPMENT_FILES = 

WRAPPER_NGC_FILES = implementation/ppc440_0_wrapper.ngc \
implementation/plb_v46_0_wrapper.ngc \
implementation/xps_bram_if_cntlr_1_wrapper.ngc \
implementation/xps_bram_if_cntlr_1_bram_wrapper.ngc \
implementation/leds_8bit_wrapper.ngc \
implementation/leds_positions_wrapper.ngc \
implementation/push_buttons_5bit_wrapper.ngc \
implementation/dip_switches_8bit_wrapper.ngc \
implementation/iic_eeprom_wrapper.ngc \
implementation/ddr2_sdram_wrapper.ngc \
implementation/sysace_compactflash_wrapper.ngc \
implementation/rs232_uart_1_wrapper.ngc \
implementation/flash_wrapper.ngc \
implementation/hard_ethernet_mac_wrapper.ngc \
implementation/xps_timebase_wdt_0_wrapper.ngc \
implementation/xps_timer_0_wrapper.ngc \
implementation/clock_generator_0_wrapper.ngc \
implementation/jtagppc_cntlr_inst_wrapper.ngc \
implementation/proc_sys_reset_0_wrapper.ngc \
implementation/xps_intc_0_wrapper.ngc

POSTSYN_NETLIST = implementation/$(SYSTEM).ngc

SYSTEM_BIT = implementation/$(SYSTEM).bit

DOWNLOAD_BIT = implementation/download.bit

SYSTEM_ACE = implementation/$(SYSTEM).ace

UCF_FILE = data/system.ucf

BMM_FILE = implementation/$(SYSTEM).bmm

BITGEN_UT_FILE = etc/bitgen.ut

XFLOW_OPT_FILE = etc/fast_runtime.opt
XFLOW_DEPENDENCY = __xps/xpsxflow.opt $(XFLOW_OPT_FILE)

XPLORER_DEPENDENCY = __xps/xplorer.opt
XPLORER_OPTIONS = -p $(DEVICE) -uc $(SYSTEM).ucf -bm $(SYSTEM).bmm -max_runs 7

FPGA_IMP_DEPENDENCY = $(BMM_FILE) $(POSTSYN_NETLIST) $(UCF_FILE) $(XFLOW_DEPENDENCY)

SDK_EXPORT_DIR = SDK/SDK_Export/hw
SYSTEM_HW_HANDOFF = $(SDK_EXPORT_DIR)/$(SYSTEM).xml
SYSTEM_HW_HANDOFF_BIT = $(SDK_EXPORT_DIR)/$(SYSTEM).bit
SYSTEM_HW_HANDOFF_BMM = $(SDK_EXPORT_DIR)/$(SYSTEM)_bd.bmm
SYSTEM_HW_HANDOFF_DEP = $(SYSTEM_HW_HANDOFF) $(SYSTEM_HW_HANDOFF_BIT) $(SYSTEM_HW_HANDOFF_BMM)

#################################################################
# SOFTWARE APPLICATION TESTAPP_MEMORY_PPC440_0
#################################################################

TESTAPP_MEMORY_PPC440_0_SOURCES = TestApp_Memory_ppc440_0/src/TestApp_Memory.c 

TESTAPP_MEMORY_PPC440_0_HEADERS = 

TESTAPP_MEMORY_PPC440_0_CC = powerpc-eabi-gcc
TESTAPP_MEMORY_PPC440_0_CC_SIZE = powerpc-eabi-size
TESTAPP_MEMORY_PPC440_0_CC_OPT = -O2
TESTAPP_MEMORY_PPC440_0_CFLAGS = 
TESTAPP_MEMORY_PPC440_0_CC_SEARCH = # -B
TESTAPP_MEMORY_PPC440_0_LIBPATH = -L./ppc440_0/lib/ # -L
TESTAPP_MEMORY_PPC440_0_INCLUDES = -I./ppc440_0/include/ # -I
TESTAPP_MEMORY_PPC440_0_LFLAGS = # -l
TESTAPP_MEMORY_PPC440_0_LINKER_SCRIPT = TestApp_Memory_ppc440_0/src/TestApp_Memory_LinkScr.ld
TESTAPP_MEMORY_PPC440_0_LINKER_SCRIPT_FLAG = -Wl,-T -Wl,$(TESTAPP_MEMORY_PPC440_0_LINKER_SCRIPT) 
TESTAPP_MEMORY_PPC440_0_CC_DEBUG_FLAG =  -g 
TESTAPP_MEMORY_PPC440_0_CC_PROFILE_FLAG = # -pg
TESTAPP_MEMORY_PPC440_0_CC_GLOBPTR_FLAG= # -msdata=eabi
TESTAPP_MEMORY_PPC440_0_CC_INFERRED_FLAGS= -mcpu=440 
TESTAPP_MEMORY_PPC440_0_CC_START_ADDR_FLAG=  #  # -Wl,-defsym -Wl,_START_ADDR=
TESTAPP_MEMORY_PPC440_0_CC_STACK_SIZE_FLAG=  #  # -Wl,-defsym -Wl,_STACK_SIZE=
TESTAPP_MEMORY_PPC440_0_CC_HEAP_SIZE_FLAG=  #  # -Wl,-defsym -Wl,_HEAP_SIZE=
TESTAPP_MEMORY_PPC440_0_OTHER_CC_FLAGS= $(TESTAPP_MEMORY_PPC440_0_CC_GLOBPTR_FLAG)  \
                  $(TESTAPP_MEMORY_PPC440_0_CC_START_ADDR_FLAG) $(TESTAPP_MEMORY_PPC440_0_CC_STACK_SIZE_FLAG) $(TESTAPP_MEMORY_PPC440_0_CC_HEAP_SIZE_FLAG)  \
                  $(TESTAPP_MEMORY_PPC440_0_CC_INFERRED_FLAGS)  \
                  $(TESTAPP_MEMORY_PPC440_0_LINKER_SCRIPT_FLAG) $(TESTAPP_MEMORY_PPC440_0_CC_DEBUG_FLAG) $(TESTAPP_MEMORY_PPC440_0_CC_PROFILE_FLAG) 

#################################################################
# SOFTWARE APPLICATION TESTAPP_PERIPHERAL_PPC440_0
#################################################################

TESTAPP_PERIPHERAL_PPC440_0_SOURCES = TestApp_Peripheral_ppc440_0/src/TestApp_Peripheral.c TestApp_Peripheral_ppc440_0/src/xintc_tapp_example.c TestApp_Peripheral_ppc440_0/src/xgpio_tapp_example.c TestApp_Peripheral_ppc440_0/src/xgpio_intr_tapp_example.c TestApp_Peripheral_ppc440_0/src/xiic_selftest_example.c TestApp_Peripheral_ppc440_0/src/xsysace_selftest_example.c TestApp_Peripheral_ppc440_0/src/xlltemac_example_polled.c TestApp_Peripheral_ppc440_0/src/xlltemac_example_util.c TestApp_Peripheral_ppc440_0/src/xlltemac_example_intr_sgdma.c TestApp_Peripheral_ppc440_0/src/xwdttb_selftest_example.c TestApp_Peripheral_ppc440_0/src/xwdttb_intr_example.c TestApp_Peripheral_ppc440_0/src/xtmrctr_selftest_example.c TestApp_Peripheral_ppc440_0/src/xtmrctr_intr_example.c 

TESTAPP_PERIPHERAL_PPC440_0_HEADERS = TestApp_Peripheral_ppc440_0/src/intc_header.h TestApp_Peripheral_ppc440_0/src/gpio_header.h TestApp_Peripheral_ppc440_0/src/gpio_intr_header.h TestApp_Peripheral_ppc440_0/src/iic_header.h TestApp_Peripheral_ppc440_0/src/sysace_header.h TestApp_Peripheral_ppc440_0/src/xlltemac_example.h TestApp_Peripheral_ppc440_0/src/lltemac_header.h TestApp_Peripheral_ppc440_0/src/lltemac_intr_header.h TestApp_Peripheral_ppc440_0/src/wdttb_header.h TestApp_Peripheral_ppc440_0/src/wdttb_intr_header.h TestApp_Peripheral_ppc440_0/src/tmrctr_header.h TestApp_Peripheral_ppc440_0/src/tmrctr_intr_header.h 

TESTAPP_PERIPHERAL_PPC440_0_CC = powerpc-eabi-gcc
TESTAPP_PERIPHERAL_PPC440_0_CC_SIZE = powerpc-eabi-size
TESTAPP_PERIPHERAL_PPC440_0_CC_OPT = -O2
TESTAPP_PERIPHERAL_PPC440_0_CFLAGS = 
TESTAPP_PERIPHERAL_PPC440_0_CC_SEARCH = # -B
TESTAPP_PERIPHERAL_PPC440_0_LIBPATH = -L./ppc440_0/lib/ # -L
TESTAPP_PERIPHERAL_PPC440_0_INCLUDES = -I./ppc440_0/include/  -ITestApp_Peripheral_ppc440_0/src/ # -I
TESTAPP_PERIPHERAL_PPC440_0_LFLAGS = # -l
TESTAPP_PERIPHERAL_PPC440_0_LINKER_SCRIPT = TestApp_Peripheral_ppc440_0/src/TestApp_Peripheral_LinkScr.ld
TESTAPP_PERIPHERAL_PPC440_0_LINKER_SCRIPT_FLAG = -Wl,-T -Wl,$(TESTAPP_PERIPHERAL_PPC440_0_LINKER_SCRIPT) 
TESTAPP_PERIPHERAL_PPC440_0_CC_DEBUG_FLAG =  -g 
TESTAPP_PERIPHERAL_PPC440_0_CC_PROFILE_FLAG = # -pg
TESTAPP_PERIPHERAL_PPC440_0_CC_GLOBPTR_FLAG= # -msdata=eabi
TESTAPP_PERIPHERAL_PPC440_0_CC_INFERRED_FLAGS= -mcpu=440 
TESTAPP_PERIPHERAL_PPC440_0_CC_START_ADDR_FLAG=  #  # -Wl,-defsym -Wl,_START_ADDR=
TESTAPP_PERIPHERAL_PPC440_0_CC_STACK_SIZE_FLAG=  #  # -Wl,-defsym -Wl,_STACK_SIZE=
TESTAPP_PERIPHERAL_PPC440_0_CC_HEAP_SIZE_FLAG=  #  # -Wl,-defsym -Wl,_HEAP_SIZE=
TESTAPP_PERIPHERAL_PPC440_0_OTHER_CC_FLAGS= $(TESTAPP_PERIPHERAL_PPC440_0_CC_GLOBPTR_FLAG)  \
                  $(TESTAPP_PERIPHERAL_PPC440_0_CC_START_ADDR_FLAG) $(TESTAPP_PERIPHERAL_PPC440_0_CC_STACK_SIZE_FLAG) $(TESTAPP_PERIPHERAL_PPC440_0_CC_HEAP_SIZE_FLAG)  \
                  $(TESTAPP_PERIPHERAL_PPC440_0_CC_INFERRED_FLAGS)  \
                  $(TESTAPP_PERIPHERAL_PPC440_0_LINKER_SCRIPT_FLAG) $(TESTAPP_PERIPHERAL_PPC440_0_CC_DEBUG_FLAG) $(TESTAPP_PERIPHERAL_PPC440_0_CC_PROFILE_FLAG) 