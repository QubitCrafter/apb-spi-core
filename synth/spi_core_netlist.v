

module APBSlaveI ( PCLK, PRESET_n, PWRITE_i, PSEL_i, PENABLE_i, ss_i,
        receive_data_i, tip_i, PADDR_i, PWDATA_i, miso_data_i, spi_mode_i,
        PRDATA_o, mstr_o, cpol_o, cpha_o, lsbfe_o, spiswai_o,
        spi_interrupt_request_o, PREADY_o, PSLVERR_o, send_data_o, spi_mode_o,
        mosi_data_o, spr_o, sppr_o );
  input [2:0] PADDR_i;
  input [7:0] PWDATA_i;
  input [7:0] miso_data_i;
  input [1:0] spi_mode_i;
  output [7:0] PRDATA_o;
  output [1:0] spi_mode_o;
  output [7:0] mosi_data_o;
  output [2:0] spr_o;
  output [2:0] sppr_o;
  input PCLK, PRESET_n, PWRITE_i, PSEL_i, PENABLE_i, ss_i, receive_data_i,
         tip_i;
  output mstr_o, cpol_o, cpha_o, lsbfe_o, spiswai_o, spi_interrupt_request_o,
         PREADY_o, PSLVERR_o, send_data_o;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, rd_enb,
         wr_enb, N14, N15, N16, SPI_CR_1_1, N17, SPI_CR_2_0, N18, \SPI_BR[7] ,
         SPI_BR_3, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30,
         N31, N32, N33, modf, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57,
         N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71,
         N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85,
         N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99,
         N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, N110,
         N111;
  wire   [7:5] SPI_CR_1;
  wire   [7:2] SPI_CR_2;
  wire   [7:0] SPI_DR;
  wire   [7:0] SPI_SR;
  assign spi_mode_o[1] = 1'b0;

  \**SEQGEN**  \SPI_CR_1_reg[7]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[7]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        SPI_CR_1[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N17) );
  \**SEQGEN**  \SPI_CR_1_reg[6]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[6]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        SPI_CR_1[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N17) );
  \**SEQGEN**  \SPI_CR_1_reg[5]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[5]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        SPI_CR_1[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N17) );
  \**SEQGEN**  \SPI_CR_1_reg[4]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[4]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        mstr_o), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N17) );
  \**SEQGEN**  \SPI_CR_1_reg[3]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[3]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        cpol_o), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N17) );
  \**SEQGEN**  \SPI_CR_1_reg[2]  ( .clear(1'b0), .preset(N16), .next_state(
        PWDATA_i[2]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        cpha_o), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N17) );
  \**SEQGEN**  \SPI_CR_1_reg[1]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[1]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        SPI_CR_1_1), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N17) );
  \**SEQGEN**  \SPI_CR_1_reg[0]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[0]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        lsbfe_o), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N17) );
  \**SEQGEN**  \SPI_CR_2_reg[7]  ( .clear(N16), .preset(1'b0), .next_state(
        1'b0), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        SPI_CR_2[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N18) );
  \**SEQGEN**  \SPI_CR_2_reg[6]  ( .clear(N16), .preset(1'b0), .next_state(
        1'b0), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        SPI_CR_2[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N18) );
  \**SEQGEN**  \SPI_CR_2_reg[5]  ( .clear(N16), .preset(1'b0), .next_state(
        1'b0), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        SPI_CR_2[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N18) );
  \**SEQGEN**  \SPI_CR_2_reg[4]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[4]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        SPI_CR_2[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N18) );
  \**SEQGEN**  \SPI_CR_2_reg[3]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[3]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        SPI_CR_2[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N18) );
  \**SEQGEN**  \SPI_CR_2_reg[2]  ( .clear(N16), .preset(1'b0), .next_state(
        1'b0), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        SPI_CR_2[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N18) );
  \**SEQGEN**  \SPI_CR_2_reg[1]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[1]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        spiswai_o), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N18) );
  \**SEQGEN**  \SPI_CR_2_reg[0]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[0]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        SPI_CR_2_0), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N18) );
  \**SEQGEN**  \SPI_BR_reg[7]  ( .clear(N16), .preset(1'b0), .next_state(1'b0),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(\SPI_BR[7] ),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N19) );
  \**SEQGEN**  \SPI_BR_reg[6]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[6]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        sppr_o[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N19) );
  \**SEQGEN**  \SPI_BR_reg[5]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[5]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        sppr_o[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N19) );
  \**SEQGEN**  \SPI_BR_reg[4]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[4]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        sppr_o[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N19) );
  \**SEQGEN**  \SPI_BR_reg[3]  ( .clear(N16), .preset(1'b0), .next_state(1'b0),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(SPI_BR_3),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N19) );
  \**SEQGEN**  \SPI_BR_reg[2]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[2]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        spr_o[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(N19) );
  \**SEQGEN**  \SPI_BR_reg[1]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[1]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        spr_o[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(N19) );
  \**SEQGEN**  \SPI_BR_reg[0]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[0]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        spr_o[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(N19) );
  \**SEQGEN**  \SPI_DR_reg[7]  ( .clear(N16), .preset(1'b0), .next_state(N31),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(SPI_DR[7]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N23) );
  \**SEQGEN**  \SPI_DR_reg[6]  ( .clear(N16), .preset(1'b0), .next_state(N30),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(SPI_DR[6]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N23) );
  \**SEQGEN**  \SPI_DR_reg[5]  ( .clear(N16), .preset(1'b0), .next_state(N29),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(SPI_DR[5]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N23) );
  \**SEQGEN**  \SPI_DR_reg[4]  ( .clear(N16), .preset(1'b0), .next_state(N28),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(SPI_DR[4]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N23) );
  \**SEQGEN**  \SPI_DR_reg[3]  ( .clear(N16), .preset(1'b0), .next_state(N27),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(SPI_DR[3]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N23) );
  \**SEQGEN**  \SPI_DR_reg[2]  ( .clear(N16), .preset(1'b0), .next_state(N26),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(SPI_DR[2]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N23) );
  \**SEQGEN**  \SPI_DR_reg[1]  ( .clear(N16), .preset(1'b0), .next_state(N25),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(SPI_DR[1]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N23) );
  \**SEQGEN**  \SPI_DR_reg[0]  ( .clear(N16), .preset(1'b0), .next_state(N24),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(SPI_DR[0]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N23) );
  \**SEQGEN**  \SPI_SR_reg[7]  ( .clear(N16), .preset(1'b0), .next_state(N90),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(SPI_SR[7]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  \**SEQGEN**  \SPI_SR_reg[6]  ( .clear(N16), .preset(1'b0), .next_state(1'b0),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(SPI_SR[6]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  \**SEQGEN**  \SPI_SR_reg[5]  ( .clear(1'b0), .preset(N16), .next_state(N83),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(SPI_SR[5]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  \**SEQGEN**  \SPI_SR_reg[4]  ( .clear(N16), .preset(1'b0), .next_state(modf),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(SPI_SR[4]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  \**SEQGEN**  \SPI_SR_reg[3]  ( .clear(N16), .preset(1'b0), .next_state(1'b0),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(SPI_SR[3]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  \**SEQGEN**  \SPI_SR_reg[2]  ( .clear(N16), .preset(1'b0), .next_state(1'b0),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(SPI_SR[2]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  \**SEQGEN**  \SPI_SR_reg[1]  ( .clear(N16), .preset(1'b0), .next_state(1'b0),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(SPI_SR[1]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  \**SEQGEN**  \SPI_SR_reg[0]  ( .clear(N16), .preset(1'b0), .next_state(1'b0),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(SPI_SR[0]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  GTECH_AND2 C231 ( .A(N101), .B(N97), .Z(N38) );
  GTECH_OR2 C234 ( .A(PADDR_i[2]), .B(PADDR_i[1]), .Z(N40) );
  GTECH_OR2 C238 ( .A(PADDR_i[2]), .B(N97), .Z(N43) );
  GTECH_OR2 C248 ( .A(N101), .B(PADDR_i[1]), .Z(N48) );
  \**SEQGEN**  send_data_o_reg ( .clear(N16), .preset(1'b0), .next_state(N69),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(send_data_o),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N72) );
  \**SEQGEN**  \mosi_data_o_reg[7]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[7]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        mosi_data_o[7]), .synch_clear(1'b0), .synch_preset(1'b0),
        .synch_toggle(1'b0), .synch_enable(N75) );
  \**SEQGEN**  \mosi_data_o_reg[6]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[6]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        mosi_data_o[6]), .synch_clear(1'b0), .synch_preset(1'b0),
        .synch_toggle(1'b0), .synch_enable(N75) );
  \**SEQGEN**  \mosi_data_o_reg[5]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[5]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        mosi_data_o[5]), .synch_clear(1'b0), .synch_preset(1'b0),
        .synch_toggle(1'b0), .synch_enable(N75) );
  \**SEQGEN**  \mosi_data_o_reg[4]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[4]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        mosi_data_o[4]), .synch_clear(1'b0), .synch_preset(1'b0),
        .synch_toggle(1'b0), .synch_enable(N75) );
  \**SEQGEN**  \mosi_data_o_reg[3]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[3]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        mosi_data_o[3]), .synch_clear(1'b0), .synch_preset(1'b0),
        .synch_toggle(1'b0), .synch_enable(N75) );
  \**SEQGEN**  \mosi_data_o_reg[2]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[2]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        mosi_data_o[2]), .synch_clear(1'b0), .synch_preset(1'b0),
        .synch_toggle(1'b0), .synch_enable(N75) );
  \**SEQGEN**  \mosi_data_o_reg[1]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[1]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        mosi_data_o[1]), .synch_clear(1'b0), .synch_preset(1'b0),
        .synch_toggle(1'b0), .synch_enable(N75) );
  \**SEQGEN**  \mosi_data_o_reg[0]  ( .clear(N16), .preset(1'b0), .next_state(
        PWDATA_i[0]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        mosi_data_o[0]), .synch_clear(1'b0), .synch_preset(1'b0),
        .synch_toggle(1'b0), .synch_enable(N75) );
  GTECH_OR2 C367 ( .A(SPI_DR[6]), .B(SPI_DR[7]), .Z(N76) );
  GTECH_OR2 C368 ( .A(SPI_DR[5]), .B(N76), .Z(N77) );
  GTECH_OR2 C369 ( .A(SPI_DR[4]), .B(N77), .Z(N78) );
  GTECH_OR2 C370 ( .A(SPI_DR[3]), .B(N78), .Z(N79) );
  GTECH_OR2 C371 ( .A(SPI_DR[2]), .B(N79), .Z(N80) );
  GTECH_OR2 C372 ( .A(SPI_DR[1]), .B(N80), .Z(N81) );
  GTECH_OR2 C373 ( .A(SPI_DR[0]), .B(N81), .Z(N82) );
  GTECH_NOT I_0 ( .A(N82), .Z(N83) );
  GTECH_OR2 C375 ( .A(SPI_DR[6]), .B(SPI_DR[7]), .Z(N84) );
  GTECH_OR2 C376 ( .A(SPI_DR[5]), .B(N84), .Z(N85) );
  GTECH_OR2 C377 ( .A(SPI_DR[4]), .B(N85), .Z(N86) );
  GTECH_OR2 C378 ( .A(SPI_DR[3]), .B(N86), .Z(N87) );
  GTECH_OR2 C379 ( .A(SPI_DR[2]), .B(N87), .Z(N88) );
  GTECH_OR2 C380 ( .A(SPI_DR[1]), .B(N88), .Z(N89) );
  GTECH_OR2 C381 ( .A(SPI_DR[0]), .B(N89), .Z(N90) );
  GTECH_OR2 C384 ( .A(PADDR_i[1]), .B(PADDR_i[2]), .Z(N91) );
  GTECH_OR2 C385 ( .A(PADDR_i[0]), .B(N91), .Z(N92) );
  GTECH_NOT I_1 ( .A(N92), .Z(N93) );
  GTECH_NOT I_2 ( .A(PADDR_i[0]), .Z(N94) );
  GTECH_OR2 C389 ( .A(N94), .B(N91), .Z(N95) );
  GTECH_NOT I_3 ( .A(N95), .Z(N96) );
  GTECH_NOT I_4 ( .A(PADDR_i[1]), .Z(N97) );
  GTECH_OR2 C392 ( .A(N97), .B(PADDR_i[2]), .Z(N98) );
  GTECH_OR2 C393 ( .A(PADDR_i[0]), .B(N98), .Z(N99) );
  GTECH_NOT I_5 ( .A(N99), .Z(N100) );
  GTECH_NOT I_6 ( .A(PADDR_i[2]), .Z(N101) );
  GTECH_OR2 C397 ( .A(PADDR_i[1]), .B(N101), .Z(N102) );
  GTECH_OR2 C398 ( .A(N94), .B(N102), .Z(N103) );
  GTECH_NOT I_7 ( .A(N103), .Z(N104) );
  SELECT_OP C410 ( .DATA1(tip_i), .DATA2(1'b0), .CONTROL1(N0), .CONTROL2(N15),
        .Z(PSLVERR_o) );
  SELECT_OP C411 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b0), .CONTROL1(N1),
        .CONTROL2(N33), .CONTROL3(N22), .Z(N23) );
  SELECT_OP C412 ( .DATA1(PWDATA_i), .DATA2(miso_data_i), .CONTROL1(N1),
        .CONTROL2(N33), .Z({N31, N30, N29, N28, N27, N26, N25, N24}) );
  SELECT_OP C413 ( .DATA1({SPI_CR_1, mstr_o, cpol_o, cpha_o, SPI_CR_1_1,
        lsbfe_o}), .DATA2({SPI_CR_2, spiswai_o, SPI_CR_2_0}), .DATA3({
        \SPI_BR[7] , sppr_o, SPI_BR_3, spr_o}), .DATA4(SPI_SR), .DATA5(SPI_DR),
        .DATA6({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .CONTROL4(N5), .CONTROL5(N6), .CONTROL6(N7),
        .Z({N61, N60, N59, N58, N57, N56, N55, N54}) );
  SELECT_OP C414 ( .DATA1({N61, N60, N59, N58, N57, N56, N55, N54}), .DATA2({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N8),
        .CONTROL2(N9), .Z(PRDATA_o) );
  SELECT_OP C415 ( .DATA1(1'b0), .DATA2(N36), .DATA3(N83), .DATA4(N68),
        .CONTROL1(N10), .CONTROL2(N11), .CONTROL3(N12), .CONTROL4(N67), .Z(
        spi_interrupt_request_o) );
  SELECT_OP C416 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b0), .CONTROL1(N13),
        .CONTROL2(N74), .CONTROL3(N71), .Z(N72) );
  GTECH_AND2 C419 ( .A(N105), .B(N106), .Z(rd_enb) );
  GTECH_AND2 C420 ( .A(PSEL_i), .B(PENABLE_i), .Z(N105) );
  GTECH_NOT I_8 ( .A(PWRITE_i), .Z(N106) );
  GTECH_AND2 C422 ( .A(N107), .B(PWRITE_i), .Z(wr_enb) );
  GTECH_AND2 C423 ( .A(PSEL_i), .B(PENABLE_i), .Z(N107) );
  GTECH_AND2 C424 ( .A(PSEL_i), .B(PENABLE_i), .Z(N14) );
  GTECH_BUF B_14 ( .A(N14), .Z(PREADY_o) );
  GTECH_NOT I_10 ( .A(PRESET_n), .Z(N16) );
  GTECH_AND2 C428 ( .A(wr_enb), .B(N93), .Z(N17) );
  GTECH_AND2 C430 ( .A(wr_enb), .B(N96), .Z(N18) );
  GTECH_AND2 C432 ( .A(wr_enb), .B(N100), .Z(N19) );
  GTECH_AND2 C434 ( .A(wr_enb), .B(N104), .Z(N20) );
  GTECH_NOT I_13 ( .A(SPI_CR_1[7]), .Z(N34) );
  GTECH_NOT I_14 ( .A(SPI_CR_1[5]), .Z(N35) );
  GTECH_OR2 C443 ( .A(N90), .B(modf), .Z(N36) );
  GTECH_AND2 C444 ( .A(SPI_CR_1[6]), .B(mstr_o), .Z(spi_mode_o[0]) );
  GTECH_NOT I_15 ( .A(rd_enb), .Z(N37) );
  GTECH_NOT I_16 ( .A(N41), .Z(N42) );
  GTECH_NOT I_17 ( .A(N44), .Z(N45) );
  GTECH_NOT I_18 ( .A(N46), .Z(N47) );
  GTECH_NOT I_19 ( .A(N49), .Z(N50) );
  GTECH_OR2 C455 ( .A(N51), .B(N52), .Z(N53) );
  GTECH_AND2 C462 ( .A(N34), .B(N35), .Z(N62) );
  GTECH_AND2 C463 ( .A(N35), .B(SPI_CR_1[7]), .Z(N63) );
  GTECH_AND2 C464 ( .A(SPI_CR_1[5]), .B(N34), .Z(N64) );
  GTECH_OR2 C471 ( .A(N36), .B(N83), .Z(N68) );
  GTECH_AND2 C472 ( .A(N110), .B(N111), .Z(modf) );
  GTECH_AND2 C473 ( .A(N109), .B(SPI_CR_2[4]), .Z(N110) );
  GTECH_AND2 C474 ( .A(N108), .B(mstr_o), .Z(N109) );
  GTECH_NOT I_21 ( .A(ss_i), .Z(N108) );
  GTECH_NOT I_22 ( .A(SPI_CR_1_1), .Z(N111) );
  GTECH_AND2 C477 ( .A(wr_enb), .B(N104), .Z(N69) );
  GTECH_AND2 C483 ( .A(wr_enb), .B(N104), .Z(N75) );
  GTECH_AND2 C232 ( .A(N38), .B(N94), .Z(N39) );
  GTECH_OR2 C235 ( .A(N40), .B(N94), .Z(N41) );
  GTECH_OR2 C239 ( .A(N43), .B(PADDR_i[0]), .Z(N44) );
  GTECH_OR2 C244 ( .A(N43), .B(N94), .Z(N46) );
  GTECH_OR2 C249 ( .A(N48), .B(N94), .Z(N49) );
  GTECH_AND2 C251 ( .A(PADDR_i[2]), .B(PADDR_i[1]), .Z(N51) );
  GTECH_AND2 C253 ( .A(PADDR_i[2]), .B(N94), .Z(N52) );
  GTECH_BUF B_0 ( .A(PREADY_o), .Z(N0) );
  GTECH_BUF B_1 ( .A(N20), .Z(N1) );
  GTECH_BUF B_2 ( .A(N39), .Z(N2) );
  GTECH_BUF B_3 ( .A(N42), .Z(N3) );
  GTECH_BUF B_4 ( .A(N45), .Z(N4) );
  GTECH_BUF B_5 ( .A(N47), .Z(N5) );
  GTECH_BUF B_6 ( .A(N50), .Z(N6) );
  GTECH_BUF B_7 ( .A(N53), .Z(N7) );
  GTECH_BUF B_8 ( .A(rd_enb), .Z(N8) );
  GTECH_BUF B_9 ( .A(N37), .Z(N9) );
  GTECH_BUF B_10 ( .A(N62), .Z(N10) );
  GTECH_BUF B_11 ( .A(N63), .Z(N11) );
  GTECH_BUF B_12 ( .A(N64), .Z(N12) );
  GTECH_BUF B_13 ( .A(N69), .Z(N13) );
  GTECH_NOT I_9 ( .A(PREADY_o), .Z(N15) );
  GTECH_OR2 C437 ( .A(receive_data_i), .B(N20), .Z(N21) );
  GTECH_NOT I_11 ( .A(N21), .Z(N22) );
  GTECH_NOT I_12 ( .A(N20), .Z(N32) );
  GTECH_AND2 C440 ( .A(receive_data_i), .B(N32), .Z(N33) );
  GTECH_OR2 C468 ( .A(N63), .B(N62), .Z(N65) );
  GTECH_OR2 C469 ( .A(N64), .B(N65), .Z(N66) );
  GTECH_NOT I_20 ( .A(N66), .Z(N67) );
  GTECH_OR2 C479 ( .A(receive_data_i), .B(N69), .Z(N70) );
  GTECH_NOT I_23 ( .A(N70), .Z(N71) );
  GTECH_NOT I_24 ( .A(N69), .Z(N73) );
  GTECH_AND2 C482 ( .A(receive_data_i), .B(N73), .Z(N74) );
endmodule


module BaudRateGen ( PCLK, PRESET_n, spiswai_i, cpol_i, cpha_i, ss_i, sppr_i,
        spr_i, spi_mode_i, sclk_o, miso_receive_sclk_o, miso_receive_sclk0_o,
        mosi_send_sclk_o, mosi_send_sclk0_o, BaudRateDivisor_o );
  input [2:0] sppr_i;
  input [2:0] spr_i;
  input [1:0] spi_mode_i;
  output [11:0] BaudRateDivisor_o;
  input PCLK, PRESET_n, spiswai_i, cpol_i, cpha_i, ss_i;
  output sclk_o, miso_receive_sclk_o, miso_receive_sclk0_o, mosi_send_sclk_o,
         mosi_send_sclk0_o;
  wire   N0, N1, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, N18, N19, N20, N21, mode_o, N22, N23, N24, N25, N26, N27, N28,
         N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42,
         N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56,
         N57, N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70,
         N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84,
         N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98,
         N99, N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, N110,
         N111, N112, N113, N114, N115, N116, N117, N118, net223;
  wire   [11:0] target_count;
  wire   [11:0] count;

  EQ_UNS_OP eq_34 ( .A(count), .B(target_count), .Z(N24) );
  \**SEQGEN**  \count_reg[11]  ( .clear(N22), .preset(1'b0), .next_state(N50),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count[11]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[10]  ( .clear(N22), .preset(1'b0), .next_state(N49),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count[10]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[9]  ( .clear(N22), .preset(1'b0), .next_state(N48),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count[9]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[8]  ( .clear(N22), .preset(1'b0), .next_state(N47),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count[8]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[7]  ( .clear(N22), .preset(1'b0), .next_state(N46),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count[7]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[6]  ( .clear(N22), .preset(1'b0), .next_state(N45),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count[6]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[5]  ( .clear(N22), .preset(1'b0), .next_state(N44),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count[5]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[4]  ( .clear(N22), .preset(1'b0), .next_state(N43),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count[4]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[3]  ( .clear(N22), .preset(1'b0), .next_state(N42),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count[3]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[2]  ( .clear(N22), .preset(1'b0), .next_state(N41),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count[2]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[1]  ( .clear(N22), .preset(1'b0), .next_state(N40),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count[1]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[0]  ( .clear(N22), .preset(1'b0), .next_state(N39),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count[0]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(1'b1) );
  EQ_UNS_OP eq_45 ( .A(count), .B(target_count), .Z(N53) );
  \**SEQGEN**  sclk_o_reg ( .clear(1'b0), .preset(1'b0), .next_state(N58),
        .clocked_on(PCLK), .data_in(cpol_i), .enable(N22), .Q(sclk_o),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N57) );
  EQ_UNS_OP eq_70 ( .A(count), .B(target_count), .Z(N61) );
  EQ_UNS_OP eq_58 ( .A(count), .B(target_count), .Z(N63) );
  \**SEQGEN**  miso_receive_sclk0_o_reg ( .clear(N22), .preset(1'b0),
        .next_state(N68), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0),
        .Q(miso_receive_sclk0_o), .synch_clear(1'b0), .synch_preset(1'b0),
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  miso_receive_sclk_o_reg ( .clear(N22), .preset(1'b0),
        .next_state(N69), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0),
        .Q(miso_receive_sclk_o), .synch_clear(1'b0), .synch_preset(1'b0),
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  EQ_UNS_OP eq_101 ( .A(count), .B({N84, N84, N84, N84, N84, N84, N84, N84,
        N84, N84, N84, N84, N84, N84, N84, N84, N84, N84, N84, N84, N83, N82,
        N81, N80, N79, N78, N77, N76, N75, N74, N73, N72}), .Z(N85) );
  EQ_UNS_OP eq_89 ( .A(count), .B({N98, N98, N98, N98, N98, N98, N98, N98, N98,
        N98, N98, N98, N98, N98, N98, N98, N98, N98, N98, N98, N97, N96, N95,
        N94, N93, N92, N91, N90, N89, N88, N87, N86}), .Z(N99) );
  \**SEQGEN**  mosi_send_sclk_o_reg ( .clear(N22), .preset(1'b0), .next_state(
        N103), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        mosi_send_sclk_o), .synch_clear(1'b0), .synch_preset(1'b0),
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  mosi_send_sclk0_o_reg ( .clear(N22), .preset(1'b0),
        .next_state(N104), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0),
        .Q(mosi_send_sclk0_o), .synch_clear(1'b0), .synch_preset(1'b0),
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  GTECH_OR2 C201 ( .A(spi_mode_i[0]), .B(spi_mode_i[1]), .Z(N106) );
  GTECH_NOT I_0 ( .A(N106), .Z(N107) );
  GTECH_NOT I_1 ( .A(spi_mode_i[0]), .Z(N108) );
  GTECH_OR2 C204 ( .A(N108), .B(spi_mode_i[1]), .Z(N109) );
  GTECH_NOT I_2 ( .A(N109), .Z(N110) );
  ADD_UNS_OP add_25 ( .A(sppr_i), .B(1'b1), .Z({N10, N9, N8, N7}) );
  ADD_UNS_OP add_25_2 ( .A(spr_i), .B(1'b1), .Z({N13, N12, N11}) );
  ASH_UNS_UNS_OP sll_25 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}),
        .SH({N13, N12, N11}), .Z({N21, N20, N19, N18, N17, N16, N15, N14}) );
  MULT_UNS_OP mult_25 ( .A({N10, N9, N8, N7}), .B({N21, N20, N19, N18, N17,
        N16, N15, N14}), .Z(BaudRateDivisor_o) );
  SUB_UNS_OP sub_26 ( .A(BaudRateDivisor_o[11:1]), .B(1'b1), .Z(target_count)
         );
  SUB_UNS_OP sub_101 ( .A(target_count), .B(1'b1), .Z({N84, N83, N82, N81, N80,
        N79, N78, N77, N76, N75, N74, N73, N72}) );
  SUB_UNS_OP sub_89 ( .A(target_count), .B(1'b1), .Z({N98, N97, N96, N95, N94,
        N93, N92, N91, N90, N89, N88, N87, N86}) );
  ADD_UNS_OP add_37 ( .A(count), .B(1'b1), .Z({N38, N37, N36, N35, N34, N33,
        N32, N31, N30, N29, N28, N27}) );
  SELECT_OP C206 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
        1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA3({N38, N37, N36, N35, N34,
        N33, N32, N31, N30, N29, N28, N27}), .CONTROL1(N0), .CONTROL2(N51),
        .CONTROL3(N26), .Z({N50, N49, N48, N47, N46, N45, N44, N43, N42, N41,
        N40, N39}) );
  SELECT_OP C207 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b0), .CONTROL1(N0),
        .CONTROL2(N59), .CONTROL3(N55), .Z(N57) );
  SELECT_OP C208 ( .DATA1(cpol_i), .DATA2(N56), .CONTROL1(N0), .CONTROL2(N59),
        .Z(N58) );
  SELECT_OP C209 ( .DATA1(1'b1), .DATA2(1'b0), .DATA3(1'b0), .CONTROL1(N1),
        .CONTROL2(N64), .CONTROL3(net223), .Z(N65) );
  SELECT_OP C210 ( .DATA1(N65), .DATA2(1'b0), .CONTROL1(N3), .CONTROL2(N4),
        .Z(N66) );
  SELECT_OP C211 ( .DATA1(N66), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0),
        .DATA5(1'b0), .CONTROL1(N5), .CONTROL2(N67), .CONTROL3(net223),
        .CONTROL4(net223), .CONTROL5(net223), .Z(N68) );
  SELECT_OP C212 ( .DATA1(1'b1), .DATA2(1'b0), .DATA3(1'b0), .CONTROL1(N6),
        .CONTROL2(N100), .CONTROL3(net223), .Z(N101) );
  SELECT_OP C213 ( .DATA1(N101), .DATA2(1'b0), .CONTROL1(N3), .CONTROL2(N4),
        .Z(N102) );
  SELECT_OP C214 ( .DATA1(N102), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0),
        .DATA5(1'b0), .CONTROL1(N5), .CONTROL2(N67), .CONTROL3(net223),
        .CONTROL4(net223), .CONTROL5(net223), .Z(N103) );
  GTECH_AND2 C217 ( .A(N113), .B(N114), .Z(mode_o) );
  GTECH_AND2 C218 ( .A(N111), .B(N112), .Z(N113) );
  GTECH_OR2 C219 ( .A(N107), .B(N110), .Z(N111) );
  GTECH_NOT I_3 ( .A(ss_i), .Z(N112) );
  GTECH_NOT I_4 ( .A(spiswai_i), .Z(N114) );
  GTECH_NOT I_5 ( .A(PRESET_n), .Z(N22) );
  GTECH_NOT I_6 ( .A(mode_o), .Z(N23) );
  GTECH_NOT I_9 ( .A(sclk_o), .Z(N56) );
  GTECH_OR2 C242 ( .A(N116), .B(N118), .Z(N60) );
  GTECH_AND2 C243 ( .A(N115), .B(cpol_i), .Z(N116) );
  GTECH_NOT I_10 ( .A(cpha_i), .Z(N115) );
  GTECH_AND2 C245 ( .A(N117), .B(cpha_i), .Z(N118) );
  GTECH_NOT I_11 ( .A(cpol_i), .Z(N117) );
  GTECH_BUF B_0 ( .A(N23), .Z(N0) );
  GTECH_BUF B_1 ( .A(N63), .Z(N1) );
  GTECH_BUF B_2 ( .A(1'b0), .Z(net223) );
  GTECH_BUF B_3 ( .A(sclk_o), .Z(N3) );
  GTECH_BUF B_4 ( .A(N56), .Z(N4) );
  GTECH_BUF B_5 ( .A(N60), .Z(N5) );
  GTECH_BUF B_6 ( .A(N99), .Z(N6) );
  GTECH_OR2 C226 ( .A(N24), .B(N23), .Z(N25) );
  GTECH_NOT I_7 ( .A(N25), .Z(N26) );
  GTECH_AND2 C230 ( .A(N24), .B(mode_o), .Z(N51) );
  GTECH_BUF B_7 ( .A(PRESET_n), .Z(N52) );
  GTECH_OR2 C237 ( .A(N53), .B(N23), .Z(N54) );
  GTECH_NOT I_8 ( .A(N54), .Z(N55) );
  GTECH_AND2 C241 ( .A(N53), .B(mode_o), .Z(N59) );
  GTECH_AND2 C250 ( .A(N52), .B(N60), .Z(N62) );
  GTECH_NOT I_12 ( .A(N63), .Z(N64) );
  GTECH_NOT I_13 ( .A(N60), .Z(N67) );
  GTECH_NOT I_14 ( .A(sclk_o), .Z(N70) );
  GTECH_AND2 C259 ( .A(N67), .B(N70), .Z(N71) );
  GTECH_AND2 C260 ( .A(N61), .B(N71), .Z(N69) );
  GTECH_NOT I_15 ( .A(N99), .Z(N100) );
  GTECH_AND2 C270 ( .A(N67), .B(N70), .Z(N105) );
  GTECH_AND2 C271 ( .A(N85), .B(N105), .Z(N104) );
endmodule


module ShiftReg ( PCLK, PRESET_n, ss_i, send_data_i, lsbfe_i, cpha_i, cpol_i,
        miso_receive_sclk0_i, miso_receive_sclk_i, mosi_send_sclk0_i,
        mosi_send_sclk_i, data_mosi_i, miso_i, receive_data_i, mosi_o,
        data_miso_o );
  input [7:0] data_mosi_i;
  output [7:0] data_miso_o;
  input PCLK, PRESET_n, ss_i, send_data_i, lsbfe_i, cpha_i, cpol_i,
         miso_receive_sclk0_i, miso_receive_sclk_i, mosi_send_sclk0_i,
         mosi_send_sclk_i, miso_i, receive_data_i;
  output mosi_o;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57,
         N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71,
         N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85,
         N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99,
         N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, N110,
         N111, N112, N113, N114, N115, N116, N117, N118, N119, N120, N121,
         N122, N123, N124, N125, N126, N127, N128, N129, N130, N131, N132,
         N133, N134, N135, N136, N137, N138, N139, N140, N141, N142, N143,
         N144, N145, N146, N147, N148, N149, N150, N151, N152, N153, N154,
         N155, N156, N157, N158, N159, N160, N161, N162, N163, N164, N165,
         N166, N167, N168, N169, N170, N171, N172, N173, N174, N175, N176,
         N177, N178, N179, N180, N181, N182, N183, N184, N185, N186, N187,
         N188, N189, N190, N191, N192, N193, N194, N195, N196, N197, N198,
         N199, N200, N201, N202, N203, N204, N205, N206, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246;
  wire   [7:0] shift_reg;
  wire   [2:0] count;
  wire   [2:0] count1;
  wire   [2:0] count2;
  wire   [2:0] count3;
  wire   [7:0] temp_reg;

  \**SEQGEN**  \count_reg[2]  ( .clear(N64), .preset(1'b0), .next_state(N97),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count[2]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N94) );
  \**SEQGEN**  \count_reg[1]  ( .clear(N64), .preset(1'b0), .next_state(N96),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count[1]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N94) );
  \**SEQGEN**  \count_reg[0]  ( .clear(N64), .preset(1'b0), .next_state(N95),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count[0]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N94) );
  \**SEQGEN**  \count1_reg[2]  ( .clear(1'b0), .preset(N64), .next_state(N101),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count1[2]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N98) );
  \**SEQGEN**  \count1_reg[1]  ( .clear(1'b0), .preset(N64), .next_state(N100),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count1[1]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N98) );
  \**SEQGEN**  \count1_reg[0]  ( .clear(1'b0), .preset(N64), .next_state(N99),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count1[0]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N98) );
  \**SEQGEN**  mosi_o_reg ( .clear(N64), .preset(1'b0), .next_state(N103),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(mosi_o),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N102) );
  \**SEQGEN**  \count2_reg[2]  ( .clear(N64), .preset(1'b0), .next_state(N194),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count2[2]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N191) );
  \**SEQGEN**  \count2_reg[1]  ( .clear(N64), .preset(1'b0), .next_state(N193),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count2[1]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N191) );
  \**SEQGEN**  \count2_reg[0]  ( .clear(N64), .preset(1'b0), .next_state(N192),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count2[0]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N191) );
  \**SEQGEN**  \count3_reg[2]  ( .clear(1'b0), .preset(N64), .next_state(N198),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count3[2]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N195) );
  \**SEQGEN**  \count3_reg[1]  ( .clear(1'b0), .preset(N64), .next_state(N197),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count3[1]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N195) );
  \**SEQGEN**  \count3_reg[0]  ( .clear(1'b0), .preset(N64), .next_state(N196),
        .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(count3[0]),
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0),
        .synch_enable(N195) );
  \**SEQGEN**  \temp_reg_reg[7]  ( .clear(N64), .preset(1'b0), .next_state(
        N200), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        temp_reg[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N207) );
  \**SEQGEN**  \temp_reg_reg[6]  ( .clear(N64), .preset(1'b0), .next_state(
        N200), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        temp_reg[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N206) );
  \**SEQGEN**  \temp_reg_reg[5]  ( .clear(N64), .preset(1'b0), .next_state(
        N200), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        temp_reg[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N205) );
  \**SEQGEN**  \temp_reg_reg[4]  ( .clear(N64), .preset(1'b0), .next_state(
        N200), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        temp_reg[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N204) );
  \**SEQGEN**  \temp_reg_reg[3]  ( .clear(N64), .preset(1'b0), .next_state(
        N200), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        temp_reg[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N203) );
  \**SEQGEN**  \temp_reg_reg[2]  ( .clear(N64), .preset(1'b0), .next_state(
        N200), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        temp_reg[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N202) );
  \**SEQGEN**  \temp_reg_reg[1]  ( .clear(N64), .preset(1'b0), .next_state(
        N200), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        temp_reg[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N201) );
  \**SEQGEN**  \temp_reg_reg[0]  ( .clear(N64), .preset(1'b0), .next_state(
        N200), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        temp_reg[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N199) );
  \**SEQGEN**  \shift_reg_reg[7]  ( .clear(N64), .preset(1'b0), .next_state(
        data_mosi_i[7]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(send_data_i) );
  \**SEQGEN**  \shift_reg_reg[6]  ( .clear(N64), .preset(1'b0), .next_state(
        data_mosi_i[6]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(send_data_i) );
  \**SEQGEN**  \shift_reg_reg[5]  ( .clear(N64), .preset(1'b0), .next_state(
        data_mosi_i[5]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(send_data_i) );
  \**SEQGEN**  \shift_reg_reg[4]  ( .clear(N64), .preset(1'b0), .next_state(
        data_mosi_i[4]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(send_data_i) );
  \**SEQGEN**  \shift_reg_reg[3]  ( .clear(N64), .preset(1'b0), .next_state(
        data_mosi_i[3]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(send_data_i) );
  \**SEQGEN**  \shift_reg_reg[2]  ( .clear(N64), .preset(1'b0), .next_state(
        data_mosi_i[2]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(send_data_i) );
  \**SEQGEN**  \shift_reg_reg[1]  ( .clear(N64), .preset(1'b0), .next_state(
        data_mosi_i[1]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(send_data_i) );
  \**SEQGEN**  \shift_reg_reg[0]  ( .clear(N64), .preset(1'b0), .next_state(
        data_mosi_i[0]), .clocked_on(PCLK), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(send_data_i) );
  ADD_UNS_OP add_39 ( .A(count), .B(1'b1), .Z({N77, N76, N75}) );
  SUB_UNS_OP sub_47 ( .A(count1), .B(1'b1), .Z({N81, N80, N79}) );
  ADD_UNS_OP add_87 ( .A(count2), .B(1'b1), .Z({N128, N127, N126}) );
  SUB_UNS_OP sub_95 ( .A(count3), .B(1'b1), .Z({N148, N147, N146}) );
  ADD_UNS_OP add_55 ( .A(count), .B(1'b1), .Z({N89, N88, N87}) );
  ADD_UNS_OP add_103 ( .A(count2), .B(1'b1), .Z({N170, N169, N168}) );
  SUB_UNS_OP sub_63 ( .A(count1), .B(1'b1), .Z({N93, N92, N91}) );
  SUB_UNS_OP sub_111 ( .A(count3), .B(1'b1), .Z({N190, N189, N188}) );
  GTECH_AND2 C436 ( .A(count2[0]), .B(count2[1]), .Z(N211) );
  GTECH_AND2 C437 ( .A(N211), .B(count2[2]), .Z(N125) );
  GTECH_AND2 C438 ( .A(N0), .B(count2[1]), .Z(N212) );
  GTECH_NOT I_0 ( .A(count2[0]), .Z(N0) );
  GTECH_AND2 C439 ( .A(N212), .B(count2[2]), .Z(N124) );
  GTECH_AND2 C440 ( .A(count2[0]), .B(N1), .Z(N213) );
  GTECH_NOT I_1 ( .A(count2[1]), .Z(N1) );
  GTECH_AND2 C441 ( .A(N213), .B(count2[2]), .Z(N123) );
  GTECH_AND2 C442 ( .A(N2), .B(N3), .Z(N214) );
  GTECH_NOT I_2 ( .A(count2[0]), .Z(N2) );
  GTECH_NOT I_3 ( .A(count2[1]), .Z(N3) );
  GTECH_AND2 C443 ( .A(N214), .B(count2[2]), .Z(N122) );
  GTECH_AND2 C444 ( .A(count2[0]), .B(count2[1]), .Z(N215) );
  GTECH_AND2 C445 ( .A(N215), .B(N4), .Z(N121) );
  GTECH_NOT I_4 ( .A(count2[2]), .Z(N4) );
  GTECH_AND2 C446 ( .A(N5), .B(count2[1]), .Z(N216) );
  GTECH_NOT I_5 ( .A(count2[0]), .Z(N5) );
  GTECH_AND2 C447 ( .A(N216), .B(N6), .Z(N120) );
  GTECH_NOT I_6 ( .A(count2[2]), .Z(N6) );
  GTECH_AND2 C448 ( .A(count2[0]), .B(N7), .Z(N217) );
  GTECH_NOT I_7 ( .A(count2[1]), .Z(N7) );
  GTECH_AND2 C449 ( .A(N217), .B(N8), .Z(N119) );
  GTECH_NOT I_8 ( .A(count2[2]), .Z(N8) );
  GTECH_AND2 C450 ( .A(N9), .B(N10), .Z(N218) );
  GTECH_NOT I_9 ( .A(count2[0]), .Z(N9) );
  GTECH_NOT I_10 ( .A(count2[1]), .Z(N10) );
  GTECH_AND2 C451 ( .A(N218), .B(N11), .Z(N118) );
  GTECH_NOT I_11 ( .A(count2[2]), .Z(N11) );
  GTECH_AND2 C452 ( .A(count3[0]), .B(count3[1]), .Z(N219) );
  GTECH_AND2 C453 ( .A(N219), .B(count3[2]), .Z(N145) );
  GTECH_AND2 C454 ( .A(N12), .B(count3[1]), .Z(N220) );
  GTECH_NOT I_12 ( .A(count3[0]), .Z(N12) );
  GTECH_AND2 C455 ( .A(N220), .B(count3[2]), .Z(N144) );
  GTECH_AND2 C456 ( .A(count3[0]), .B(N13), .Z(N221) );
  GTECH_NOT I_13 ( .A(count3[1]), .Z(N13) );
  GTECH_AND2 C457 ( .A(N221), .B(count3[2]), .Z(N143) );
  GTECH_AND2 C458 ( .A(N14), .B(N15), .Z(N222) );
  GTECH_NOT I_14 ( .A(count3[0]), .Z(N14) );
  GTECH_NOT I_15 ( .A(count3[1]), .Z(N15) );
  GTECH_AND2 C459 ( .A(N222), .B(count3[2]), .Z(N142) );
  GTECH_AND2 C460 ( .A(count3[0]), .B(count3[1]), .Z(N223) );
  GTECH_AND2 C461 ( .A(N223), .B(N16), .Z(N141) );
  GTECH_NOT I_16 ( .A(count3[2]), .Z(N16) );
  GTECH_AND2 C462 ( .A(N17), .B(count3[1]), .Z(N224) );
  GTECH_NOT I_17 ( .A(count3[0]), .Z(N17) );
  GTECH_AND2 C463 ( .A(N224), .B(N18), .Z(N140) );
  GTECH_NOT I_18 ( .A(count3[2]), .Z(N18) );
  GTECH_AND2 C464 ( .A(count3[0]), .B(N19), .Z(N225) );
  GTECH_NOT I_19 ( .A(count3[1]), .Z(N19) );
  GTECH_AND2 C465 ( .A(N225), .B(N20), .Z(N139) );
  GTECH_NOT I_20 ( .A(count3[2]), .Z(N20) );
  GTECH_AND2 C466 ( .A(N21), .B(N22), .Z(N226) );
  GTECH_NOT I_21 ( .A(count3[0]), .Z(N21) );
  GTECH_NOT I_22 ( .A(count3[1]), .Z(N22) );
  GTECH_AND2 C467 ( .A(N226), .B(N23), .Z(N138) );
  GTECH_NOT I_23 ( .A(count3[2]), .Z(N23) );
  GTECH_AND2 C468 ( .A(count2[0]), .B(count2[1]), .Z(N227) );
  GTECH_AND2 C469 ( .A(N227), .B(count2[2]), .Z(N167) );
  GTECH_AND2 C470 ( .A(N24), .B(count2[1]), .Z(N228) );
  GTECH_NOT I_24 ( .A(count2[0]), .Z(N24) );
  GTECH_AND2 C471 ( .A(N228), .B(count2[2]), .Z(N166) );
  GTECH_AND2 C472 ( .A(count2[0]), .B(N25), .Z(N229) );
  GTECH_NOT I_25 ( .A(count2[1]), .Z(N25) );
  GTECH_AND2 C473 ( .A(N229), .B(count2[2]), .Z(N165) );
  GTECH_AND2 C474 ( .A(N26), .B(N27), .Z(N230) );
  GTECH_NOT I_26 ( .A(count2[0]), .Z(N26) );
  GTECH_NOT I_27 ( .A(count2[1]), .Z(N27) );
  GTECH_AND2 C475 ( .A(N230), .B(count2[2]), .Z(N164) );
  GTECH_AND2 C476 ( .A(count2[0]), .B(count2[1]), .Z(N231) );
  GTECH_AND2 C477 ( .A(N231), .B(N28), .Z(N163) );
  GTECH_NOT I_28 ( .A(count2[2]), .Z(N28) );
  GTECH_AND2 C478 ( .A(N29), .B(count2[1]), .Z(N232) );
  GTECH_NOT I_29 ( .A(count2[0]), .Z(N29) );
  GTECH_AND2 C479 ( .A(N232), .B(N30), .Z(N162) );
  GTECH_NOT I_30 ( .A(count2[2]), .Z(N30) );
  GTECH_AND2 C480 ( .A(count2[0]), .B(N31), .Z(N233) );
  GTECH_NOT I_31 ( .A(count2[1]), .Z(N31) );
  GTECH_AND2 C481 ( .A(N233), .B(N32), .Z(N161) );
  GTECH_NOT I_32 ( .A(count2[2]), .Z(N32) );
  GTECH_AND2 C482 ( .A(N33), .B(N34), .Z(N234) );
  GTECH_NOT I_33 ( .A(count2[0]), .Z(N33) );
  GTECH_NOT I_34 ( .A(count2[1]), .Z(N34) );
  GTECH_AND2 C483 ( .A(N234), .B(N35), .Z(N160) );
  GTECH_NOT I_35 ( .A(count2[2]), .Z(N35) );
  GTECH_AND2 C484 ( .A(count3[0]), .B(count3[1]), .Z(N235) );
  GTECH_AND2 C485 ( .A(N235), .B(count3[2]), .Z(N187) );
  GTECH_AND2 C486 ( .A(N36), .B(count3[1]), .Z(N236) );
  GTECH_NOT I_36 ( .A(count3[0]), .Z(N36) );
  GTECH_AND2 C487 ( .A(N236), .B(count3[2]), .Z(N186) );
  GTECH_AND2 C488 ( .A(count3[0]), .B(N37), .Z(N237) );
  GTECH_NOT I_37 ( .A(count3[1]), .Z(N37) );
  GTECH_AND2 C489 ( .A(N237), .B(count3[2]), .Z(N185) );
  GTECH_AND2 C490 ( .A(N38), .B(N39), .Z(N238) );
  GTECH_NOT I_38 ( .A(count3[0]), .Z(N38) );
  GTECH_NOT I_39 ( .A(count3[1]), .Z(N39) );
  GTECH_AND2 C491 ( .A(N238), .B(count3[2]), .Z(N184) );
  GTECH_AND2 C492 ( .A(count3[0]), .B(count3[1]), .Z(N239) );
  GTECH_AND2 C493 ( .A(N239), .B(N40), .Z(N183) );
  GTECH_NOT I_40 ( .A(count3[2]), .Z(N40) );
  GTECH_AND2 C494 ( .A(N41), .B(count3[1]), .Z(N240) );
  GTECH_NOT I_41 ( .A(count3[0]), .Z(N41) );
  GTECH_AND2 C495 ( .A(N240), .B(N42), .Z(N182) );
  GTECH_NOT I_42 ( .A(count3[2]), .Z(N42) );
  GTECH_AND2 C496 ( .A(count3[0]), .B(N43), .Z(N241) );
  GTECH_NOT I_43 ( .A(count3[1]), .Z(N43) );
  GTECH_AND2 C497 ( .A(N241), .B(N44), .Z(N181) );
  GTECH_NOT I_44 ( .A(count3[2]), .Z(N44) );
  GTECH_AND2 C498 ( .A(N45), .B(N46), .Z(N242) );
  GTECH_NOT I_45 ( .A(count3[0]), .Z(N45) );
  GTECH_NOT I_46 ( .A(count3[1]), .Z(N46) );
  GTECH_AND2 C499 ( .A(N242), .B(N47), .Z(N180) );
  GTECH_NOT I_47 ( .A(count3[2]), .Z(N47) );
  SELECT_OP C500 ( .DATA1(mosi_send_sclk_i), .DATA2(1'b1), .DATA3(1'b0),
        .CONTROL1(N48), .CONTROL2(N112), .CONTROL3(N73), .Z(N82) );
  SELECT_OP C501 ( .DATA1(N62), .DATA2(N63), .CONTROL1(N48), .CONTROL2(N112),
        .Z(N83) );
  SELECT_OP C502 ( .DATA1(mosi_send_sclk_i), .DATA2(1'b0), .DATA3(1'b0),
        .CONTROL1(N48), .CONTROL2(N112), .CONTROL3(N73), .Z(N84) );
  SELECT_OP C503 ( .DATA1(1'b0), .DATA2(1'b1), .DATA3(1'b0), .CONTROL1(N48),
        .CONTROL2(N112), .CONTROL3(N73), .Z(N85) );
  SELECT_OP C504 ( .DATA1(1'b1), .DATA2(N84), .DATA3(mosi_send_sclk0_i),
        .DATA4(1'b0), .DATA5(1'b0), .CONTROL1(N49), .CONTROL2(N105),
        .CONTROL3(N108), .CONTROL4(N110), .CONTROL5(N70), .Z(N94) );
  SELECT_OP C505 ( .DATA1({1'b0, 1'b0, 1'b0}), .DATA2({N77, N76, N75}),
        .DATA3({N89, N88, N87}), .CONTROL1(N49), .CONTROL2(N105), .CONTROL3(
        N108), .Z({N97, N96, N95}) );
  SELECT_OP C506 ( .DATA1(1'b1), .DATA2(N85), .DATA3(1'b0), .DATA4(1'b1),
        .DATA5(1'b0), .CONTROL1(N49), .CONTROL2(N105), .CONTROL3(N108),
        .CONTROL4(N110), .CONTROL5(N70), .Z(N98) );
  SELECT_OP C507 ( .DATA1({1'b1, 1'b1, 1'b1}), .DATA2({N81, N80, N79}),
        .DATA3({N93, N92, N91}), .CONTROL1(N49), .CONTROL2(N105), .CONTROL3(
        N110), .Z({N101, N100, N99}) );
  SELECT_OP C508 ( .DATA1(1'b0), .DATA2(N82), .DATA3(mosi_send_sclk0_i),
        .DATA4(1'b1), .DATA5(1'b0), .CONTROL1(N49), .CONTROL2(N105),
        .CONTROL3(N108), .CONTROL4(N110), .CONTROL5(N70), .Z(N102) );
  SELECT_OP C509 ( .DATA1(N83), .DATA2(N62), .DATA3(N63), .CONTROL1(N105),
        .CONTROL2(N108), .CONTROL3(N110), .Z(N103) );
  SELECT_OP C510 ( .DATA1({N118, N119, N120, N121, N122, N123, N124, N125}),
        .DATA2({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(
        N50), .CONTROL2(N51), .Z({N136, N135, N134, N133, N132, N131, N130,
        N129}) );
  SELECT_OP C511 ( .DATA1({N136, N135, N134, N133, N132, N131, N130, N129}),
        .DATA2({N145, N144, N143, N142, N141, N140, N139, N138}), .DATA3({1'b0,
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N48), .CONTROL2(
        N209), .CONTROL3(N116), .Z({N156, N155, N154, N153, N152, N151, N150,
        N149}) );
  SELECT_OP C512 ( .DATA1(miso_receive_sclk0_i), .DATA2(1'b0), .DATA3(1'b0),
        .CONTROL1(N48), .CONTROL2(N209), .CONTROL3(N116), .Z(N157) );
  SELECT_OP C513 ( .DATA1(1'b0), .DATA2(1'b1), .DATA3(1'b0), .CONTROL1(N48),
        .CONTROL2(N209), .CONTROL3(N116), .Z(N158) );
  SELECT_OP C514 ( .DATA1({N160, N161, N162, N163, N164, N165, N166, N167}),
        .DATA2({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(
        N52), .CONTROL2(N53), .Z({N178, N177, N176, N175, N174, N173, N172,
        N171}) );
  SELECT_OP C515 ( .DATA1(1'b1), .DATA2(N157), .DATA3(miso_receive_sclk_i),
        .DATA4(1'b0), .DATA5(1'b0), .CONTROL1(N49), .CONTROL2(N105),
        .CONTROL3(N108), .CONTROL4(N208), .CONTROL5(N114), .Z(N191) );
  SELECT_OP C516 ( .DATA1({1'b0, 1'b0, 1'b0}), .DATA2({N128, N127, N126}),
        .DATA3({N170, N169, N168}), .CONTROL1(N49), .CONTROL2(N105),
        .CONTROL3(N108), .Z({N194, N193, N192}) );
  SELECT_OP C517 ( .DATA1(1'b1), .DATA2(N158), .DATA3(1'b0), .DATA4(1'b1),
        .DATA5(1'b0), .CONTROL1(N49), .CONTROL2(N105), .CONTROL3(N108),
        .CONTROL4(N208), .CONTROL5(N114), .Z(N195) );
  SELECT_OP C518 ( .DATA1({1'b1, 1'b1, 1'b1}), .DATA2({N148, N147, N146}),
        .DATA3({N190, N189, N188}), .CONTROL1(N49), .CONTROL2(N105),
        .CONTROL3(N208), .Z({N198, N197, N196}) );
  SELECT_OP C519 ( .DATA1({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}),
        .DATA2({N156, N155, N154, N153, N152, N151, N150, N149}), .DATA3({N178,
        N177, N176, N175, N174, N173, N172, N171}), .DATA4({N187, N186, N185,
        N184, N183, N182, N181, N180}), .DATA5({1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
        1'b0, 1'b0, 1'b0}), .CONTROL1(N49), .CONTROL2(N105), .CONTROL3(N108),
        .CONTROL4(N208), .CONTROL5(N114), .Z({N207, N206, N205, N204, N203,
        N202, N201, N199}) );
  SELECT_OP C520 ( .DATA1(1'b0), .DATA2(miso_i), .DATA3(miso_i), .DATA4(miso_i), .CONTROL1(N49), .CONTROL2(N105), .CONTROL3(N108), .CONTROL4(N208), .Z(N200)
         );
  SELECT_OP C521 ( .DATA1(temp_reg), .DATA2({1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
        1'b0, 1'b0, 1'b0}), .CONTROL1(N54), .CONTROL2(N55), .Z(data_miso_o) );
  MUX_OP C522 ( .D0(shift_reg[0]), .D1(shift_reg[1]), .D2(shift_reg[2]), .D3(
        shift_reg[3]), .D4(shift_reg[4]), .D5(shift_reg[5]), .D6(shift_reg[6]),
        .D7(shift_reg[7]), .S0(N56), .S1(N57), .S2(N58), .Z(N62) );
  MUX_OP C523 ( .D0(shift_reg[0]), .D1(shift_reg[1]), .D2(shift_reg[2]), .D3(
        shift_reg[3]), .D4(shift_reg[4]), .D5(shift_reg[5]), .D6(shift_reg[6]),
        .D7(shift_reg[7]), .S0(N59), .S1(N60), .S2(N61), .Z(N63) );
  GTECH_NOT I_48 ( .A(PRESET_n), .Z(N64) );
  GTECH_OR2 C529 ( .A(N244), .B(N246), .Z(N66) );
  GTECH_AND2 C530 ( .A(N243), .B(cpol_i), .Z(N244) );
  GTECH_NOT I_49 ( .A(cpha_i), .Z(N243) );
  GTECH_AND2 C532 ( .A(N245), .B(cpha_i), .Z(N246) );
  GTECH_NOT I_50 ( .A(cpol_i), .Z(N245) );
  GTECH_NOT I_58 ( .A(miso_receive_sclk0_i), .Z(N117) );
  GTECH_NOT I_59 ( .A(miso_receive_sclk_i), .Z(N159) );
  GTECH_NOT I_60 ( .A(receive_data_i), .Z(N210) );
  GTECH_BUF B_0 ( .A(lsbfe_i), .Z(N48) );
  GTECH_BUF B_1 ( .A(ss_i), .Z(N49) );
  GTECH_BUF B_2 ( .A(miso_receive_sclk0_i), .Z(N50) );
  GTECH_BUF B_3 ( .A(N117), .Z(N51) );
  GTECH_BUF B_4 ( .A(miso_receive_sclk_i), .Z(N52) );
  GTECH_BUF B_5 ( .A(N159), .Z(N53) );
  GTECH_BUF B_6 ( .A(receive_data_i), .Z(N54) );
  GTECH_BUF B_7 ( .A(N210), .Z(N55) );
  GTECH_BUF B_8 ( .A(count[0]), .Z(N56) );
  GTECH_BUF B_9 ( .A(count[1]), .Z(N57) );
  GTECH_BUF B_10 ( .A(count[2]), .Z(N58) );
  GTECH_BUF B_11 ( .A(count1[0]), .Z(N59) );
  GTECH_BUF B_12 ( .A(count1[1]), .Z(N60) );
  GTECH_BUF B_13 ( .A(count1[2]), .Z(N61) );
  GTECH_BUF B_14 ( .A(PRESET_n), .Z(N65) );
  GTECH_OR2 C536 ( .A(N66), .B(ss_i), .Z(N67) );
  GTECH_OR2 C537 ( .A(lsbfe_i), .B(N67), .Z(N68) );
  GTECH_OR2 C538 ( .A(mosi_send_sclk0_i), .B(N68), .Z(N69) );
  GTECH_NOT I_51 ( .A(N69), .Z(N70) );
  GTECH_AND2 C540 ( .A(N65), .B(N105), .Z(N71) );
  GTECH_OR2 C542 ( .A(mosi_send_sclk_i), .B(lsbfe_i), .Z(N72) );
  GTECH_NOT I_52 ( .A(N72), .Z(N73) );
  GTECH_AND2 C544 ( .A(N71), .B(lsbfe_i), .Z(N74) );
  GTECH_AND2 C547 ( .A(N71), .B(N112), .Z(N78) );
  GTECH_AND2 C548 ( .A(N65), .B(N108), .Z(N86) );
  GTECH_AND2 C551 ( .A(N65), .B(N110), .Z(N90) );
  GTECH_NOT I_53 ( .A(ss_i), .Z(N104) );
  GTECH_AND2 C553 ( .A(N66), .B(N104), .Z(N105) );
  GTECH_NOT I_54 ( .A(N66), .Z(N106) );
  GTECH_AND2 C555 ( .A(N104), .B(N106), .Z(N107) );
  GTECH_AND2 C556 ( .A(lsbfe_i), .B(N107), .Z(N108) );
  GTECH_AND2 C557 ( .A(N107), .B(N111), .Z(N109) );
  GTECH_AND2 C558 ( .A(mosi_send_sclk0_i), .B(N109), .Z(N110) );
  GTECH_NOT I_55 ( .A(lsbfe_i), .Z(N111) );
  GTECH_AND2 C561 ( .A(mosi_send_sclk_i), .B(N111), .Z(N112) );
  GTECH_OR2 C563 ( .A(miso_receive_sclk_i), .B(N68), .Z(N113) );
  GTECH_NOT I_56 ( .A(N113), .Z(N114) );
  GTECH_OR2 C565 ( .A(miso_receive_sclk0_i), .B(lsbfe_i), .Z(N115) );
  GTECH_NOT I_57 ( .A(N115), .Z(N116) );
  GTECH_AND2 C571 ( .A(N71), .B(N209), .Z(N137) );
  GTECH_AND2 C576 ( .A(N65), .B(N208), .Z(N179) );
  GTECH_AND2 C577 ( .A(miso_receive_sclk_i), .B(N109), .Z(N208) );
  GTECH_AND2 C579 ( .A(miso_receive_sclk0_i), .B(N111), .Z(N209) );
endmodule


module Slave_select_number_of_bits8 ( PCLK, PRESET_n, mstr_i, spiswai_i,
        spi_mode_i, send_data_i, BaudRateDivisor_i, receive_data_o, ss_o,
        tip_o );
  input [1:0] spi_mode_i;
  input [11:0] BaudRateDivisor_i;
  input PCLK, PRESET_n, mstr_i, spiswai_i, send_data_i;
  output receive_data_o, ss_o, tip_o;
  wire   N3, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N33, N34, N35,
         N36, N37, n4, n2, n3, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n94;
  wire   [15:0] count;

  FD2 \count_reg[15]  ( .D(N37), .CP(PCLK), .CD(PRESET_n), .Q(count[15]) );
  FD2 \count_reg[14]  ( .D(N36), .CP(PCLK), .CD(PRESET_n), .Q(count[14]), .QN(
        n91) );
  FD2 \count_reg[13]  ( .D(N35), .CP(PCLK), .CD(PRESET_n), .QN(n90) );
  FD2 \count_reg[12]  ( .D(N34), .CP(PCLK), .CD(PRESET_n), .Q(count[12]) );
  FD2 \count_reg[11]  ( .D(N33), .CP(PCLK), .CD(PRESET_n), .Q(count[11]), .QN(
        n88) );
  FD2 \count_reg[9]  ( .D(N31), .CP(PCLK), .CD(PRESET_n), .Q(count[9]), .QN(
        n89) );
  FD2 \count_reg[8]  ( .D(N30), .CP(PCLK), .CD(PRESET_n), .Q(count[8]) );
  FD2 \count_reg[7]  ( .D(N29), .CP(PCLK), .CD(PRESET_n), .Q(count[7]), .QN(
        n87) );
  FD2 \count_reg[6]  ( .D(N28), .CP(PCLK), .CD(PRESET_n), .Q(count[6]) );
  FD2 \count_reg[5]  ( .D(N27), .CP(PCLK), .CD(PRESET_n), .Q(count[5]), .QN(
        n86) );
  FD2 \count_reg[4]  ( .D(N26), .CP(PCLK), .CD(PRESET_n), .Q(count[4]) );
  FD2 \count_reg[3]  ( .D(N25), .CP(PCLK), .CD(PRESET_n), .Q(count[3]), .QN(
        n85) );
  FD2 \count_reg[2]  ( .D(N24), .CP(PCLK), .CD(PRESET_n), .QN(n84) );
  FD2 \count_reg[1]  ( .D(N23), .CP(PCLK), .CD(PRESET_n), .Q(count[1]) );
  FD2 \count_reg[0]  ( .D(N22), .CP(PCLK), .CD(PRESET_n), .Q(count[0]) );
  FD2 receive_data_o_reg ( .D(N3), .CP(PCLK), .CD(PRESET_n), .Q(receive_data_o) );
  FD4 ss_o_reg ( .D(n4), .CP(PCLK), .SD(PRESET_n), .Q(ss_o), .QN(tip_o) );
  FD4 \count_reg[10]  ( .D(n94), .CP(PCLK), .SD(PRESET_n), .Q(n92), .QN(
        count[10]) );
  ND2 U3 ( .A(BaudRateDivisor_i[10]), .B(n90), .Z(n5) );
  NR2 U4 ( .A(BaudRateDivisor_i[1]), .B(BaudRateDivisor_i[0]), .Z(n24) );
  IVP U5 ( .A(BaudRateDivisor_i[2]), .Z(n15) );
  ND2 U6 ( .A(n24), .B(n15), .Z(n22) );
  NR2 U7 ( .A(BaudRateDivisor_i[3]), .B(n22), .Z(n21) );
  IVP U8 ( .A(n21), .Z(n7) );
  NR2 U9 ( .A(n7), .B(BaudRateDivisor_i[4]), .Z(n6) );
  IVP U10 ( .A(n6), .Z(n14) );
  NR2 U11 ( .A(BaudRateDivisor_i[5]), .B(n14), .Z(n13) );
  IVP U12 ( .A(n13), .Z(n12) );
  NR2 U13 ( .A(n12), .B(BaudRateDivisor_i[6]), .Z(n46) );
  IVP U14 ( .A(n46), .Z(n49) );
  NR2 U15 ( .A(BaudRateDivisor_i[7]), .B(n49), .Z(n23) );
  IVP U16 ( .A(BaudRateDivisor_i[8]), .Z(n8) );
  ND2 U17 ( .A(n23), .B(n8), .Z(n45) );
  NR2 U18 ( .A(BaudRateDivisor_i[9]), .B(n45), .Z(n44) );
  NR2 U19 ( .A(BaudRateDivisor_i[10]), .B(n90), .Z(n37) );
  NR2 U20 ( .A(n44), .B(n37), .Z(n3) );
  ND2 U21 ( .A(BaudRateDivisor_i[11]), .B(n91), .Z(n36) );
  ND2 U22 ( .A(n5), .B(n36), .Z(n2) );
  AO2 U23 ( .A(n5), .B(n3), .C(n44), .D(n2), .Z(n58) );
  AO6 U24 ( .A(BaudRateDivisor_i[4]), .B(n7), .C(n6), .Z(n11) );
  AO2 U25 ( .A(BaudRateDivisor_i[8]), .B(count[11]), .C(n88), .D(n8), .Z(n48)
         );
  ND2 U26 ( .A(n48), .B(n49), .Z(n10) );
  ND2 U27 ( .A(count[7]), .B(n11), .Z(n9) );
  AO3 U28 ( .A(count[7]), .B(n11), .C(n10), .D(n9), .Z(n57) );
  AO6 U29 ( .A(BaudRateDivisor_i[6]), .B(n12), .C(n46), .Z(n43) );
  AO6 U30 ( .A(BaudRateDivisor_i[5]), .B(n14), .C(n13), .Z(n40) );
  IVP U31 ( .A(BaudRateDivisor_i[11]), .Z(n20) );
  ND2 U32 ( .A(BaudRateDivisor_i[1]), .B(BaudRateDivisor_i[0]), .Z(n25) );
  IVP U33 ( .A(n25), .Z(n18) );
  AO2 U34 ( .A(BaudRateDivisor_i[2]), .B(n86), .C(count[5]), .D(n15), .Z(n16)
         );
  ND2 U35 ( .A(count[4]), .B(n16), .Z(n17) );
  AO4 U36 ( .A(n18), .B(n17), .C(n24), .D(n16), .Z(n19) );
  AO1P U37 ( .A(count[14]), .B(n20), .C(count[15]), .D(n19), .Z(n35) );
  AO6 U38 ( .A(BaudRateDivisor_i[3]), .B(n22), .C(n21), .Z(n33) );
  IVP U39 ( .A(n23), .Z(n30) );
  ND2 U40 ( .A(count[0]), .B(count[1]), .Z(n66) );
  NR2P U41 ( .A(n66), .B(n84), .Z(n65) );
  IVP U42 ( .A(n24), .Z(n26) );
  AO6 U43 ( .A(n26), .B(n25), .C(count[4]), .Z(n28) );
  NR2 U44 ( .A(BaudRateDivisor_i[0]), .B(count[3]), .Z(n27) );
  AO1P U45 ( .A(BaudRateDivisor_i[0]), .B(count[3]), .C(n28), .D(n27), .Z(n29)
         );
  AO3 U46 ( .A(count[10]), .B(n30), .C(n65), .D(n29), .Z(n32) );
  NR2 U47 ( .A(count[6]), .B(n33), .Z(n31) );
  AO1P U48 ( .A(count[6]), .B(n33), .C(n32), .D(n31), .Z(n34) );
  AO3 U49 ( .A(n37), .B(n36), .C(n35), .D(n34), .Z(n39) );
  NR2 U50 ( .A(count[8]), .B(n40), .Z(n38) );
  AO1P U51 ( .A(count[8]), .B(n40), .C(n39), .D(n38), .Z(n42) );
  ND2 U52 ( .A(count[9]), .B(n43), .Z(n41) );
  AO3 U53 ( .A(count[9]), .B(n43), .C(n42), .D(n41), .Z(n56) );
  AO6 U54 ( .A(BaudRateDivisor_i[9]), .B(n45), .C(n44), .Z(n54) );
  NR2 U55 ( .A(n46), .B(count[10]), .Z(n47) );
  NR2 U56 ( .A(n48), .B(n47), .Z(n51) );
  AO3 U57 ( .A(n92), .B(n49), .C(BaudRateDivisor_i[7]), .D(n51), .Z(n50) );
  AO7 U58 ( .A(n51), .B(BaudRateDivisor_i[7]), .C(n50), .Z(n53) );
  ND2 U59 ( .A(count[12]), .B(n54), .Z(n52) );
  AO3 U60 ( .A(count[12]), .B(n54), .C(n53), .D(n52), .Z(n55) );
  NR4 U61 ( .A(n58), .B(n57), .C(n56), .D(n55), .Z(N3) );
  ND2 U62 ( .A(send_data_i), .B(mstr_i), .Z(n59) );
  OR2P U63 ( .A(spiswai_i), .B(n59), .Z(n4) );
  IVP U64 ( .A(n65), .Z(n68) );
  NR2P U65 ( .A(n68), .B(n85), .Z(n67) );
  ND2 U66 ( .A(count[4]), .B(n67), .Z(n70) );
  NR2P U67 ( .A(n86), .B(n70), .Z(n69) );
  ND2 U68 ( .A(count[6]), .B(n69), .Z(n72) );
  NR2 U69 ( .A(n87), .B(n72), .Z(n71) );
  ND2 U70 ( .A(count[8]), .B(n71), .Z(n73) );
  NR2 U71 ( .A(N3), .B(n4), .Z(n74) );
  AO3 U72 ( .A(count[8]), .B(n71), .C(n73), .D(n74), .Z(n60) );
  IVP U73 ( .A(n60), .Z(N30) );
  AO3 U74 ( .A(count[6]), .B(n69), .C(n72), .D(n74), .Z(n61) );
  IVP U75 ( .A(n61), .Z(N28) );
  AO3 U76 ( .A(count[4]), .B(n67), .C(n70), .D(n74), .Z(n62) );
  IVP U77 ( .A(n62), .Z(N26) );
  NR2 U78 ( .A(n89), .B(n73), .Z(n75) );
  ND2 U79 ( .A(count[10]), .B(n75), .Z(n77) );
  NR2 U80 ( .A(n88), .B(n77), .Z(n76) );
  ND2 U81 ( .A(count[12]), .B(n76), .Z(n78) );
  AO3 U82 ( .A(count[12]), .B(n76), .C(n78), .D(n74), .Z(n63) );
  IVP U83 ( .A(n63), .Z(N34) );
  IVP U84 ( .A(n74), .Z(n82) );
  NR2 U85 ( .A(count[0]), .B(n82), .Z(N22) );
  NR2 U86 ( .A(count[0]), .B(count[1]), .Z(n64) );
  AO1P U87 ( .A(count[0]), .B(count[1]), .C(n82), .D(n64), .Z(N23) );
  AO1P U88 ( .A(n66), .B(n84), .C(n65), .D(n82), .Z(N24) );
  AO1P U89 ( .A(n68), .B(n85), .C(n67), .D(n82), .Z(N25) );
  AO1P U90 ( .A(n86), .B(n70), .C(n69), .D(n82), .Z(N27) );
  AO1P U91 ( .A(n87), .B(n72), .C(n71), .D(n82), .Z(N29) );
  AO1P U92 ( .A(n89), .B(n73), .C(n75), .D(n82), .Z(N31) );
  AO3 U93 ( .A(count[10]), .B(n75), .C(n77), .D(n74), .Z(n94) );
  AO1P U94 ( .A(n88), .B(n77), .C(n76), .D(n82), .Z(N33) );
  NR2 U95 ( .A(n90), .B(n78), .Z(n79) );
  AO1P U96 ( .A(n90), .B(n78), .C(n79), .D(n82), .Z(N35) );
  IVP U97 ( .A(n79), .Z(n80) );
  NR2 U98 ( .A(n91), .B(n80), .Z(n83) );
  AO1P U99 ( .A(n91), .B(n80), .C(n83), .D(n82), .Z(N36) );
  NR2 U100 ( .A(count[15]), .B(n83), .Z(n81) );
  AO1P U101 ( .A(count[15]), .B(n83), .C(n82), .D(n81), .Z(N37) );
endmodule


module spi_core ( PCLK, PRESET_n, PADDR_i, PWRITE_i, PSEL_i, PENABLE_i,
        PWDATA_i, miso_i, spi_mode_i, PRDATA_o, PREADY_o, PSLVERR_o, ss_o,
        sclk_o, spi_interrupt_request_o, mosi_o );
  input [2:0] PADDR_i;
  input [7:0] PWDATA_i;
  input [1:0] spi_mode_i;
  output [7:0] PRDATA_o;
  input PCLK, PRESET_n, PWRITE_i, PSEL_i, PENABLE_i, miso_i;
  output PREADY_o, PSLVERR_o, ss_o, sclk_o, spi_interrupt_request_o, mosi_o;
  wire   receive_data_s, tip_s, mstr_s, cpol_s, cpha_s, lsbfe_s, spiswai_s,
         send_data_s, miso_rec_sclk_s, miso_rec_sclk0_s, mosi_snd_sclk_s,
         mosi_snd_sclk0_s;
  wire   [7:0] data_miso_s;
  wire   [1:0] spi_mode_s;
  wire   [7:0] data_mosi_s;
  wire   [2:0] spr_s;
  wire   [2:0] sppr_s;
  wire   [11:0] baud_div_s;
  wire   SYNOPSYS_UNCONNECTED__0;

  APBSlaveI apb_interface ( .PCLK(PCLK), .PRESET_n(PRESET_n), .PWRITE_i(
        PWRITE_i), .PSEL_i(PSEL_i), .PENABLE_i(PENABLE_i), .ss_i(ss_o),
        .receive_data_i(receive_data_s), .tip_i(tip_s), .PADDR_i(PADDR_i),
        .PWDATA_i(PWDATA_i), .miso_data_i(data_miso_s), .spi_mode_i(spi_mode_i), .PRDATA_o(PRDATA_o), .mstr_o(mstr_s), .cpol_o(cpol_s), .cpha_o(cpha_s),
        .lsbfe_o(lsbfe_s), .spiswai_o(spiswai_s), .spi_interrupt_request_o(
        spi_interrupt_request_o), .PREADY_o(PREADY_o), .PSLVERR_o(PSLVERR_o),
        .send_data_o(send_data_s), .spi_mode_o({SYNOPSYS_UNCONNECTED__0,
        spi_mode_s[0]}), .mosi_data_o(data_mosi_s), .spr_o(spr_s), .sppr_o(
        sppr_s) );
  BaudRateGen baud_generator ( .PCLK(PCLK), .PRESET_n(PRESET_n), .spiswai_i(
        spiswai_s), .cpol_i(cpol_s), .cpha_i(cpha_s), .ss_i(ss_o), .sppr_i(
        sppr_s), .spr_i(spr_s), .spi_mode_i({1'b0, spi_mode_s[0]}), .sclk_o(
        sclk_o), .miso_receive_sclk_o(miso_rec_sclk_s), .miso_receive_sclk0_o(
        miso_rec_sclk0_s), .mosi_send_sclk_o(mosi_snd_sclk_s),
        .mosi_send_sclk0_o(mosi_snd_sclk0_s), .BaudRateDivisor_o(baud_div_s)
         );
  ShiftReg shift_register ( .PCLK(PCLK), .PRESET_n(PRESET_n), .ss_i(ss_o),
        .send_data_i(send_data_s), .lsbfe_i(lsbfe_s), .cpha_i(cpha_s),
        .cpol_i(cpol_s), .miso_receive_sclk0_i(miso_rec_sclk0_s),
        .miso_receive_sclk_i(miso_rec_sclk_s), .mosi_send_sclk0_i(
        mosi_snd_sclk0_s), .mosi_send_sclk_i(mosi_snd_sclk_s), .data_mosi_i(
        data_mosi_s), .miso_i(miso_i), .receive_data_i(receive_data_s),
        .mosi_o(mosi_o), .data_miso_o(data_miso_s) );
  Slave_select_number_of_bits8 slave_control ( .PCLK(PCLK), .PRESET_n(PRESET_n), .mstr_i(mstr_s), .spiswai_i(spiswai_s), .spi_mode_i({1'b0, net770}),
        .send_data_i(send_data_s), .BaudRateDivisor_i(baud_div_s),
        .receive_data_o(receive_data_s), .ss_o(ss_o), .tip_o(tip_s) );
endmodule
