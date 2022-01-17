`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/09 19:26:54
// Design Name: 
// Module Name: led_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module led_tb(); 
 reg [2:0]sw; 
 wire led; 
 led uut(sw,led); 
 initial 
 begin 
 #100; 
 sw=3'b000; 
 #100; 
 sw=3'b001; 
 #100; 
 sw=3'b010; 
 #100; 
 sw=3'b011; 
 #100; 
 sw=3'b100; 
 #100; 
 sw=3'b101; 
 #100; 
 sw=3'b110; 
 #100; 
 sw=3'b111; 
 #100; 
 end 
endmodule