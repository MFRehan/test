`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:46:05 08/08/2018 
// Module Name:    decoder 
// Project Name:	 pipelined processor  
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module decoder(
	input wire [3:0] Rd,
	input wire [1:0] Op,
	input wire [5:0] Funct,
	output wire PCSrcD,
	output wire RegWriteD,
	output wire MemtoRegD,	
	output wire MemWriteD,
	output wire [1:0] ALUControlD,
	output wire BranchD,
	output wire ALUSrcD,
	output wire [1:0] FlagWriteD,
	output wire [1:0] ImmSrcD,
	output wire [1:0] RegSrcD
	);

// internal signals 
	reg ALUOp;

///////////////////////////
// Modules Instantiation //
///////////////////////////
	main_decoder MainDecoder 
	(
		.Op			(Op),
		.Funct		(Funct),
		.Branch		(BranchD),
		.MemtoReg	(MemtoRegD),
		.MemW			(MemWriteD),
		.ALUSrc		(ALUSrcD),
		.ImmSrc		(ImmSrcD),
		.RegW			(RegWriteD),
		.RegSrc		(RegSrcD),
		.ALUOp		(ALUOp)
	);
///////////////////////////

	alu_decoder ALUDecoder
	(
		.Funct		(Funct[4:0]),
		.ALUOp		(ALUOp),
		.ALUControl	(ALUControlD),
		.FlagW		(FlagWriteD)
	);
///////////////////////////

// PC Logic
	assign PCSrcD = ((Rd == 4'd15) & RegWriteD) | BranchD;
	
	
	endmodule
