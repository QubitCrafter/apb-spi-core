set_app_var enable_lint true

configure_lint_setup -goal lint_rtl

analyze -verbose -format verilog "../rtl/APBSlaveI.v"
analyze -verbose -format verilog "../rtl/BaudRateGen.v"
analyze -verbose -format verilog "../rtl/ShiftReg.v"
analyze -verbose -format verilog "../rtl/Slave_select.v"
analyze -verbose -format verilog "../rtl/spi_core.v"

elaborate spi_core
configure_lint_tag -disable -tag "W240" -goal lint_rtl
check_lint

report_violations -verbose -file report_lint_apb_spi.txt
