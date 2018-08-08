`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:46 08/06/2018 
// Module Name:    instruction_memory 
// Project Name: 	 pipelined processor
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module instruction_memory(
	input wire [31:0] A,			//address 
	output wire [31:0] RD			//output read data
    );

// instruction memory storage
	reg [31:0] ins_mem[31:0];
	
// instruction memory body 
	assign RD = ins_mem[A];

endmodule
