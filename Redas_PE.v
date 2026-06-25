`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2026 16:18:58
// Design Name: 
// Module Name: Redas_PE
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


module Redas_PE(

    input  wire        clk,
    input  wire        rst,
    input  wire        enable,

    input  wire [15:0]  left_in,
    input  wire [15:0]  right_in,
    input  wire [15:0]  top_in,
    input  wire [15:0]  bottom_in,

    input  wire        TB_in_sel,
    input  wire        LR_in_sel,
    input  wire        TB_out_sel,
    input  wire        LR_out_sel,   

    input  wire        a_sel,
    input  wire        b_sel,
    input  wire        c_sel,
    input  wire        d_sel,
    input  wire        mux_a_sel,
    input  wire        mux_b_sel,    
    
    output wire [15:0]   left_out,
    output wire [15:0]   right_out,
    output wire [15:0]   top_out,
    output wire [15:0]   bottom_out,    
    output wire [15:0] acc_out
    
    );


    wire [15:0] LR_in_out0;
    wire [15:0] LR_in_out1;
    
    wire [15:0] TB_in_out0;
    wire [15:0] TB_in_out1;
    
    wire [15:0] LR_out_out0;
    wire [15:0] LR_out_out1;
    
    wire [15:0] TB_out_out0;
    wire [15:0] TB_out_out1;
    
    wire [15:0] a_out0;
    wire [15:0] a_out1;
    
    wire [15:0] b_out0;
    wire [15:0] b_out1;
    
    wire [15:0] c_out0;
    wire [15:0] c_out1;
    
    wire [15:0] d_out0;
    wire [15:0] d_out1;
  
    wire [15:0] mux_a_out0;
    wire [15:0] mux_b_out0;  
    
     reg [15:0]   reg_left_out;
     reg [15:0]   reg_right_out;
     reg [15:0]   reg_top_out;
     reg [15:0]   reg_bottom_out;
    
           
    LR_in_crossbar lr_in_inst(

        .in0(left_in),
        .in1(right_in),

        .sel(LR_in_sel),

        .out0(LR_in_out0),
        .out1(LR_in_out1)

    );
    
    TB_in_crossbar tb_in_inst(

        .in0(top_in),
        .in1(bottom_in),

        .sel(TB_in_sel),

        .out0(TB_in_out0),
        .out1(TB_in_out1)

    );
    
     TB_out_crossbar tb_out_inst(

        .in0(reg_top_out),
        .in1(reg_bottom_out),

        .sel(TB_out_sel),

        .out0(top_out),
        .out1(bottom_out)

    );
    
    LR_out_crossbar lr_out_inst(

        .in0(reg_left_out),
        .in1(reg_right_out),

        .sel(LR_out_sel),

        .out0(left_out),
        .out1(right_out)

    );
    
    crossbar_2x2 a_crossbar_inst(

        .in0(LR_in_out0),
        .in1(TB_in_out0),

        .sel(a_sel),

        .out0(a_out0),
        .out1(a_out1)

    );    

    crossbar_2x2 b_crossbar_inst(

        .in0(a_out1),
        .in1(acc_out),

        .sel(b_sel),

        .out0(b_out0),
        .out1(b_out1)

    );    

    crossbar_2x2 c_crossbar_inst(

        .in0(a_out0),
        .in1(acc_out),

        .sel(c_sel),

        .out0(c_out0),
        .out1(c_out1)

    );    

    crossbar_2x2 d_crossbar_inst(

        .in0(LR_in_out1),
        .in1(TB_in_out1),

        .sel(d_sel),

        .out0(d_out0),
        .out1(d_out1)

    );   
    
    mac_8x8_16bit mac_inst(

        .clk(clk),
        .rst(rst),
        .enable(enable),

        .A(a_out0),
        .B(b_out0),
        .add_in(b_out1),

        .ACC(acc_out)

    );
    
    mux mux_a_inst(

        .in0(TB_in_out0),
        .in1(c_out0),

        .sel(mux_a_sel),

        .out0(mux_a_out0)

    );
    
    mux mux_b_inst(

        .in0(LR_in_out0),
        .in1(c_out1),

        .sel(mux_b_sel),

        .out0(mux_b_out0)

    );    
 
    always @(posedge clk or posedge rst)
    begin

        if(rst)
        begin

            reg_top_out   <= 0;
            reg_bottom_out  <= 0;

            reg_left_out    <= 0;
            reg_right_out <= 0;

        end

        else if(enable)
        begin

            reg_top_out   <= mux_a_out0;
            reg_bottom_out  <= d_out0;

            reg_right_out    <= d_out1;
            reg_left_out <= mux_b_out0;

        end

    end
    
    
    
endmodule  
