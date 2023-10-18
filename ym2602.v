module ym2602
	(
	input MCLK,
	input XIN,
	input RESET,
	input [15:0] AD_i,
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
	output [7:0] DATA_o,
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
	output [15:0] AD_o,
	output AD_d,
	output OE,
	output WE0,
	output WE1,
	output CE,
	output INT,
	output [15:0] PSG
	);
	
	wire clk1, clk2;
	wire hclk1, hclk2;
	wire zclk;
	wire reset1;
	
	wire [15:0] w1;
	wire [15:0] w2;
	wire [7:0] w3;
	wire [15:0] w4;
	wire [15:0] w5;
	wire [12:0] w6;
	wire [15:0] w7;
	wire w8;
	wire w9;
	wire w10;
	wire w11;
	wire w12;
	wire w13;
	wire w14;
	wire w15;
	wire w16;
	wire w17;
	wire w18;
	wire w19;
	wire w20;
	wire w21;
	wire w22;
	wire w23;
	wire w24;
	wire w25;
	wire w26;
	wire w27;
	wire w28;
	wire w29;
	wire w30;
	wire w31;
	wire w32;
	wire w33;
	wire w34;
	wire w35_1, w35;
	wire w36;
	wire w37;
	wire w38;
	wire w39;
	wire w40;
	wire w41;
	wire w42;
	wire w43_1, w43;
	wire w44;
	wire w45;
	wire w46;
	wire w47;
	wire [7:0] w49;
	
	wire w723;
	wire w724;
	wire w725;
	wire w726;
	wire w727;
	wire w728;
	wire w729;
	wire w730;
	wire w731;
	wire w732;
	wire w733;
	wire w734;
	wire w735;
	wire w736;
	wire w737;
	wire w738;
	wire w739;
	wire w740;
	wire w741;
	wire w742;
	
	wire [7:0] reg_hit;
	
	wire [15:0] vram_data;
	wire [13:0] vram_address;
	
	assign clk1 = ~XIN;
	assign clk2 = XIN;
	
	ymn_sr_bit l723(.MCLK(MCLK), .c1(clk2), .c2(clk1), .inp(RESET), .val(w723));
	ymn_sr_bit l724(.MCLK(MCLK), .c1(clk2), .c2(clk1), .inp(~w723), .val(w724));
	ymn_dlatch l725(.MCLK(MCLK), .en(clk2), .inp(w724 | RESET), .val(w725));
	ymn_dlatch l726(.MCLK(MCLK), .en(clk1), .inp(~w725), .val(w726));
	
	assign w727 = ~(w726 | w728 | w729);
	
	ymn_sr_bit l728(.MCLK(MCLK), .c1(clk2), .c2(clk1), .inp(w727), .val(w728));
	ymn_sr_bit l729(.MCLK(MCLK), .c1(clk2), .c2(clk1), .inp(w728), .val(w729));
	ymn_sr_bit l730(.MCLK(MCLK), .c1(clk2), .c2(clk1), .inp(w729), .val(w730));
	
	ymn_dlatch l731(.MCLK(MCLK), .en(clk2), .inp(w728), .val(w731));
	
	ymn_rs_trig rs_zclk(.MCLK(MCLK), .rst(w731), .set(w730), .q(zclk));
	
	assign ZCLK = zclk;
	
	ymn_dlatch l739(.MCLK(MCLK), .en(clk1), .inp(~w725), .val(w739));
	ymn_dlatch l741(.MCLK(MCLK), .en(clk1), .inp(~w740), .val(w741));
	ymn_dlatch l740(.MCLK(MCLK), .en(clk2), .inp(w739 | w741), .val(w740));
	ymn_sr_bit l742(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(~w740), .val(w742));
	
	assign hclk1 = w742;
	assign hclk2 = ~w742;
	
	ymn_dlatch l732(.MCLK(MCLK), .en(hclk2), .inp(RESET), .val(w732));
	
	assign w733 = ~w728;
	ymn_sr_bit l734(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(w733), .val(w734));
	ymn_sr_bit l735(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(w734), .val(w735));
	
	assign w736 = w735 & hclk2;
	
	ymn_dlatch l737(.MCLK(MCLK), .en(hclk1), .inp(w732), .val(w737));
	ymn_dlatch l738(.MCLK(MCLK), .en(w736), .inp(w737), .val(w738));

	assign reset1 = ~w738;
	
	ymn_dlatch #(.DATA_WIDTH(16)) l1(.MCLK(MCLK), .en(hclk2), .inp(AD_i), .val(w1));
	ymn_dlatch #(.DATA_WIDTH(16)) l2(.MCLK(MCLK), .en(hclk1), .inp(w1), .val(w2));
	ymn_dlatch #(.DATA_WIDTH(8)) l3(.MCLK(MCLK), .en(w25), .inp(AD_i[15:8]), .val(w3));
	ymn_dlatch #(.DATA_WIDTH(16)) l4(.MCLK(MCLK), .en(hclk2), .inp({vram_data[7:0],vram_data[7:0]}), .val(w4));
	ymn_dlatch #(.DATA_WIDTH(16)) l5(.MCLK(MCLK), .en(w30), .inp(w4), .val(w5));
	ymn_dlatch #(.DATA_WIDTH(13)) l6(.MCLK(MCLK), .en(w30), .inp(vram_address[13:1]), .val(w6));
	
	assign w7 = w47 ? { 3'h0, w6 } : w5;
	
	assign AD_d = w46;
	assign AD_o = w7;
	
	assign w8 = ~(w11 & w15);
	assign OE = w8;
	
	assign w9 = ~(w14 & w15);
	assign WE1 = w9;
	
	assign w10 = ~(w13 & w15);
	assign WE0 = w10;
	
	ymn_dlatch l11(.MCLK(MCLK), .en(hclk2), .inp(~w24), .val(w11));
	ymn_dlatch l12(.MCLK(MCLK), .en(hclk2). .inp(w28), .val(w12));
	
	assign w13 = ~(w11 | w12);
	assign w14 = ~(w11 | ~w12);
	
	ymn_dlatch l15(.MCLK(MCLK), .en(clk1), .inp(w20), .val(w15));
	ymn_dlatch l16(.MCLK(MCLK), .en(hclk1), .inp(~w343[0]), .val(w16));
	ymn_dlatch l17(.MCLK(MCLK), .en(clk1), .inp(~w16), .val(w17));
	ymn_dlatch l18(.MCLK(MCLK), .en(clk2), .inp(~w17), .val(w18));
	ymn_dlatch l19(.MCLK(MCLK), .en(clk1), .inp(~w18), .val(w19));
	ymn_dlatch l20(.MCLK(MCLK), .en(clk2), .inp(~w19), .val(w20));
	
	assign w21 = ~(w19 | w20);
	assign CE = w21;
	
	ymn_sr_bit l22(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w208), .val(w22));
	
	assign w23 = ~(w208 | w22);
	
	ymn_dlatch l24(.MCLK(MCLK), .en(hclk1), .inp(~w23), .val(w24));
	
	assign w25 = w27 & hclk2;
	
	ymn_sr_bit l26(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(w544), .val(w26));
	ymn_sr_bit l27(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(w26), .val(w27));
	
	ymn_dlatch l28(.MCLK(MCLK), .en(w30), .inp(vram_address[0]), .val(w28));
	
	ymn_sr_bit l29(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(~w343[0]), .val(w29));
	
	assign w30 = w29 & hclk1;
	
	ymn_dlatch l31(.MCLK(MCLK), .en(hclk1), .inp(~w35 & w343[0]), .val(w31));
	
	assign w32 = w31 & hclk2;
	
	ymn_dlatch l33(.MCLK(MCLK), .en(hclk1), .inp(w35 & w343[0]), .val(w33));
	
	assign w34 = w33 & hclk2;
	
	ym_sr_bit l35_1(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(~(w28 & w38)), .val(w35_1));
	ym_dlatch l35(.MCLK(MCLK), .en(hclk2), .inp(w35_1), .val(w35));
	
	ym_dlatch l36(.MCLK(MCLK), .en(hclk1), .inp(~w343[10]), .val(w36));
	
	assign w37 = ~(w36 | ~reg_80_b2);
	
	ym_sr_bit l38(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(~w37), .val(w38));
	
	ym_dlatch l39(.MCLK(MCLK), .en(hclk2), .inp(w538 & ~reg_81_b1), .val(w39));
	
	assign w40 = w39 & hclk1;
	
	ym_dlatch l41(.MCLK(MCLK), .en(hclk2), .inp(w538), .val(w41));
	
	assign w42 = w41 & hclk1;
	
	ym_dlatch l43_1(.MCLK(MCLK), .en(hclk1), .inp(w343[0]), .val(w43_1));
	ym_dlatch l43(.MCLK(MCLK), .en(clk1), .inp(w43_1), .val(w43));
	
	ym_sr_bit l44(.MCLK(MCLK), .c1(clk2), .c2(clk1), .inp(w43), .val(w44));
	
	assign w45 = ~(w44 ? w24 : w43);
	
	ym_dlatch l46(.MCLK(MCLK), .en(clk2), .inp(w45), .val(w46));
	
	ym_dlatch l47(.MCLK(MCLK), .en(clk2), .inp(~w44), .val(w47));
	
endmodule

