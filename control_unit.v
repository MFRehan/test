`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:52:23 08/08/2018 
// Module Name:    control_unit 
// Project Name: 	 pipelined processor 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module control_unit(
	input wire clk,
	input wire [3:0] Cond,
	input wire [1:0] Op,
	input wire [5:0] Funct,
	input wire [3:0] Rd,
	input wire [3:0] ALUFlags,
	output wire PCSrc,
	output wire RegWrite,
	output wire MemWrite,
	output wire MemtoReg,
	output wire ALUSrc,
	output wire [1:0] ImmSrc,
	output wire [1:0] RegSrc,
	output wire [1:0] ALUControl
    );
	 
	 
// internal signals
	wire PCS;
	wire RegW;
	wire MemW;
	wire [1:0] FlagW;
	 
///////////////////////////
// Modules Instantiation //
///////////////////////////
	decoder Decoder
	(
		.Rd			(Rd),
		.Op			(Op),
		.Funct		(Funct),
		.PCS			(PCS),
		.RegW			(RegW),
		.MemW			(MemW),
		.MemtoReg	(MemtoReg),
		.ALUSrc		(ALUSrc),
		.ImmSrc		(ImmSrc),
		.RegSrc		(RegSrc),
		.ALUControl	(ALUControl),
		.FlagW		(FlagW)
	);
///////////////////////////

	conditional_logic ConditionalLogic
	(
		.clk			(clk),
		.PCS			(PCS),
		.RegW			(RegW),
		.MemW			(MemW),
		.FlagW		(FlagW),
		.Cond			(Cond),
		.ALUFlags	(ALUFlags),
		.PCSrc		(PCSrc),
		.RegWrite	(RegWrite),
		.MemWrite	(MemWrite)
	);

endmodule
