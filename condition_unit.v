`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:44:49 08/08/2018 
// Module Name:    condition_unit 
// Project Name: 	 pipelined processor 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module condition_unit(
	input wire [1:0] FlagWriteE,
	input wire [3:0] CondE,
	input wire [1:0] FlagsE,
	input wire ALUFlags,
	output wire CondExE,
	output wire Flags
    );
	 
// internal signals
	wire [1:0] FlagWrite;

// assign signals
	assign FlagWrite = FlagWriteE & CondExE;

// alu flags regester / one cycle delay
	always @(posedge clk)
	begin
		if ( FlagWrite[0] )
			Flags[1:0] <= ALUFlags[1:0];
		if	( FlagWrite[1] )
			Flags[3:2] <= ALUFlags[3:2];
	end

// condition check
	always @(*)
		if ( CondE == Flags )
			CondExE = 1'b1;
		else 
			CondExE = 1'b0;

endmodule
