`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2025 20:42:45
// Design Name: 
// Module Name: Async_fifo_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module async_fifo_tb;

reg wr_clk = 0, rd_clk = 0, rst = 1, wr_en = 0, rd_en = 0;
reg [7:0] din = 0;
wire [7:0] dout;
wire full, empty;

async_fifo uut (
    .wr_clk(wr_clk),
    .rd_clk(rd_clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .din(din),
    .dout(dout),
    .full(full),
    .empty(empty)
);

// Clock generation
always #5 wr_clk = ~wr_clk;    // 10 time unit period
always #7 rd_clk = ~rd_clk;    // 14 time unit period

initial begin
    // Initial reset
    #10 rst = 0;

    // Write 5 values to FIFO
    repeat (5) begin
        @(posedge wr_clk);
        if (!full) begin
            din = din + 1;
            wr_en = 1;
        end
        @(posedge wr_clk);
        wr_en = 0;
    end

    
    #100;

    
    repeat (5) begin
        @(posedge rd_clk);
        if (!empty)
            rd_en = 1;
        @(posedge rd_clk);
        rd_en = 0;
    end

    #100 $finish;
end

endmodule


