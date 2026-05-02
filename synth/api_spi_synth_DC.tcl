remove_design -all
set search_path {../lib}
set target_library {lsi_10k.db}
set link_library "* lsi_10k.db"

analyze -format verilog ../rtl/APBSlaveI.v
analyze -format verilog ../rtl/BaudRateGen.v
analyze -format verilog ../rtl/ShiftReg.v
analyze -format verilog ../rtl/Slave_select.v
analyze -format verilog ../rtl/spi_core.v

elaborate spi_core
link
check_design
current_design spi_core
source ../lib/spi.con

# Preserve hierarchy — prevents flattening
set_dont_touch [get_cells apb_interface]
set_dont_touch [get_cells baud_generator]
set_dont_touch [get_cells shift_register]
set_dont_touch [get_cells slave_select]

compile_ultra -no_autoungroup

write_file -f verilog -hier -output spi_core_netlist.v
report_area > report_area_dc.txt
report_timing > report_timing_dc.txt
report_power > report_power_dc.txt
