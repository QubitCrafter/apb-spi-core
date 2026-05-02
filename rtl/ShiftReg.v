module ShiftReg (
    input wire PCLK,
    input wire PRESET_n,
    input wire ss_i,
    input wire send_data_i,
    input wire lsbfe_i,
    input wire cpha_i,
    input wire cpol_i,
    input wire miso_receive_sclk0_i,
    input wire miso_receive_sclk_i,
    input wire mosi_send_sclk0_i,
    input wire mosi_send_sclk_i,
    input wire [7:0] data_mosi_i,
    input wire miso_i,
    input wire receive_data_i,
    output reg mosi_o,
    output wire [7:0] data_miso_o
);

reg [7:0] temp_reg, shift_reg;
reg [2:0] count, count1, count2, count3;

always @(posedge PCLK or negedge PRESET_n) begin
    if (~PRESET_n) begin
        count  <= 3'd0;
        count1 <= 3'd7;
        mosi_o <= 1'b0;
    end else begin
        if (ss_i) begin
            count  <= 3'd0;
            count1 <= 3'd7;
        end else begin
            if ((!cpha_i && cpol_i) || (!cpol_i && cpha_i)) begin
                if (lsbfe_i) begin
                    if (count <= 3'd7) begin
                        if (mosi_send_sclk_i) begin
                            mosi_o <= shift_reg[count];
                            count  <= count + 1'b1;
                        end
                    end else begin
                        count <= 3'd0;
                    end
                end else begin
                    if (mosi_send_sclk_i) begin
                        mosi_o <= shift_reg[count1];
                        count1 <= count1 - 1'b1;
                    end
                end
            end else begin
                if (lsbfe_i) begin
                    if (count <= 3'd7) begin
                        if (mosi_send_sclk0_i) begin
                            mosi_o <= shift_reg[count];
                            count  <= count + 1'b1;
                        end
                    end else begin
                        count <= 3'd0;
                    end
                end else begin
                    if (mosi_send_sclk0_i) begin
                        mosi_o <= shift_reg[count1];
                        count1 <= count1 - 1'b1;
                    end
                end
            end
        end
    end
end

always @(posedge PCLK or negedge PRESET_n) begin
    if (~PRESET_n) begin
        count2   <= 3'd0;
        count3   <= 3'd7;
        temp_reg <= 8'd0;
    end else begin
        if (ss_i) begin
            count2   <= 3'd0;
            count3   <= 3'd7;
            temp_reg <= 8'd0;
        end else begin
            if ((!cpha_i && cpol_i) || (!cpol_i && cpha_i)) begin
                if (lsbfe_i) begin
                    if (count2 <= 3'd7) begin
                        if (miso_receive_sclk0_i) begin
                            temp_reg[7 - count2] <= miso_i;
                            count2 <= count2 + 1'b1;
                        end
                    end else begin
                        count2 <= 3'd0;
                    end
                end else begin
                    if (miso_receive_sclk0_i) begin
                        temp_reg[count3] <= miso_i;
                        count3 <= count3 - 1'b1;
                    end
                end
            end else begin
                if (lsbfe_i) begin
                    if (count2 <= 3'd7) begin
                        if (miso_receive_sclk_i) begin
                            temp_reg[7 - count2] <= miso_i;
                            count2 <= count2 + 1'b1;
                        end
                    end else begin
                        count2 <= 3'd0;
                    end
                end else begin
                    if (miso_receive_sclk_i) begin
                        temp_reg[count3] <= miso_i;
                        count3 <= count3 - 1'b1;
                    end
                end
            end
        end
    end
end

always @(posedge PCLK or negedge PRESET_n) begin
    if (~PRESET_n) begin
        shift_reg <= 8'd0;
    end else begin
        if (send_data_i)
            shift_reg <= data_mosi_i;
        else
            shift_reg <= shift_reg;
    end
end

assign data_miso_o = receive_data_i ? temp_reg : 8'd0;

endmodule
