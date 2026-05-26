`timescale 1ns/1ps
module spi_core_tb;
reg PCLK = 0;
reg PRESET_n = 0;
reg [2:0] PADDR_i = 0;
reg PWRITE_i = 0;
reg PSEL_i = 0;
reg PENABLE_i = 0;
reg [7:0] PWDATA_i = 0;
reg [1:0] spi_mode_i = 2'b00;
wire [7:0] PRDATA_o;
wire PREADY_o;
wire PSLVERR_o;
wire ss_o;
wire sclk_o;
wire spi_interrupt_request_o;
wire mosi_o;
reg miso_i;
spi_core dut (
    .PCLK(PCLK),
    .PRESET_n(PRESET_n),
    .PADDR_i(PADDR_i),
    .PWRITE_i(PWRITE_i),
    .PSEL_i(PSEL_i),
    .PENABLE_i(PENABLE_i),
    .PWDATA_i(PWDATA_i),
    .miso_i(miso_i),
    .spi_mode_i(spi_mode_i),
    .PRDATA_o(PRDATA_o),
    .PREADY_o(PREADY_o),
    .PSLVERR_o(PSLVERR_o),
    .ss_o(ss_o),
    .sclk_o(sclk_o),
    .spi_interrupt_request_o(spi_interrupt_request_o),
    .mosi_o(mosi_o)
);
always #5 PCLK = ~PCLK;

task apb_write(input [2:0] addr, input [7:0] data);
begin
    @(posedge PCLK);
    PADDR_i = addr;
    PWDATA_i = data;
    PWRITE_i = 1;
    PSEL_i = 1;
    PENABLE_i = 0;
    @(posedge PCLK);
    PENABLE_i = 1;
    @(posedge PCLK);
    PSEL_i = 0;
    PENABLE_i = 0;
    PWRITE_i = 0;
end
endtask

task apb_read(input [2:0] addr, output [7:0] data);
begin
    @(posedge PCLK);
    PADDR_i = addr;
    PWRITE_i = 0;
    PSEL_i = 1;
    PENABLE_i = 0;
    @(posedge PCLK);
    PENABLE_i = 1;
    @(posedge PCLK);
    data = PRDATA_o;
    PSEL_i = 0;
    PENABLE_i = 0;
end
endtask
task drive_miso(input [7:0] data, input cpol, input cpha);
integer i;
begin
    if (!cpha) begin
        // CPHA=0: drive MSB when SS goes low, change on trailing edge
        miso_i = data[7];
        for (i = 6; i >= 0; i = i - 1) begin
            if (!cpol) @(negedge sclk_o);  // Mode 0: trailing = negedge
            else       @(posedge sclk_o);  // Mode 2: trailing = posedge
            miso_i = data[i];
        end
    end else begin
        // CPHA=1: drive all bits on the leading (active) edge
        for (i = 7; i >= 0; i = i - 1) begin
            if (!cpol) @(posedge sclk_o);  // Mode 1: leading = posedge
            else       @(negedge sclk_o);  // Mode 3: leading = negedge
            miso_i = data[i];
        end
    end
end
endtask
task run_case(
    input [7:0] SCR1,
    input [1:0] mode,
    input [7:0] tx_data,   
    input [7:0] rx_data,   
    input [7:0] br
);
reg [7:0] rdata;
reg cpol, cpha;
begin
    cpol = SCR1[3];
    cpha = SCR1[2];
    spi_mode_i = mode;
    apb_write(3'b000, SCR1);
    apb_write(3'b010, br);
    apb_write(3'b101, tx_data);
    wait(ss_o == 0);
    fork
        drive_miso(rx_data, cpol, cpha);   
        begin
            wait(ss_o == 1);
        end
    join
    repeat(10) @(posedge PCLK);
    apb_read(3'b101, rdata);
    if (rdata === rx_data)
        $display("PASS | MODE=%0d TX=%h RX=%h", mode, tx_data, rdata);
    else
        $display("FAIL | MODE=%0d TX=%h EXPECTED=%h GOT=%h",
                 mode, tx_data, rx_data, rdata);
    repeat(20) @(posedge PCLK);
end
endtask
initial begin
    $dumpfile("spi_full.vcd");
    $dumpvars(0, spi_core_tb);
    miso_i = 0;
    #20 PRESET_n = 1;
    repeat(5) @(posedge PCLK);
    $display("=== FULL DUPLEX TEST ===");
    run_case(8'h50, 0, 8'hA5, 8'h3C, 8'h01);
    run_case(8'h54, 1, 8'h55, 8'hAA, 8'h01);
    run_case(8'h58, 2, 8'hF0, 8'h0F, 8'h01);
    run_case(8'h5C, 3, 8'hC3, 8'h5A, 8'h01);
//    $display("=== PATTERN TESTS ===");
//    run_case(8'h50, 0, 8'h00, 8'h01, 8'h01);
//    run_case(8'h50, 0, 8'hFF, 8'h01, 8'h01);
//    run_case(8'h50, 0, 8'hAA, 8'h01, 8'h01);
//    run_case(8'h50, 0, 8'h55, 8'h01, 8'h01);
    
    $display("=== BAUD RATE TESTS ===");
    run_case(8'h50, 0, 8'hA5, 8'h00, 8'h00);
    run_case(8'h50, 0, 8'hA5, 8'h03, 8'h03);
    run_case(8'h50, 0, 8'hA5, 8'h07, 8'h07);
    
//    $display("=== BACK-TO-BACK TEST ===");
//    run_case(8'h50, 0, 8'h12, 8'h01, 8'h01);
//    run_case(8'h50, 0, 8'h34, 8'h01, 8'h01);
//    run_case(8'h50, 0, 8'h56, 8'h01, 8'h01);
    
//    $display("=== RESET TEST ===");
//    PRESET_n = 0;
//    repeat(3) @(posedge PCLK);
//    PRESET_n = 1;
//    repeat(5) @(posedge PCLK);
//    run_case(8'h50, 0, 8'hA5, 8'h01, 8'h01);
    
    $display("=== ALL TESTS DONE ===");
    #100 $finish;
    
    #200 $finish;
end
endmodule