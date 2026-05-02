`timescale 1ns / 1ps

module BaudRateGen_tb ();
    reg PCLK;
    reg PRESET_n;
    reg spiswai_i;
    reg cpol_i;
    reg cpha_i;
    reg ss_i;
    reg [2:0] sppr_i;
    reg [2:0] spr_i;
    reg [1:0] spi_mode_i;
    
    wire sclk_o; 
    wire miso_receive_sclk_o;
    wire miso_receive_sclk0_o;
    wire mosi_send_sclk_o;
    wire mosi_send_sclk0_o;
    wire [11:0] BaudRateDivisor_o;

    BaudRateGen DUT (
        .PCLK(PCLK), 
        .PRESET_n(PRESET_n), 
        .spiswai_i(spiswai_i), 
        .cpha_i(cpha_i), 
        .cpol_i(cpol_i), 
        .ss_i(ss_i), 
        .sppr_i(sppr_i), 
        .spr_i(spr_i), 
        .spi_mode_i(spi_mode_i), 
        .sclk_o(sclk_o), 
        .miso_receive_sclk_o(miso_receive_sclk_o), 
        .miso_receive_sclk0_o(miso_receive_sclk0_o), 
        .mosi_send_sclk_o(mosi_send_sclk_o), 
        .mosi_send_sclk0_o(mosi_send_sclk0_o), 
        .BaudRateDivisor_o(BaudRateDivisor_o)
    );

    always #5 PCLK = ~PCLK; 

    initial begin
        $dumpfile("BaudRate.vcd");
        $dumpvars(0, BaudRateGen_tb);
        
        PCLK = 0; 
        PRESET_n = 0;
        spi_mode_i = 2'b00;
        spiswai_i = 0;
        sppr_i = 3'b010; 
        spr_i = 3'b001;  
        cpha_i = 1;
        cpol_i = 0;
        ss_i = 1;        
        #20; 
        PRESET_n = 1; 
        ss_i = 0;
        #500;
        ss_i = 1;
        #20;
        cpha_i = 1;
        cpol_i = 1;
        ss_i = 0;
        #500;

        $finish();
    end

endmodule