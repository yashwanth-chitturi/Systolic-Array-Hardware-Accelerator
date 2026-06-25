`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2026 22:27:28
// Design Name: 
// Module Name: Redas_Array_2x2
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


module Redas_Array_2x2(

    input  wire        clk,
    input  wire        rst,
    input  wire        enable,

    // External Boundary Inputs

    input  wire [15:0] left_in_00,
    input  wire [15:0] left_in_10,

    input  wire [15:0] top_in_00,
    input  wire [15:0] top_in_01,

    // Control Signals
    input wire TB_in_sel,
    input wire LR_in_sel,
    input wire TB_out_sel,
    input wire LR_out_sel,

    input wire a_sel,
    input wire b_sel,
    input wire c_sel,
    input wire d_sel,

    input wire mux_a_sel,
    input wire mux_b_sel,

    // Final Outputs

    output wire [15:0] right_out_01,
    output wire [15:0] right_out_11,

    output wire [15:0] bottom_out_10,
    output wire [15:0] bottom_out_11,

    // Accumulator Outputs

    output wire [15:0] acc_pe00,
    output wire [15:0] acc_pe01,
    output wire [15:0] acc_pe10,
    output wire [15:0] acc_pe11

);

    //========================================================
    // Internal Interconnect Wires
    //========================================================

    // PE00 -> PE01
    wire [15:0] pe00_to_pe01;

    // PE00 -> PE10
    wire [15:0] pe00_to_pe10;

    // PE01 -> PE11
    wire [15:0] pe01_to_pe11;

    // PE10 -> PE11
    wire [15:0] pe10_to_pe11;

    // unused outputs
    wire [15:0] dummy0;
    wire [15:0] dummy1;
    wire [15:0] dummy2;
    wire [15:0] dummy3;

    //========================================================
    // PE00
    //========================================================

    Redas_PE PE00(

        .clk(clk),
        .rst(rst),
        .enable(enable),

        .left_in(left_in_00),
        .right_in(16'd0),

        .top_in(top_in_00),
        .bottom_in(16'd0),

        .TB_in_sel(TB_in_sel),
        .LR_in_sel(LR_in_sel),
        .TB_out_sel(TB_out_sel),
        .LR_out_sel(LR_out_sel),

        .a_sel(a_sel),
        .b_sel(b_sel),
        .c_sel(c_sel),
        .d_sel(d_sel),

        .mux_a_sel(mux_a_sel),
        .mux_b_sel(mux_b_sel),

        .left_out(dummy0),
        .right_out(pe00_to_pe01),

        .top_out(dummy1),
        .bottom_out(pe00_to_pe10),

        .acc_out(acc_pe00)

    );

    //========================================================
    // PE01
    //========================================================

    Redas_PE PE01(

        .clk(clk),
        .rst(rst),
        .enable(enable),

        .left_in(pe00_to_pe01),
        .right_in(16'd0),

        .top_in(top_in_01),
        .bottom_in(16'd0),

        .TB_in_sel(TB_in_sel),
        .LR_in_sel(LR_in_sel),
        .TB_out_sel(TB_out_sel),
        .LR_out_sel(LR_out_sel),

        .a_sel(a_sel),
        .b_sel(b_sel),
        .c_sel(c_sel),
        .d_sel(d_sel),

        .mux_a_sel(mux_a_sel),
        .mux_b_sel(mux_b_sel),

        .left_out(dummy2),
        .right_out(right_out_01),

        .top_out(dummy3),
        .bottom_out(pe01_to_pe11),

        .acc_out(acc_pe01)

    );

    //========================================================
    // PE10
    //========================================================

    Redas_PE PE10(

        .clk(clk),
        .rst(rst),
        .enable(enable),

        .left_in(left_in_10),
        .right_in(16'd0),

        .top_in(pe00_to_pe10),
        .bottom_in(16'd0),

        .TB_in_sel(TB_in_sel),
        .LR_in_sel(LR_in_sel),
        .TB_out_sel(TB_out_sel),
        .LR_out_sel(LR_out_sel),

        .a_sel(a_sel),
        .b_sel(b_sel),
        .c_sel(c_sel),
        .d_sel(d_sel),

        .mux_a_sel(mux_a_sel),
        .mux_b_sel(mux_b_sel),

        .left_out(),
        .right_out(pe10_to_pe11),

        .top_out(),
        .bottom_out(bottom_out_10),

        .acc_out(acc_pe10)

    );

    //========================================================
    // PE11
    //========================================================

    Redas_PE PE11(

        .clk(clk),
        .rst(rst),
        .enable(enable),

        .left_in(pe10_to_pe11),
        .right_in(16'd0),

        .top_in(pe01_to_pe11),
        .bottom_in(16'd0),

        .TB_in_sel(TB_in_sel),
        .LR_in_sel(LR_in_sel),
        .TB_out_sel(TB_out_sel),
        .LR_out_sel(LR_out_sel),

        .a_sel(a_sel),
        .b_sel(b_sel),
        .c_sel(c_sel),
        .d_sel(d_sel),

        .mux_a_sel(mux_a_sel),
        .mux_b_sel(mux_b_sel),

        .left_out(),
        .right_out(right_out_11),

        .top_out(),
        .bottom_out(bottom_out_11),

        .acc_out(acc_pe11)

    );

endmodule
