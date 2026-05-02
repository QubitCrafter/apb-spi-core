module Slave_select #(parameter number_of_bits = 9) (
    input wire PCLK,
    input wire PRESET_n,
    input wire mstr_i,
    input wire spiswai_i,
    input wire [1:0] spi_mode_i,
    input wire send_data_i,
    input wire [11:0] BaudRateDivisor_i,
    output reg receive_data_o,
    output reg ss_o,
    output wire tip_o
);

    wire mode_o;
    wire [14:0] target;
    reg [15:0] count;

    assign target = BaudRateDivisor_i * number_of_bits;

    assign mode_o =
    ((spi_mode_i == 2'b00) | (spi_mode_i == 2'b01)) &
    (~spiswai_i) &
    (mstr_i) & (send_data_i);

    always @(posedge PCLK or negedge PRESET_n) begin
        if (~PRESET_n)
            count <= 16'd0;
        else if (~mode_o)
            count <= 16'd0;
        else begin
            if (count == target - 1)
                count <= 16'd0;
            else
                count <= count + 1'b1;
        end
    end

    always @(posedge PCLK or negedge PRESET_n) begin
        if (~PRESET_n)
            ss_o <= 1'b1;
        else if (~mode_o)
            ss_o <= 1'b1;
        else
            ss_o <= 1'b0;
    end

    always @(posedge PCLK or negedge PRESET_n) begin
        if (~PRESET_n)
            receive_data_o <= 1'b0;
        else if (count == target - 1)
            receive_data_o <= 1'b1;
        else
            receive_data_o <= 1'b0;
    end

    assign tip_o = ~ss_o;

endmodule
