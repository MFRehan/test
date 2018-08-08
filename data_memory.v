`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:31:06 08/06/2018 
// Module Name:    data_memory 
// Project Name: 	 pipelined processor 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module data_memory(
	input wire clk,
	input wire WE,				//write enable
	input wire [31:0] A,		//address
	input wire [31:0] WD,	//input write data
	output reg [31:0] RD		//output read data
	
    );

//data memory storage
	reg [31:0] d_mem[31:0];
	
//data memory body 
	always @(posedge clk)
	if (WE)
		d_mem[A] <= WD;
	else
		RD <= d_mem[A];
	

endmodule
