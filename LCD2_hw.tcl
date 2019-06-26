# TCL File Generated by Component Editor 13.0sp1
# Tue Jun 25 14:54:25 AMT 2019
# DO NOT MODIFY


# 
# LCD2 "LCD2" v1.0
#  2019.06.25.14:54:25
# 
# 

# 
# request TCL package from ACDS 13.1
# 
package require -exact qsys 13.1


# 
# module LCD2
# 
set_module_property DESCRIPTION ""
set_module_property NAME LCD2
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME LCD2
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL lcd
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file LCD.v VERILOG PATH LCD.v TOP_LEVEL_FILE


# 
# parameters
# 


# 
# display items
# 


# 
# connection point conduit_end
# 
add_interface conduit_end conduit end
set_interface_property conduit_end associatedClock ""
set_interface_property conduit_end associatedReset ""
set_interface_property conduit_end ENABLED true
set_interface_property conduit_end EXPORT_OF ""
set_interface_property conduit_end PORT_NAME_MAP ""
set_interface_property conduit_end SVD_ADDRESS_GROUP ""

add_interface_port conduit_end enable export Output 1
add_interface_port conduit_end dataout export Output 10


# 
# connection point nios_custom_instruction_slave
# 
add_interface nios_custom_instruction_slave nios_custom_instruction end
set_interface_property nios_custom_instruction_slave clockCycle 0
set_interface_property nios_custom_instruction_slave operands 2
set_interface_property nios_custom_instruction_slave ENABLED true
set_interface_property nios_custom_instruction_slave EXPORT_OF ""
set_interface_property nios_custom_instruction_slave PORT_NAME_MAP ""
set_interface_property nios_custom_instruction_slave SVD_ADDRESS_GROUP ""

add_interface_port nios_custom_instruction_slave dataa dataa Input 32
add_interface_port nios_custom_instruction_slave datab datab Input 32
add_interface_port nios_custom_instruction_slave clk clk Input 1
add_interface_port nios_custom_instruction_slave clk_en clk_en Input 1
