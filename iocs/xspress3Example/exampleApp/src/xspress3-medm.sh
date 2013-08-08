#!/bin/bash

prefix=$(XSPRESS3_PREFIX)

declare -A locations
locations[XSPRESS3]=$(XSPRESS3)
locations[AREADETECTOR]=$(AREADETECTOR)
locations[DEVIOCSTATS]=$(DEVIOCSTATS)
locations[ASYN]=$(ASYN)
locations[SPECTRAPLUGINS]=$(SPECTRAPLUGINS)

# Default edl display locations in source tree
declare -A adls
adls[XSPRESS3]=xspress3App/opi/adl/xspress3.adl
adls[AREADETECTOR]=ADApp/op/adl/ADBase.adl
adls[DEVIOCSTATS]=op/adl/ioc_stats_soft.edl
adls[ASYN]=opi/medm/asynRecord.edl
adls[SPECTRAPLUGINS]=spectraPluginsApp/opi/adl/NDAttribute.edl

# The $ escapes the MSI macro substitution
for module in "\${!locations[@]}" ; do
    if [ -f \${locations[\$module]}/data/\$(basename \${adls[\$module]}) ] ; then
        EPICS_DISPLAY_PATH=\$EPICS_DISPLAY_PATH:\${locations[\$module]}/data
    else
        EPICS_DISPLAY_PATH=\$EPICS_DISPLAY_PATH:\${locations[\$module]}/\$(dirname \${adls[\$module]})
    fi
done

EPICS_DISPLAY_PATH=\${EPICS_DISPLAY_PATH#:}
export EPICS_DISPLAY_PATH

medm -x -macro "P=\$prefix" xspress3.adl &
medm -x -macro "ioc=\$prefix" ioc_stats_soft.adl &
echo \$EPICS_DISPLAY_PATH