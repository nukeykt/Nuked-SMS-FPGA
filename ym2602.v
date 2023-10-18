module ym2602
	(
	input MCLK,
	input XIN,
	input RESET,
	input AD_i,
	input HL,
	input PAL,
	input RD,
	input WR,
	input IORQ,
	input [15:0] ADDRESS,
	input CSYNC_i,
	input NMI_i,
	input MREQ,
	input DATA_i,
	output DATA_o,
	output DATA_d,
	output ZCLK,
	output [7:0] DAC_r,
	output [7:0] DAC_g,
	output [7:0] DAC_b,
	output CSYNC_o,
	output PCP,
	output CBT,
	output NMI_o,
	output KBSEL,
	output CSRAM,
	output EXM1,
	output EXM2,
	output YS,
	output AD_o,
	output AD_d,
	output OE,
	output WE0,
	output WE1,
	output CE,
	output INT,
	output [15:0] PSG
	);
	

endmodule

