# This file was automatically generated on Mon 15 Dec 2014 18:37:18 GMT from
# source: /home/npr78/diamond/support/xspress3/etc/makeIocs/example4Channel.xml
# 
# *** Please do not edit this file: edit the source file instead. ***
# 
TOP = ../..
include $(TOP)/configure/CONFIG

PROD_NAME = xspress3App
PROD_IOC_Linux  += $(PROD_NAME)

DBD += $(PROD_NAME).dbd

$(PROD_NAME)_DBD += xspress3Support.dbd
$(PROD_NAME)_SRCS += $(PROD_NAME)_registerRecordDeviceDriver.cpp $(PROD_NAME)Main.cpp
#$(PROD_NAME)_LIBS += spectraPlugins
$(PROD_NAME)_LIBS += xspress3Epics
$(PROD_NAME)_LIBS += xspress3
$(PROD_NAME)_LIBS += img_mod


include $(ADCORE)/ADApp/commonDriverMakefile

include $(TOP)/configure/RULES

SCRIPTS += xspress3-medm.sh xspress3-edm.sh
SYS_BOOT_FLAGS+=-MXSPRESS3=$(abspath $(XSPRESS3))
SYS_BOOT_FLAGS+=-MXSPRESS3_PREFIX=$(XSPRESS3_PREFIX)
%.sh: ../%.sh
	$(MSI) $(SYS_BOOT_FLAGS) $< | sed 's/\\\$$/$$/g' > $@
