`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:56 08/08/2018 
// Module Name:    alu_decoder 
// Project Name: 	 pipelined processor
// Revision 0.01 - File Created
// source: Harris page 400
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu_decoder(
	input wire [4:0] Funct,				//from instraction
	input wire ALUOp,						//singnal from main decoder
	output reg [1:0] ALUControl,		//routed to alu control 
	output reg [1:0] FlagW				//routed to conditional check
    );


/*
	cmd >> Funct[4:1]
	S	 >> Funct[0]
*/


//alu decoder body
	always @(*)
	if (ALUOp == 0)
		begin
			ALUControl = 2'b00;
			FlagW = 2'b00;
		end
	else
		case (Funct[4:1])		// check the cmd
			4'b0100	:	// Add
							begin
								ALUControl = 2'b00;
								FlagW = (Funct[0])? 2'b11 : 2'b00;
							end
			4'b0010	:	// Sub
							begin
								ALUControl = 2'b01;
								FlagW = (Funct[0])? 2'b11 : 2'b00;
							end	
			4'b0000	:	// AND
							begin
								ALUControl = 2'b10;
								FlagW = (Funct[0])? 2'b10 : 2'b00;
							end	
			4'b1100	:	// OR
							begin
								ALUControl = 2'b11;
								FlagW = (Funct[0])? 2'b10 : 2'b00;
							end								
		endcase

endmodule
