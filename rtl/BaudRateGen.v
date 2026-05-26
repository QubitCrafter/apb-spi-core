module BaudRateGen (
    input  wire        PCLK,
    input  wire        PRESET_n,
    input  wire        spiswai_i,
    input  wire        cpol_i,
    input  wire        cpha_i,
    input  wire        ss_i,
    input  wire  [2:0] sppr_i,
    input  wire  [2:0] spr_i,
    input  wire  [1:0] spi_mode_i,
    output reg         sclk_o, 
    output reg         miso_receive_sclk_o,
    output reg         miso_receive_sclk0_o,
    output reg         mosi_send_sclk_o,
    output reg         mosi_send_sclk0_o,
    output wire [11:0] BaudRateDivisor_o
);

    wire mode_o, pre_sclk;
    wire [11:0] target_count; 
    reg  [11:0] count;

    assign pre_sclk = cpol_i;
    assign BaudRateDivisor_o = (sppr_i + 12'd1) * (12'd1 << ({1'b0, spr_i} + 4'd1));
    assign target_count = (BaudRateDivisor_o >> 1) - 12'd1;
    assign mode_o = ((spi_mode_i == 2'b00) | (spi_mode_i == 2'b01)) & (~ss_i) & (~spiswai_i);

    always @(posedge PCLK or negedge PRESET_n) begin
        if (!PRESET_n)
            count <= 12'd0;
        else if (!mode_o)
            count <= 12'd0;
        else if (count == target_count)
            count <= 12'd0;
        else
            count <= count + 1'b1;
    end

    always @(posedge PCLK or negedge PRESET_n) begin
        if (!PRESET_n)
            sclk_o <= pre_sclk;
        else if (!mode_o)
            sclk_o <= pre_sclk;
        else if (count == target_count)
            sclk_o <= ~sclk_o;
    end
    
    always @(posedge PCLK or negedge PRESET_n) begin
        if (~PRESET_n) begin
            miso_receive_sclk0_o <= 1'b0;
            miso_receive_sclk_o <= 1'b0;
        end else begin
            miso_receive_sclk0_o <= 1'b0;
            miso_receive_sclk_o <= 1'b0;
            if ((!cpha_i && cpol_i) || (!cpol_i && cpha_i)) begin
                if (sclk_o) begin
                    if (count == target_count) begin
                        miso_receive_sclk0_o <= 1'b1;
                    end else if(miso_receive_sclk0_o) begin
                        miso_receive_sclk0_o <= 1'b0;
                    end
                end else begin
                    miso_receive_sclk0_o <= 1'b0;
                end
            end else begin 
                if (sclk_o) begin
                    miso_receive_sclk_o <= 1'b0;
                end else begin
                    if (count == target_count) begin
                        miso_receive_sclk_o <= 1'b1;
                    end else if(miso_receive_sclk_o) begin
                        miso_receive_sclk_o <= 1'b0;
                    end
                end
            end
        end
    end

      always @(posedge PCLK or negedge PRESET_n) begin
        if (~PRESET_n) begin
            mosi_send_sclk0_o <= 1'b0;
            mosi_send_sclk_o <= 1'b0;
        end else begin
            mosi_send_sclk0_o <= 1'b0;
            mosi_send_sclk_o <= 1'b0;
            if ((!cpha_i && cpol_i) || (!cpol_i && cpha_i)) begin
                if (sclk_o) begin
                    if (count == target_count - 1) begin
                        mosi_send_sclk_o <= 1'b1;
                    end else if (count == 0)begin
                        mosi_send_sclk_o <= 1'b0;
                    end
                end else begin
                    mosi_send_sclk_o <= 1'b0;
                end
            end else begin 
                if (sclk_o) begin
                    mosi_send_sclk0_o <= 1'b0;
                end else begin
                    if (count == target_count - 1) begin
                        mosi_send_sclk0_o <= 1'b1;
                    end else if (count ==  0) begin
                        mosi_send_sclk0_o <= 1'b0;
                    end
                end
            end
        end
    end
    
endmodule