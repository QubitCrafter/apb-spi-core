`timescale 1ns / 1ps

module shift_register_tb();

    reg PCLK;
    reg PRESET_n;
    reg ss_i;
    reg send_data_i;
    reg lsbfe_i;
    reg cpha_i;
    reg cpol_i;
    reg receive_data_i;
    reg [7:0] data_mosi_i;
    reg miso_i;
    
    reg spiswai_i;
    reg [2:0] sppr_i;
    reg [2:0] spr_i;
    reg [1:0] spi_mode_i;

    wire miso_receive_sclk_wire;  
    wire miso_receive_sclk0_wire; 
    wire mosi_send_sclk_wire;     
    wire mosi_send_sclk0_wire;    
    wire sclk_wire; 

    wire mosi_o;
    wire [7:0] data_miso_o;
    wire [11:0] baud_rate_divisor_wire;

    BaudRateGen baud_gen_inst (
        .PCLK(PCLK),
        .PRESET_n(PRESET_n),
        .spiswai_i(spiswai_i),
        .cpol_i(cpol_i),
        .cpha_i(cpha_i),
        .ss_i(ss_i),
        .sppr_i(sppr_i),
        .spr_i(spr_i),
        .spi_mode_i(spi_mode_i),
        .sclk_o(sclk_wire), 
        .miso_receive_sclk_o(miso_receive_sclk_wire),
        .miso_receive_sclk0_o(miso_receive_sclk0_wire),
        .mosi_send_sclk_o(mosi_send_sclk_wire),
        .mosi_send_sclk0_o(mosi_send_sclk0_wire),
        .BaudRateDivisor_o(baud_rate_divisor_wire)
    );

    ShiftReg dut (
        .PCLK(PCLK), 
        .PRESET_n(PRESET_n), 
        .ss_i(ss_i), 
        .send_data_i(send_data_i), 
        .lsbfe_i(lsbfe_i), 
        .cpha_i(cpha_i), 
        .cpol_i(cpol_i), 
        .receive_data_i(receive_data_i), 
        .data_mosi_i(data_mosi_i), 
        .miso_i(miso_i),
        .miso_receive_sclk_i(miso_receive_sclk_wire),
        .miso_receive_sclk0_i(miso_receive_sclk0_wire),
        .mosi_send_sclk_i(mosi_send_sclk_wire),
        .mosi_send_sclk0_i(mosi_send_sclk0_wire),
        .mosi_o(mosi_o), 
        .data_miso_o(data_miso_o)
    );

    initial begin
        PCLK = 1'b0;
        forever #5 PCLK = ~PCLK;
    end

    task reset;
    begin
        @(negedge PCLK)
        PRESET_n = 1'b0;
        @(negedge PCLK)
        PRESET_n = 1'b1;
    end
    endtask

    task initialize;
    begin
        PRESET_n = 1'b0;
        ss_i = 1'b1;
        send_data_i = 1'b0;
        lsbfe_i = 1'b0;
        cpha_i = 1'b0;
        cpol_i = 1'b0;
        receive_data_i = 1'b0;
        data_mosi_i = 8'd0;
        miso_i = 1'b0;
        
        spiswai_i = 1'b0;
        sppr_i = 3'd1;
        spr_i = 3'd1;
        spi_mode_i = 2'b00;
    end
    endtask

    task send_spi_data(input [7:0] spi_data, input lsb_first);
    begin
        send_data_i = 1;
        data_mosi_i = spi_data;
        lsbfe_i = lsb_first;
        #10;
        send_data_i = 0;
    end
    endtask

    task spi_transfer(input ss_active);
    begin
        ss_i = ss_active;
        #2000;
        ss_i = 1;
    end
    endtask

    initial begin
        $dumpfile("Shift_reg.vcd");
        $dumpvars(0, shift_register_tb);

        initialize;

        reset;

        $display($time, " Starting Test Case 1");
        send_spi_data(8'hA5, 1);
        receive_data_i = 0;
        miso_i = 1;
        cpol_i = 1'b0; 
        cpha_i = 1'b1;
        
        spi_transfer(0); 
        receive_data_i = 1;

        $display($time, " All test cases completed");
        #150 $finish;
    end

endmodule