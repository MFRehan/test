`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:46:42 08/08/2018 
// Module Name:    alu 
// Project Name: 	 pipelined processor 
// Revision 0.01 - File Created
// Source:	Harris page 250
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu(
	input wire [31:0] SrcA,
	input wire [31:0] SrcB,
	input wire [1:0] ALUControl,
	output reg [31:0] ALUResult,
	output wire [3:0] ALUFlags
    );

/*
	V >> ALUFlags[0]
	C >> ALUFlags[1]
	Z >> ALUFlags[2]
	N >> ALUFlags[3]
*/

//internal signal
	reg carry;

//alu body
	always @(*)
	
	case (ALUControl)
				2'b00	:	//Add  
								{carry, ALUResult} = SrcA + SrcB;
				2'b01	:	//Subtract
								ALUResult = SrcA - SrcB;
				2'b10	:	//AND
								ALUResult = SrcA & SrcB;
				2'b11	:	//OR
								ALUResult = SrcA | SrcB;
	endcase 
	
	
	assign ALUFlags[0] = ~ALUControl[1] & 
								(ALUResult[31] ^ SrcA[31]) &
								~(ALUControl[0] ^ SrcA[31] ^ SrcB[31]) ;		//oVerflow flag 
	assign ALUFlags[1] = carry;													//Carry out flag 
 	assign ALUFlags[2] = (ALUResult == 0)? 1'b1 : 1'b0;					//Zero flag  
	assign ALUFlags[3] = ALUResult[31];											//Negative flag 


	
endmodule
