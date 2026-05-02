module spi_core #(
    parameter ADDR_WIDTH = 3,
    parameter DATA_WIDTH = 8
)(
    input  wire                  PCLK,
    input  wire                  PRESET_n,
    input  wire [ADDR_WIDTH-1:0] PADDR_i,
    input  wire                  PWRITE_i,
    input  wire                  PSEL_i,
    input  wire                  PENABLE_i,
    input  wire [DATA_WIDTH-1:0] PWDATA_i,
    input  wire                  miso_i,
    input  wire [1:0]            spi_mode_i,

    output wire [DATA_WIDTH-1:0] PRDATA_o,
    output wire                  PREADY_o,
    output wire                  PSLVERR_o,
    output wire                  ss_o,
    output wire                  sclk_o,
    output wire                  spi_interrupt_request_o,
    output wire                  mosi_o
);

    wire [DATA_WIDTH-1:0] data_miso_s;
    wire [DATA_WIDTH-1:0] data_mosi_s;

    wire [2:0] spr_s, sppr_s;
    wire [11:0] baud_div_s;

    wire send_data_s, receive_data_s, tip_s;

    wire mstr_s, cpol_s, cpha_s, lsbfe_s, spiswai_s;
    wire miso_rec_sclk_s, miso_rec_sclk0_s;
    wire mosi_snd_sclk_s, mosi_snd_sclk0_s;

    wire spi_mode_s;

    // ================= APB INTERFACE =================
    APBSlaveI apb_interface (
        .PCLK(PCLK),
        .PRESET_n(PRESET_n),
        .PWRITE_i(PWRITE_i),
        .PSEL_i(PSEL_i),
        .PENABLE_i(PENABLE_i),
        .ss_i(ss_o),
        .receive_data_i(receive_data_s),
        .tip_i(tip_s),
        .PADDR_i(PADDR_i),
        .PWDATA_i(PWDATA_i),
        .miso_data_i(data_miso_s),
        .spi_mode_i(spi_mode_i),

        .PRDATA_o(PRDATA_o),
        .mstr_o(mstr_s),
        .cpol_o(cpol_s),
        .cpha_o(cpha_s),
        .lsbfe_o(lsbfe_s),
        .spiswai_o(spiswai_s),
        .spi_interrupt_request_o(spi_interrupt_request_o),
        .PREADY_o(PREADY_o),
        .PSLVERR_o(PSLVERR_o),
        .send_data_o(send_data_s),
        .spi_mode_o(spi_mode_s),
        .mosi_data_o(data_mosi_s),
        .spr_o(spr_s),
        .sppr_o(sppr_s)
    );

    // ================= BAUD GENERATOR =================
    BaudRateGen baud_generator (
        .PCLK(PCLK),
        .PRESET_n(PRESET_n),
        .spiswai_i(spiswai_s),
        .cpol_i(cpol_s),
        .cpha_i(cpha_s),
        .ss_i(ss_o),
        .sppr_i(sppr_s),
        .spr_i(spr_s),
        .spi_mode_i(spi_mode_s),   // ✔ FIXED
        .sclk_o(sclk_o),
        .miso_receive_sclk_o(miso_rec_sclk_s),
        .miso_receive_sclk0_o(miso_rec_sclk0_s),
        .mosi_send_sclk_o(mosi_snd_sclk_s),
        .mosi_send_sclk0_o(mosi_snd_sclk0_s),
        .BaudRateDivisor_o(baud_div_s)
    );

    // ================= SHIFT REGISTER =================
    ShiftReg shift_register (
        .PCLK(PCLK),
        .PRESET_n(PRESET_n),
        .ss_i(ss_o),
        .send_data_i(send_data_s),
        .lsbfe_i(lsbfe_s),
        .cpha_i(cpha_s),
        .cpol_i(cpol_s),
        .miso_receive_sclk0_i(miso_rec_sclk0_s),
        .miso_receive_sclk_i(miso_rec_sclk_s),
        .mosi_send_sclk0_i(mosi_snd_sclk0_s),
        .mosi_send_sclk_i(mosi_snd_sclk_s),
        .data_mosi_i(data_mosi_s),
        .miso_i(miso_i),
        .receive_data_i(receive_data_s),
        .mosi_o(mosi_o),
        .data_miso_o(data_miso_s)
    );

    // ================= SLAVE SELECT =================
    Slave_select #(.number_of_bits(DATA_WIDTH)) slave_control (
        .PCLK(PCLK),
        .PRESET_n(PRESET_n),
        .mstr_i(mstr_s),
        .spiswai_i(spiswai_s),
        .spi_mode_i(spi_mode_s),   
        .send_data_i(send_data_s),
        .BaudRateDivisor_i(baud_div_s),
        .receive_data_o(receive_data_s),
        .ss_o(ss_o),
        .tip_o(tip_s)
    );

endmodule