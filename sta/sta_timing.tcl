read_liberty ../lib/asap7_merged_RVT_TT.lib
read_verilog ../synth/spi_core_netlist_asap7.v
link_design spi_core

create_clock -name my_clk -period 20000 [get_ports PCLK]

# Realistic 7nm uncertainties (ps)
set_clock_uncertainty -setup  50 [get_clocks my_clk]
set_clock_uncertainty -hold   20 [get_clocks my_clk]
set_clock_transition          30 [get_clocks my_clk]

foreach port [all_inputs] {
    if {[get_property $port name] ne "PCLK"} {
        set_input_delay -max 4000 -clock my_clk $port
        set_input_delay -min  500 -clock my_clk $port
    }
}

set_output_delay -max 4000 -clock my_clk [all_outputs]
set_output_delay -min  500 -clock my_clk [all_outputs]

set_load 0.1 [all_outputs]

puts "\n==== SETUP TIMING (MAX) ===="
report_checks -path_delay max \
    -format full_clock_expanded \
    -fields {slew cap input net} \
    -digits 4

puts "\n==== HOLD TIMING (MIN) ===="
report_checks -path_delay min \
    -fields {slew cap input net} \
    -digits 4

puts "\n==== WNS ===="
report_wns

puts "\n==== TNS ===="
report_tns

puts "\n==== POWER ===="
report_power

puts "\nDone."
exit
