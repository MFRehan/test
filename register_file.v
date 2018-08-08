`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mohamed Fathy Rehan
// 
// Create Date:    14:18:47 08/06/2018 
// Module Name:    register_file 
// Project Name: 	 pipeline processor 
// Revision 0.01 - File Created
// Source: https://gist.github.com/gibiansky/4252014
// Additional Comments:  
//
//////////////////////////////////////////////////////////////////////////////////
module regfile(
	input wire clk,
	input wire WE3,						//write enable 
	input wire [3:0] A1, A2, A3,		//adress 1 , 2 and 3
	input wire [31:0] WD3, R15,		//input write data //input data of register 15
	output reg [31:0] RD1, RD2			//output read data 1 and 2
    );
	 
//register file storage  
	reg [31:0] registers[3:0];
	
//read and write from register file 
	always @(negedge clk)
	if (WE3)
		registers[A3] <= WD3;
	else 
		begin
		RD1 <= registers[A1];
		RD2 <= registers[A2];
		end
		
//write to R15
	always @(negedge clk)
   registers[15] <= R15;	

endmodule
