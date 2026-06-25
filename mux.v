`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2026 16:15:24
// Design Name: 
// Module Name: mux
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


module mux(
    input  wire [15:0] in0,
    input  wire [15:0] in1,
    input  wire       sel,
    output wire [15:0] out0

    );
    
    assign out0 = (sel == 1'b0) ? in0 : in1;
endmodule
