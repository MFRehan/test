`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:59:04 08/07/2018 
// Module Name:    extend 
// Project Name: 	 pipelined processor 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module extend(
	input wire [1:0] ImmSrc,			//extend type selector 
	input wire [23:0] Instr,			//instraction immediat which need to be extended 
	output reg [31:0] ExtImm			//output extended immediat 32-bits
    );


//extender body
	always @(*)
	case (ImmSrc)
		2'b00	:	//8-bit unsigned immediate for data-processing
					ExtImm[31:0] = {{24{1'b0}}, Instr[7:0]};
		2'b01	:	//12-bit unsigned immediate for LDR/STR
					ExtImm[31:0] = {{20{1'b0}}, Instr[11:0]};
		2'b10	:	//24-bit signed immediate multiplied by 4 for B
					ExtImm[31:0] = {{6{Instr[23]}}, Instr[23:0], 2'b00};
		default: //other
					ExtImm[31:0] = 32'hxxxxxxxx;		
	endcase 

endmodule
