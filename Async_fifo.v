`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2025 20:39:48
// Design Name: 
// Module Name: Async_fifo
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


module async_fifo #(parameter DATA_WIDTH = 8, ADDR_WIDTH = 4)(
    input wire wr_clk,
    input wire rd_clk,
    input wire rst,
    input wire wr_en,
    input wire rd_en,
    input wire [DATA_WIDTH-1:0] din,
    output reg [DATA_WIDTH-1:0] dout,
    output reg full,
    output reg empty
);

reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];
reg [ADDR_WIDTH:0] wr_ptr = 0;
reg [ADDR_WIDTH:0] rd_ptr = 0;

always @(posedge wr_clk or posedge rst) begin
    if (rst) begin
        wr_ptr <= 0;
        full <= 0;
    end else if (wr_en && !full) begin
        mem[wr_ptr[ADDR_WIDTH-1:0]] <= din;
        wr_ptr <= wr_ptr + 1;
    end
end

always @(posedge rd_clk or posedge rst) begin
    if (rst) begin
        rd_ptr <= 0;
        dout <= 0;
        empty <= 1;
    end else if (rd_en && !empty) begin
        dout <= mem[rd_ptr[ADDR_WIDTH-1:0]];
        rd_ptr <= rd_ptr + 1;
    end
end

always @(*) begin
    full = (wr_ptr - rd_ptr == (1<<ADDR_WIDTH));
    empty = (wr_ptr == rd_ptr);
end

endmodule

