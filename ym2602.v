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
	wire [7:0] w50;
	wire [7:0] w51;
	wire w52;
	wire w53;
	wire w54;
	wire w55;
	wire w56;
	wire w57;
	wire w58;
	wire w59;
	wire [7:0] w60;
	wire [7:0] w62;
	wire [7:0] w63;
	wire [7:0] w64;
	wire [7:0] w65;
	wire [7:0] w66;
	wire [1:0] w67;
	wire w68;
	wire w69;
	wire w70;
	wire w71;
	wire w72;
	wire w73;
	wire w74;
	wire w75;
	wire w76;
	wire w77;
	wire w78;
	wire w79;
	wire w80;
	wire w81;
	wire w82;
	wire w83;
	wire w84;
	wire w85;
	wire w86;
	wire w87;
	wire w88;
	wire w89;
	wire [1:0] w90;
	wire w91;
	wire w92;
	wire w93;
	wire w94;
	wire w95;
	wire w96;
	wire w97;
	wire w98;
	wire w99;
	wire w100;
	wire w101;
	wire w102;
	wire w103;
	wire w104;
	wire w105;
	wire w106;
	wire w107;
	wire w108;
	wire [3:0] w109;
	wire [3:0] w110;
	wire [3:0] w111;
	wire [3:0] w112;
	wire [3:0] w113;
	wire [3:0] w114;
	wire [3:0] w115;
	wire [3:0] w116;
	wire [3:0] w117_1, w117;
	wire w118;
	wire [7:0] w119_1, w119;
	wire w120;
	wire w121;
	wire w122;
	wire w123;
	wire w124;
	wire w125;
	wire [4:0] w126;
	wire w127;
	wire [5:0] w128;
	wire [5:0] w129;
	wire [5:0] w130;
	wire [5:0] w131_1, w131;
	wire [5:0] w132;
	wire [5:0] w133;
	wire [5:0] w134;
	wire [5:0] w135_1, w135;
	wire w136;
	wire w137;
	wire w138;
	wire w139;
	wire w140;
	wire w141;
	wire [8:0] w142;
	wire [8:0] w143;
	wire [8:0] w144;
	wire [8:0] w145;
	wire [13:0] v_pla;
	
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
	wire w743;
	wire w745;
	wire w746;
	
	wire [7:0] reg_hit;
	
	wire [15:0] vram_data;
	wire [13:0] vram_address;
	wire [7:0] io_data;
	
	wire cpu_pal = PAL;
	wire cpu_rd = RD;
	wire cpu_wr = WR;
	wire cpu_iorq = IORQ;
	wire cpu_a0 = ADDRESS[0];
	wire cpu_a6 = ADDRESS[6];
	wire cpu_a7 = ADDRESS[7];
	
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
	
	ymn_sr_bit l35_1(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(~(w28 & w38)), .val(w35_1));
	ymn_dlatch l35(.MCLK(MCLK), .en(hclk2), .inp(w35_1), .val(w35));
	
	ymn_dlatch l36(.MCLK(MCLK), .en(hclk1), .inp(~w343[10]), .val(w36));
	
	assign w37 = ~(w36 | ~reg_80_b2);
	
	ymn_sr_bit l38(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(~w37), .val(w38));
	
	ymn_dlatch l39(.MCLK(MCLK), .en(hclk2), .inp(w538 & ~reg_81_b1), .val(w39));
	
	assign w40 = w39 & hclk1;
	
	ymn_dlatch l41(.MCLK(MCLK), .en(hclk2), .inp(w538), .val(w41));
	
	assign w42 = w41 & hclk1;
	
	ymn_dlatch l43_1(.MCLK(MCLK), .en(hclk1), .inp(w343[0]), .val(w43_1));
	ymn_dlatch l43(.MCLK(MCLK), .en(clk1), .inp(w43_1), .val(w43));
	
	ym_sr_bit l44(.MCLK(MCLK), .c1(clk2), .c2(clk1), .inp(w43), .val(w44));
	
	assign w45 = ~(w44 ? w24 : w43);
	
	ymn_dlatch l46(.MCLK(MCLK), .en(clk2), .inp(w45), .val(w46));
	
	ymn_dlatch l47(.MCLK(MCLK), .en(clk2), .inp(~w44), .val(w47));
	
	ymn_slatch_r #(.DATA_WIDTH(8)) l_hit(.MCLK(MCLK), .en(reg_sel[10]), .rst(reset1), .inp(~reg_addr[7:0]), .val(reg_hit));
	
	assign w49 = ~(w53 ? reg_hit : w51);
	
	ymn_dlatch #(.DATA_WIDTH(8)) l50(.MCLK(MCLK), .en(hclk1), .inp(w49), .val(w50));
	ymn_dlatch #(.DATA_WIDTH(8)) l51(.MCLK(MCLK), .en(hclk2), .inp(~w50 + {7'h0, ~w54}), .val(w50));
	
	assign w52 = ~(w160 | w159);
	
	assign w53 = w52 | w55;
	
	ymn_dlatch l54(.MCLK(MCLK), .en(hclk1), .inp(~w370), .val(w54));
	ymn_sr_bit l55(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w56), .val(w55));
	
	assign w56 = ~(w52 | ~w370 | (w49 != 8'h0));
	
	assign w743 = ~HL;
	
	ymn_sr_bit l744(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w743), .val(w744));
	ymn_sr_bit l745(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(~w744), .val(w745));
	
	assign w746 = ~(w745 & w744);
	
	ymn_dlatch l57(.MCLK(MCLK), .en(hclk1), .inp(~w746), .val(w57));
	ymn_dlatch l58(.MCLK(MCLK), .en(hclk2), .inp(w57), .val(w58));
	
	assign w59 = w58 & hclk1;
	
	ymn_dlatch #(.DATA_WIDTH(8)) l60(.MCLK(MCLK), .en(w59), .inp(w313[8:1]), .val(w60));
	
	ymn_dlatch #(.DATA_WIDTH(8)) l62(.MCLK(MCLK), .en(hclk1), .inp((w74 | w80) ? 8'h0 : (w63 + { 7'h0, w76 })), .val(w62));
	ymn_dlatch #(.DATA_WIDTH(8)) l63(.MCLK(MCLK), .en(hclk2), .inp(w62 | (w65 & w66)), .val(w63));
	
	ymn_dlatch #(.DATA_WIDTH(8)) l64(.MCLK(MCLK), .en(w81), .inp(w63), .val(w64));
	
	ymn_dlatch #(.DATA_WIDTH(8)) l65(.MCLK(MCLK), .en(hclk1), .inp(w64), .val(w65));
	ymn_dlatch #(.DATA_WIDTH(8)) l66(.MCLK(MCLK), .en(hclk1), .inp({8{w80}}), .val(w66));
	
	assign w67 = w85 ? w63[6:5] : 2'h0;
	
	ymn_dlatch l68(.MCLK(MCLK), .en(hclk1), .inp(~w160), .val(w68));
	ymn_dlatch l69(.MCLK(MCLK), .en(hclk2), .inp(~w68), .val(w69));
	ymn_dlatch l70(.MCLK(MCLK), .en(hclk1), .inp(w69), .val(w70));
	ymn_dlatch l71(.MCLK(MCLK), .en(hclk2), .inp(~(w70 | w68)), .val(w68));
	
	assign w72 = ~(w71 | reset1 | (w370 & w467));
	
	ymn_dlatch l73(.MCLK(MCLK), .en(hclk1), .inp(w72), .val(w73));
	ymn_dlatch l74(.MCLK(MCLK), .en(hclk2), .inp(~w73), .val(w74));
	
	assign w75 = ~(w77 ? w78 : w79);
	
	ymn_dlatch l76(.MCLK(MCLK), .en(hclk2), .inp(~w75), .val(w76));
	
	ymn_dlatch l77(.MCLK(MCLK), .en(hclk1), .inp(w467), .val(w77));
	ymn_dlatch l78(.MCLK(MCLK), .en(hclk1), .inp(w343[2]), .val(w78));
	ymn_dlatch l79(.MCLK(MCLK), .en(hclk1), .inp(w94), .val(w79));
	
	assign w80 = ~(w146 | ~w379);
	
	assign w81 = w378;
	
	ymn_dlatch l82(.MCLK(MLCK), .en(hclk2), .inp(w84), .val(w82));
	assign w83 = w82 & hclk1;
	
	ymn_dlatch l84(.MCLK(MCLK), .en(hclk1), .inp(~(~reg_80_b2) | w163), .val(w84));
	
	ymn_sr_bit l85(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w343[11]), .val(w85));
	
	assign w86 = ~(reg_80_b2 | ~w343[11]);
	
	ymn_sr_bit l87(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w86), .val(w87));
	
	assign w88 = w87 & hclk1;
	
	ymn_sr_bit l89(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w343[1]), .val(w89));
	
	ymn_sr_bit_array #(.DATA_WIDTH(2)) l90(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w74 ? 2'h0 : w90 + {1'h0, w89}), .val(w90));
	
	assign w91 = ~(w90[1] | ~w90[0] | ~w89);
	assign w92 = ~(~w90[1] | ~w90[0] | ~w89);
	
	assign w93 = w91;
	assign w94 = w92;
	
	assign w95 = ~(w98 | reg_80_b2);
	
	ymn_sr_bit l96(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w95), .val(w96));
	
	assign w97 = w96 & hclk1;
	
	assign w98 = ~w343[2];
	
	assign w99 = ~(w98 | w343[1] | reg_80_b2);
	
	assign w100 = ~w343[1];
	
	assign w101 = ~(w100 | reg_80_b2);
	
	ymn_sr_bit l102(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w99), .val(w102));
	
	assign w103 = w102 & hclk1;
	
	ymn_sr_bit l104(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w101), .val(w104));
	
	assign w105 = w104 & hclk1;
	
	ymn_dlatch l106(.MCLK(MCLK), .en(hclk2), .inp(w538), .val(w106));
	
	assign w107 = w106 & hclk1;
	
	ymn_dlatch l108(.MCLK(MCLK), .en(hclk1), .inp(~w519), .val(w108));
	
	ymn_dlatch #(.DATA_WIDTH(4)) l109(.MCLK(MCLK), .en(hclk1), .inp(w496[3:0]), .val(w109));
	
	ymn_sr_bit_array #(.DATA_WIDTH(4)) l110(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(w108 ? w109 : w110), .val(w110));
	ymn_sr_bit_array #(.DATA_WIDTH(4)) l111(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(w108 ? w110 : w111), .val(w111));
	ymn_sr_bit_array #(.DATA_WIDTH(4)) l112(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(w108 ? w111 : w112), .val(w112));
	ymn_sr_bit_array #(.DATA_WIDTH(4)) l113(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(w108 ? w112 : w113), .val(w113));
	ymn_sr_bit_array #(.DATA_WIDTH(4)) l114(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(w108 ? w113 : w114), .val(w114));
	ymn_sr_bit_array #(.DATA_WIDTH(4)) l115(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(w108 ? w114 : w115), .val(w115));
	ymn_sr_bit_array #(.DATA_WIDTH(4)) l116(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(w108 ? w115 : w116), .val(w116));
	ymn_dlatch #(.DATA_WIDTH(4)) l117_1(.MCLK(MCLK), .en(hclk1), .inp(w108 ? w116 : w117), .val(w117_1));
	ymn_dlatch #(.DATA_WIDTH(4)) l117(.MCLK(MCLK), .en(hclk2), .inp(w117_1), .val(w117));
	
	ymn_dlatch l118(.MCLK(MCLK), .en(hclk1), .inp(~w518), .val(w118));
	ymn_dlatch #(.DATA_WIDTH(8)) l119_1(.MCLK(MCLK), .en(hclk2), .inp( w108 ? { w119[6:0], w118 } : w119 ), .val(w119_1));
	ymn_dlatch #(.DATA_WIDTH(8)) l119(.MCLK(MCLK), .en(hclk1), .inp(w119_1), .val(w119));
	
	assign w120 = w119_1[7];
	
	assign w121 = ~(~w119_1[3] | reg_80_b2);
	
	assign w122 = ~(~w119_1[4] | reg_80_b2);
	
	assign w123 = ~(w121 | (reg_80_b2 & w120));
	
	ymn_dlatch l124(.MCLK(MCLK), .en(hclk2), .inp(w538 & reg_81_b1), .val(w124));
	assign w125 = w124 & hclk1;
	
	ymn_sr_bit_array #(.DATA_WIDTH(5)) l126(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(w532), .val(w126));
	
	ymn_dlatch l127(.MCLK(MCLK), .en(hclk1), .inp(~w343[0]), .val(w127));
	
	ymn_sr_bit_array #(.DATA_WIDTH(6)) l128(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(w108 ? { w126, w127 } : w128), .val(w128));
	ymn_sr_bit_array #(.DATA_WIDTH(6)) l129(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(w108 ? w128 : w129), .val(w129));
	ymn_sr_bit_array #(.DATA_WIDTH(6)) l130(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(w108 ? w129 : w130), .val(w130));
	ymn_dlatch #(.DATA_WIDTH(6)) l131_1(.MCLK(MCLK), .en(hclk1), .inp(w108 ? w130 : w131), .val(w131_1));
	ymn_dlatch #(.DATA_WIDTH(6)) l131(.MCLK(MCLK), .en(hclk2), .inp(w131_1), .val(w131));
	ymn_sr_bit_array #(.DATA_WIDTH(6)) l132(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(w108 ? w131 : w132), .val(w132));
	ymn_sr_bit_array #(.DATA_WIDTH(6)) l133(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(w108 ? w132 : w133), .val(w133));
	ymn_sr_bit_array #(.DATA_WIDTH(6)) l134(.MCLK(MCLK), .c1(hclk2), .c2(hclk1), .inp(w108 ? w133 : w134), .val(w134));
	ymn_dlatch #(.DATA_WIDTH(6)) l135_1(.MCLK(MCLK), .en(hclk1), .inp(w108 ? w134 : w135), .val(w135_1));
	ymn_dlatch #(.DATA_WIDTH(6)) l135(.MCLK(MCLK), .en(hclk2), .inp(w135_1), .val(w135));
	
	ymn_dlatch l136(.MCLK(MCLK), .en(hclk2), .inp(w544), .val(w136));
	assign w137 = w136 & hclk1;
	
	ymn_dlatch l138(.MCLK(MCLK), .en(hclk1), .inp(w343[3] & ~reg_80_b2), .val(w138));
	ymn_dlatch l139(.MCLK(MCLK), .en(hclk2), .inp(w138), .val(w139));
	assign w140 = w139 & hclk1;
	
	ymn_dlatch l141(.MCLK(MCLK), .en(hclk1), .inp(w370), .val(w141));
	
	ymn_dlatch #(.DATA_WIDTH(9)) l142(.MCLK(MCLK), .en(hclk2), .inp(w162 ? 9'h0 : w143 + {8'h0, w141}), .val(w142));
	ymn_dlatch l144(.MCLK(MCLK), .en(hclk2), .inp(w162), .val(w144));
	
	assign w145 = w142 | (w144 ? { 2'h3, cpu_pal, ~cpu_pal, 1'h1, ~cpu_pal, cpu_pal, ~cpu_pal, cpu_pal } : 9'h0);
	
	ymn_dlatch l143(.MCLK(MCLK), .en(hclk1), .inp(w145), .val(w143));
	
	wire [13:0] v_pla_i;
	
	assign v_pla_i[0] = (w145 & 9'h107) == 9'h7;
	assign v_pla_i[1] = cpu_pal & w145 == 9'h1bd;
	assign v_pla_i[2] = ~cpu_pal & w145 == 9'h1d8;
	assign v_pla_i[3] = cpu_pal & w145 == 9'h1ba;
	assign v_pla_i[4] = ~cpu_pal & w145 == 9'h1d5;
	assign v_pla_i[5] = cpu_pal & w145 == 9'h1ca;
	assign v_pla_i[6] = ~cpu_pal & w145 == 9'h1e5;
	assign v_pla_i[7] = cpu_pal & w145 == 9'hf0;
	assign v_pla_i[8] = ~cpu_pal & w145 == 9'hd8;
	assign v_pla_i[9] = w145 == 9'hc0;
	assign v_pla_i[10] = w145 == 9'h0;
	assign v_pla_i[11] = w145 == 9'h1ff;
	assign v_pla_i[12] = cpu_pal & w145 == 9'hf2;
	assign v_pla_i[13] = ~cpu_pal & w145 == 9'hda;
	
	ymn_dlatch #(.DATA_WIDTH(14)) l_vpla(.MCLK(MCLK), .en(hclk1), .inp(v_pla_i), .val(v_pla));
	
	ymn_dlatch l146(.MCLK(MCLK), .en(hclk2), .inp(v_pla[0]), .val(w146));
	ymn_dlatch l147(.MCLK(MCLK), .en(hclk2), .inp(v_pla[1]), .val(w147));
	ymn_dlatch l148(.MCLK(MCLK), .en(hclk2), .inp(v_pla[2]), .val(w148));
	ymn_dlatch l149(.MCLK(MCLK), .en(hclk2), .inp(v_pla[3]), .val(w149));
	ymn_dlatch l150(.MCLK(MCLK), .en(hclk2), .inp(v_pla[4]), .val(w150));
	ymn_dlatch l152(.MCLK(MCLK), .en(hclk2), .inp(v_pla[5]), .val(w152));
	ymn_dlatch l153(.MCLK(MCLK), .en(hclk2), .inp(v_pla[6]), .val(w153));
	ymn_dlatch l154(.MCLK(MCLK), .en(hclk2), .inp(v_pla[7]), .val(w154));
	ymn_dlatch l155(.MCLK(MCLK), .en(hclk2), .inp(v_pla[8]), .val(w155));
	ymn_dlatch l157(.MCLK(MCLK), .en(hclk2), .inp(v_pla[9]), .val(w157));
	ymn_dlatch l158(.MCLK(MCLK), .en(hclk2), .inp(v_pla[10]), .val(w158));
	ymn_dlatch l160(.MCLK(MCLK), .en(hclk2), .inp(v_pla[11]), .val(w160));
	ymn_dlatch l161(.MCLK(MCLK), .en(hclk2), .inp(v_pla[12] | v_pla[13]), .val(w161));
	
	ymn_rs_trig2 rs151(.MCLK(MCLK), .set(reset1 | w150 | w149), .rst(w148 | w147), .q(w151));
	ymn_rs_trig2 rs156(.MCLK(MCLK). .set(reset1 | w155 | w154), .rst(w153 | w152), .q(w156));
	ymn_rs_trig2 rs159(.MCLK(MCLK), .set(w158), .rst(reset1 | w157), .q(w159));
	
	ymn_dlatch l162(.MCLK(MCLK), .en(hclk1), .inp(w331 | (w161 & w370)), .val(w162));
	
	assign w163 = ~w343[2];
	
	assign w164 = w159 | w160;
	
endmodule

