module APBSlaveI_tb();

    reg        PCLK;
    reg        PRESET_n;
    reg [2:0]  PADDR_i;
    reg        PWRITE_i;
    reg        PSEL_i;
    reg        PENABLE_i;
    reg [7:0]  PWDATA_i;
    reg        ss_i;
    reg [7:0]  miso_data_i;
    reg        receive_data_i;
    reg        tip_i;
    reg [1:0]  spi_mode_i;

    wire [7:0] PRDATA_o;
    wire       mstr_o;
    wire       cpol_o;
    wire       cpha_o;
    wire       lsbfe_o;
    wire       spiswai_o;
    wire [2:0] sppr_o;
    wire [2:0] spr_o;
    wire       spi_interrupt_request_o;
    wire       PREADY_o;
    wire       PSLVERR_o;
    wire       send_data_o;
    wire [7:0] mosi_data_o;
    wire       spi_mode_o;

    APBSlaveI dut (
        .PCLK                   (PCLK),
        .PRESET_n               (PRESET_n),
        .PADDR_i                (PADDR_i),
        .PWRITE_i               (PWRITE_i),
        .PSEL_i                 (PSEL_i),
        .PENABLE_i              (PENABLE_i),
        .PWDATA_i               (PWDATA_i),
        .ss_i                   (ss_i),
        .miso_data_i            (miso_data_i),
        .receive_data_i         (receive_data_i),
        .tip_i                  (tip_i),
        .spi_mode_i             (spi_mode_i),
        .PRDATA_o               (PRDATA_o),
        .mstr_o                 (mstr_o),
        .cpol_o                 (cpol_o),
        .cpha_o                 (cpha_o),
        .lsbfe_o                (lsbfe_o),
        .spiswai_o              (spiswai_o),
        .sppr_o                 (sppr_o),
        .spr_o                  (spr_o),
        .spi_interrupt_request_o(spi_interrupt_request_o),
        .PREADY_o               (PREADY_o),
        .PSLVERR_o              (PSLVERR_o),
        .send_data_o            (send_data_o),
        .mosi_data_o            (mosi_data_o),
        .spi_mode_o             (spi_mode_o)
    );

    initial begin
        PCLK = 1'b0;
        forever #5 PCLK = ~PCLK;
    end

    task initialize;
        begin
            PRESET_n       = 1'b0;
            PADDR_i        = 3'b000;
            PWRITE_i       = 1'b0;
            PSEL_i         = 1'b0;
            PENABLE_i      = 1'b0;
            PWDATA_i       = 8'd0;
            ss_i           = 1'b1;
            miso_data_i    = 8'd0;
            receive_data_i = 1'b0;
            tip_i          = 1'b1;
            spi_mode_i     = 2'b10;
        end
    endtask

    task reset;
        begin
            @(negedge PCLK);
            PRESET_n = 1'b0;
            @(negedge PCLK);
            PRESET_n = 1'b1;
        end
    endtask

    task apb_write;
        input [2:0] addr;
        input [7:0] data;
        begin
            @(posedge PCLK);
            PADDR_i   = addr;
            PWRITE_i  = 1'b1;
            PSEL_i    = 1'b1;
            PENABLE_i = 1'b0;
            PWDATA_i  = data;
            @(posedge PCLK);
            PENABLE_i = 1'b1;
            @(posedge PCLK);
            PENABLE_i = 1'b0;
            PSEL_i    = 1'b0;
            PWRITE_i  = 1'b0;
        end
    endtask

    task apb_read;
        input [2:0] addr;
        begin
            @(posedge PCLK);
            PADDR_i   = addr;
            PWRITE_i  = 1'b0;
            PSEL_i    = 1'b1;
            PENABLE_i = 1'b0;
            @(posedge PCLK);
            PENABLE_i = 1'b1;
            @(posedge PCLK);
            PENABLE_i = 1'b0;
            PSEL_i    = 1'b0;
        end
    endtask

    task spi_cr1_write; input [7:0] d; begin apb_write(3'b000, d); end endtask
    task spi_cr2_write; input [7:0] d; begin apb_write(3'b001, d); end endtask
    task spi_br_write;  input [7:0] d; begin apb_write(3'b010, d); end endtask
    task spi_dr_write;  input [7:0] d; begin apb_write(3'b101, d); end endtask
    task spi_cr1_read;                 begin apb_read (3'b000);    end endtask
    task spi_sr_read;                  begin apb_read (3'b011);    end endtask
    task spi_dr_read;                  begin apb_read (3'b101);    end endtask

    initial begin
        $dumpfile("APB.vcd");
        $dumpvars(0, APBSlaveI_tb);

        initialize;
        reset;

        $display("\n=== TEST 1: Register Writes ===");

        spi_cr1_write(8'hFF);
        #1;
        $display("mstr_o=%b cpol_o=%b cpha_o=%b lsbfe_o=%b spi_mode_o=%b",
                  mstr_o, cpol_o, cpha_o, lsbfe_o, spi_mode_o);
        if (spi_mode_o !== 1'b1)
            $display("FAIL: spi_mode_o should be 1 (spe=1, mstr=1)");
        else
            $display("PASS: spi_mode_o=1");

        spi_cr2_write(8'hAA);
        #1;
        $display("spiswai_o=%b (expect 1)", spiswai_o);

        spi_br_write(8'h01);
        #1;
        $display("sppr_o=%b spr_o=%b (expect 000 001)", sppr_o, spr_o);

        $display("\n=== TEST 2: SPI_SR Read ===");
        spi_sr_read;
        #1;
        $display("PRDATA_o=0x%h (expect 0x20 when DR empty)", PRDATA_o);

        $display("\n=== TEST 3: SPI_CR_1 Readback ===");
        spi_cr1_read;
        #1;
        $display("PRDATA_o=0x%h (expect 0xFF)", PRDATA_o);

        $display("\n=== TEST 4: PSLVERR ===");
        tip_i = 1'b1;
        spi_sr_read;
        #1;
        $display("PSLVERR_o=%b tip_i=1 (expect 0, no error)", PSLVERR_o);

        tip_i = 1'b0;
        spi_sr_read;
        #1;
        $display("PSLVERR_o=%b tip_i=0 (expect 1, error asserted)", PSLVERR_o);
        tip_i = 1'b1;

        $display("\n=== TEST 5: send_data_o / mosi_data_o ===");

        spi_mode_i = 2'b10;

        spi_dr_write(8'h55);
        @(posedge PCLK);
        #1;
        $display("After first DR write: send_data_o=%b (expect 0)", send_data_o);

        spi_mode_i = 2'b00;
        spi_dr_write(8'h55);
        @(posedge PCLK);
        #1;
        $display("After second DR write (same val, run mode): send_data_o=%b mosi_data_o=0x%h (expect 1 / 0x55)",
                  send_data_o, mosi_data_o);
        if (send_data_o !== 1'b1)
            $display("FAIL: send_data_o should be 1");
        else
            $display("PASS: send_data_o=1, mosi_data=0x%h", mosi_data_o);

        spi_mode_i = 2'b10;

        $display("\n=== TEST 6: receive_data_i (MISO) ===");
        miso_data_i    = 8'hA5;
        spi_mode_i     = 2'b00;
        receive_data_i = 1'b1;
        @(posedge PCLK);
        receive_data_i = 1'b0;
        @(posedge PCLK);
        spi_mode_i = 2'b10;
        spi_dr_read;
        #1;
        $display("PRDATA_o=0x%h (expect 0xA5 from MISO)", PRDATA_o);
        if (PRDATA_o !== 8'hA5)
            $display("FAIL: received data mismatch");
        else
            $display("PASS: MISO data latched correctly");

        $display("\n=== TEST 7: Interrupt request ===");
        #1;
        $display("spi_interrupt_request_o=%b (expect 1, sptef=1 when DR=0)",
                  spi_interrupt_request_o);

        #100;
        $display("\n=== All tests done ===");
        $finish;
    end

endmodule