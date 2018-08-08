`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:30:23 08/08/2018 
// Design Name: 
// Module Name:    main_decoder 
// Project Name: 	 pipelined processor  
// Revision 0.01 - File Created
// source: Harris page 400
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module main_decoder(
	input wire [1:0] Op,					// operation type //singnal from instraction set
	input wire [5:0] Funct,		// from instraction
   output reg Branch,			// to pc logic block
	output reg MemtoReg,
	output reg MemW,				// to Conditional Logic
	output reg ALUSrc,
	output reg [1:0] ImmSrc,
	output reg RegW,				// to Conditional Logic
	output reg [1:0] RegSrc,
	output reg ALUOp
	 );


// main decoder body 
	always @(*)
		case (Op)
				2'b00	:	// Data Processing
							if ( Funct[5] )	// DP Reg
								begin
									Branch	=	1'b0;
									MemtoReg	=	1'b0;
									MemW		=	1'b0;
									ALUSrc	=	1'b0;
									ImmSrc	=	2'bxx;
									RegW		=	1'b1;
									RegSrc	=	2'b00;
									ALUOp		=	1'b1;
								end
							else					// DP Imm
								begin
									Branch	=	1'b0;
									MemtoReg	=	1'b0;
									MemW		=	1'b0;
									ALUSrc	=	1'b1;
									ImmSrc	=	2'b00;
									RegW		=	1'b1;
									RegSrc	=	2'bx0;
									ALUOp		=	1'b1;
								end
				2'b01	:	// Memory instraction
							if ( Funct[0] )	// STR 
								begin
									Branch	=	1'b0;
									MemtoReg	=	1'bx;
									MemW		=	1'b1;
									ALUSrc	=	1'b1;
									ImmSrc	=	2'b01;
									RegW		=	1'b0;
									RegSrc	=	2'b10;
									ALUOp		=	1'b0;
								end
							else					// LDR
								begin
									Branch	=	1'b0;
									MemtoReg	=	1'b1;
									MemW		=	1'b0;
									ALUSrc	=	1'b1;
									ImmSrc	=	2'b01;
									RegW		=	1'b1;
									RegSrc	=	2'bx0;
									ALUOp		=	1'b0;
								end
				2'b10	:	// Branch instraction
							begin
								Branch	=	1'b1;
								MemtoReg	=	1'b0;
								MemW		=	1'b0;
								ALUSrc	=	1'b1;
								ImmSrc	=	2'b10;
								RegW		=	1'b0;
								RegSrc	=	2'bx1;
								ALUOp		=	1'b0;
							end
				default :	
							begin
								Branch	=	1'bx;
								MemtoReg	=	1'bx;
								MemW		=	1'bx;
								ALUSrc	=	1'bx;
								ImmSrc	=	2'bxx;
								RegW		=	1'bx;
								RegSrc	=	2'bxx;
								ALUOp		=	1'bx;
							end
		
		endcase

endmodule
