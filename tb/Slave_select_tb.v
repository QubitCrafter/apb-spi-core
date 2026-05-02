module Slave_select_tb ();
    reg PCLK;
    reg PRESET_n;
    reg mstr_i;
    reg spiswai_i;
    reg [1:0] spi_mode_i;
    reg send_data_i;
    reg [11:0]BaudRateDivisor_i;
    wire receive_data_o;
    wire ss_o;
    wire tip_o;

    Slave_select DUT(
        .PCLK(PCLK),
        .PRESET_n(PRESET_n),
        .mstr_i(mstr_i),
        .spiswai_i(spiswai_i),
        .spi_mode_i(spi_mode_i),
        .send_data_i(send_data_i),
        .BaudRateDivisor_i(BaudRateDivisor_i),
        .receive_data_o(receive_data_o),
        .ss_o(ss_o),
        .tip_o(tip_o)
    );

    always #1 PCLK = ~PCLK;

    initial begin 
        $dumpfile("Slave_sel.vcd");
        $dumpvars(0, Slave_select_tb);
        PCLK = 0; 
        PRESET_n = 0;
        spi_mode_i = 2'b00;
        spiswai_i = 0; 
        mstr_i = 0;    
        send_data_i = 0;    
        BaudRateDivisor_i = 12'd12; 
        #20; 
        PRESET_n = 1; 
        #50;
        mstr_i = 1;
        send_data_i = 1;
        #10; 
        send_data_i = 0;
        #1500
        $finish;
    end
endmodule