`timescale 1ns/1ps

module APBSlaveI (
    input wire PCLK, 
    input wire PRESET_n, 
    input wire PWRITE_i, 
    input wire PSEL_i, 
    input wire PENABLE_i, 
    input wire ss_i, 
    input wire receive_data_i, 
    input wire tip_i,
    input wire [2:0] PADDR_i,
    input wire [7:0] PWDATA_i, 
    input wire [7:0] miso_data_i,
    input wire [1:0] spi_mode_i,
    
    output reg [7:0] PRDATA_o,
    output reg mstr_o, 
    output reg cpol_o, 
    output reg cpha_o, 
    output reg lsbfe_o, 
    output reg spiswai_o, 
    output reg spi_interrupt_request_o, 
    output wire PREADY_o, 
    output wire PSLVERR_o, 
    output reg send_data_o,
    output reg spi_mode_o,
    output reg [7:0] mosi_data_o,
    output reg [2:0] spr_o, 
    output reg [2:0] sppr_o
);

    wire rd_enb, wr_enb;

    reg [7:0] SPI_CR_1;
    reg [7:0] SPI_CR_2;
    reg [7:0] SPI_BR;
    reg [7:0] SPI_DR;
    reg [7:0] SPI_SR;

    parameter cr2_mask = 8'b00011011;
    parameter br_mask  = 8'b01110111;

    reg spie, spe, sptie, modfen, ssoe;
    wire sptef, spif, modf;

    assign rd_enb = (PSEL_i & PENABLE_i & ~PWRITE_i);
    assign wr_enb = (PSEL_i & PENABLE_i &  PWRITE_i);

    assign PREADY_o  = (PSEL_i & PENABLE_i) ? 1'b1 : 1'b0;
    assign PSLVERR_o = (PSEL_i & PENABLE_i) ? tip_i : 1'b0;

    always @(posedge PCLK or negedge PRESET_n) begin
        if (~PRESET_n)
            SPI_CR_1 <= 8'h04;
        else if (wr_enb && PADDR_i == 3'b000)
            SPI_CR_1 <= PWDATA_i;
    end

    always @(posedge PCLK or negedge PRESET_n) begin
        if (~PRESET_n)
            SPI_CR_2 <= 8'h00;
        else if (wr_enb && PADDR_i == 3'b001)
            SPI_CR_2 <= PWDATA_i & cr2_mask;
    end

    always @(posedge PCLK or negedge PRESET_n) begin
        if (~PRESET_n)
            SPI_BR <= 8'h00;
        else if (wr_enb && PADDR_i == 3'b010)
            SPI_BR <= PWDATA_i & br_mask;
    end

    always @(posedge PCLK or negedge PRESET_n) begin
        if (~PRESET_n)
            SPI_DR <= 8'b0;
        else begin
            if (wr_enb && PADDR_i == 3'b101)
                SPI_DR <= PWDATA_i;
            else if (receive_data_i)
                SPI_DR <= miso_data_i;
        end
    end

    always @(posedge PCLK or negedge PRESET_n) begin
        if (~PRESET_n)
            SPI_SR <= 8'b00100000;
        else
            SPI_SR <= {spif, 1'b0, sptef, modf, 4'b0000};
    end

    always @(*) begin
        lsbfe_o   = SPI_CR_1[0];
        ssoe      = SPI_CR_1[1];
        cpha_o    = SPI_CR_1[2];
        cpol_o    = SPI_CR_1[3];
        mstr_o    = SPI_CR_1[4];
        sptie     = SPI_CR_1[5];
        spe       = SPI_CR_1[6];
        spie      = SPI_CR_1[7];

        spiswai_o = SPI_CR_2[1];
        modfen    = SPI_CR_2[4];

        sppr_o    = SPI_BR[6:4];
        spr_o     = SPI_BR[2:0];

        spi_mode_o = spe & mstr_o;

        if (rd_enb) begin
            case (PADDR_i)
                3'b000: PRDATA_o = SPI_CR_1;
                3'b001: PRDATA_o = SPI_CR_2;
                3'b010: PRDATA_o = SPI_BR;
                3'b011: PRDATA_o = SPI_SR;
                3'b101: PRDATA_o = SPI_DR;
                default: PRDATA_o = 8'h00;
            endcase
        end else begin
            PRDATA_o = 8'h00;
        end

        if (!spie && !sptie)
            spi_interrupt_request_o = 1'b0;
        else if (!sptie && spie)
            spi_interrupt_request_o = spif | modf;
        else if (sptie && !spie)
            spi_interrupt_request_o = sptef;
        else
            spi_interrupt_request_o = spif | modf | sptef;
    end

    assign sptef = (SPI_DR == 8'b0);
    assign spif  = (SPI_DR != 8'b0);
    assign modf  = ~ss_i & mstr_o & modfen & ~ssoe;

    always @(posedge PCLK or negedge PRESET_n) begin
        if (~PRESET_n)
            send_data_o <= 1'b0;
        else if (wr_enb && (PADDR_i == 3'b101))
            send_data_o <= 1'b1;
        else if(receive_data_i)
            send_data_o <= 1'b0;
    end

    always @(posedge PCLK or negedge PRESET_n) begin
        if (~PRESET_n)
            mosi_data_o <= 8'b0;
        else if (wr_enb && (PADDR_i == 3'b101))
            mosi_data_o <= PWDATA_i;
    end

endmodule