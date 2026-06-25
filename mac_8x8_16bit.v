`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2026 16:13:48
// Design Name: 
// Module Name: mac_8x8_16bit
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


module mac_8x8_16bit(

    input  wire        clk,
    input  wire        rst,
    input  wire        enable,

    input  wire [15:0]  A,
    input  wire [15:0]  B,
    input  wire [15:0] add_in,
    
//    output wire [15:0] Acc_o,

    output reg  [15:0] ACC

);

    wire [15:0] product;
 

    assign product = A[7:0] * B[7:0];

    always @(posedge clk or posedge rst)
    begin

        if(rst)
        begin
            ACC <= 0;
        end

        else if(enable)
        begin
            ACC <= add_in + product;
        end

    end

endmodule
