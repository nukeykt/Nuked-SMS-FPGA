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
	wire w146;
	wire w147;
	wire w148;
	wire w149;
	wire w150;
	wire w151;
	wire w152;
	wire w153;
	wire w154;
	wire w155;
	wire w156;
	wire w157;
	wire w158;
	wire w159;
	wire w160;
	wire w161;
	wire w162;
	wire w163;
	wire w164;
	wire w164_;
	wire w165;
	wire w166;
	wire w167;
	wire w168;
	wire w169;
	wire w170;
	wire w171;
	wire w172;
	wire w173;
	wire w174;
	wire w175;
	wire w176;
	wire w177;
	wire w178;
	wire w179;
	wire w180;
	wire w181;
	wire w182;
	wire w183;
	wire w184;
	wire w185, w185n;
	wire w186, w186n;
	wire w187;
	wire w188;
	wire w189;
	wire w190;
	wire w191;
	wire w192;
	wire w193;
	wire w194_0, w194;
	wire w195;
	wire w196;
	wire w197;
	wire w198;
	wire w199;
	wire w200;
	wire w201_;
	wire w202;
	wire w203;
	wire w204;
	wire w205;
	wire w206, w206n;
	wire w207;
	wire w208;
	wire w209;
	wire w210;
	wire w211;
	wire w212;
	reg [7:0] w213;
	reg [7:0] w214;
	wire w215;
	reg [5:0] w216;
	reg [5:0] w217;
	wire [1:0] reg_code;
	wire [13:0] reg_addr;
	wire [10:0] reg_sel;
	wire reg_80_b0;
	wire reg_80_b1;
	wire reg_80_b2;
	wire reg_80_b3;
	wire reg_80_b4;
	wire reg_80_b5;
	wire reg_80_b6;
	wire reg_80_b7;
	wire reg_81_b0;
	wire reg_81_b1;
	wire reg_81_b2;
	wire reg_81_b3;
	wire reg_81_b4;
	wire reg_81_b5;
	wire reg_81_b6;
	wire [3:0] reg_nt;
	wire [7:0] reg_ct;
	wire [2:0] reg_bg;
	wire [6:0] reg_sat;
	wire [2:0] reg_spr;
	wire w218;
	wire w219;
	wire w220;
	wire w221;
	wire w222;
	wire w223;
	wire w224;
	wire w225;
	wire w226;
	wire w227;
	wire w228;
	wire w229;
	wire w230;
	wire w231;
	wire w232;
	wire w233;
	wire w234;
	wire w235;
	wire w236;
	wire w237;
	wire w238;
	wire w239;
	wire w240;
	wire w241;
	wire w242;
	wire w243;
	wire w244;
	wire w245;
	wire w246;
	wire w247;
	wire w248;
	wire w249;
	wire w250;
	wire w251;
	wire w252;
	wire w253;
	wire w254;
	wire w255;
	wire w256;
	wire w257;
	wire w258;
	wire w259;
	wire w260;
	wire w261;
	wire w262;
	wire w263;
	wire w264;
	wire w265;
	wire w266;
	wire w267;
	wire w268;
	wire w269;
	reg [7:0] w270;
	wire w271;
	wire w272;
	wire w273;
	wire w274;
	reg [4:0] w275;
	wire w276;
	wire w277;
	wire w278;
	reg [7:0] w279;
	wire w280;
	wire w281;
	reg w282;
	reg w283;
	wire w284;
	wire w285;
	reg [7:0] w286;
	wire w287;
	wire w289;
	wire w290;
	wire w291;
	wire w292;
	wire w293;
	wire w294;
	wire w295;
	wire w296;
	wire w297;
	wire [7:0] spr_mask;
	wire [3:0] spr_mask2;
	reg w298;
	wire w299;
	wire w300;
	wire [8:0] w301;
	wire w302;
	wire [7:0] w303;
	wire w304;
	wire w305;
	wire [2:0] w306_0, w306;
	wire [2:0] w307;
	wire w308;
	wire w309;
	wire [5:0] w310_0, w310;
	wire [5:0] w311;
	wire w312;
	wire [8:0] w313;
	wire w314;
	wire w315_0, w315;
	wire w316;
	wire w317;
	wire w318;
	wire w319;
	wire w320;
	wire w321;
	wire w322;
	wire w323;
	wire w324;
	wire w325;
	wire w326;
	wire w327;
	wire w328;
	wire w329;
	wire [56:0] hpla;
	wire [21:0] w340;
	wire [20:0] w341;
	wire [12:0] w342;
	wire [12:0] w343;
	wire w344;
	wire w345;
	wire w346;
	wire w347;
	wire w348;
	wire w349;
	wire w350;
	wire w351;
	wire w352;
	wire w353;
	wire w354;
	wire w355;
	wire w356;
	wire w357;
	wire w358;
	wire w359;
	wire w360;
	wire w361;
	wire w362;
	wire w363;
	wire w364;
	wire w365;
	wire w366;
	wire w367;
	wire w368;
	wire w369;
	wire w370;
	wire w371;
	wire w372;
	wire w373;
	wire w374;
	wire w375;
	wire w376;
	wire w377;
	wire w378;
	wire w379;
	wire w380;
	wire w381;
	wire w382;
	wire w383;
	wire w384;
	wire w385;
	wire w386;
	wire w387;
	
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
	wire w747;
	wire w748;
	wire w749;
	wire w750;
	
	wire sprite0_w604;
	wire sprite1_w604;
	wire sprite2_w604;
	wire sprite3_w604;
	wire sprite4_w636;
	wire sprite5_w636;
	wire sprite6_w636;
	wire sprite7_w636;
	wire sprite0_w566;
	wire sprite1_w566;
	wire sprite2_w566;
	wire sprite3_w566;
	
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
	
	assign w164_ = ~cpu_a6 | cpu_iorq | cpu_a7 | cpu_rd;
	
	assign w165 = ~(cpu_rd | cpu_iorq | cpu_a6 | ~cpu_a7);
	assign w166 = ~w165;
	
	assign w167 = ~(cpu_wr | cpu_iorq | cpu_a6 | ~cpu_a7);
	assign w168 = ~w167;
	
	assign w169 = w165 | w167;
	
	ymn_slatch l170(.MCLK(MCLK), .en(w166), .inp(cpu_a0), .val(w170));
	
	assign w171 = ~(w166 | w170);
	
	ymn_slatch l172(.MCLK(MCLK), .en(w168), .inp(~cpu_a0), .val(w172));
	
	assign w173 = ~(w166 | ~cpu_a0);
	assign w174 = ~(w166 | cpu_a0);
	
	assign w175 = ~(w168 | ~w172);
	assign w176 = ~(w168 | w172 | w186);
	assign w176 = ~(w168 | w172 | ~w186n);
	
	assign w178 = w173;
	assign w179 = w174;
	assign w180 = w175;
	
	assign w181 = ~(w178 | w179 | w180 | w177);
	
	assign w182 = ~w177;
	
	assign w183 = ~w176;
	
	ymn_rs_trig rs184(.MCLK(MCLK), .set(reset1 | w194), .rst(w177), .q(w184));
	
	ymn_rs_trig rs185(.MCLK(MCLK), .set(w176), .rst(reset1 | w188), .q(w185), .nq(w185n));
	
	ymn_rs_trig rs186(.MCLK(MCLK), .set(w194 & w185), .rst(reset1 | (w194 & w185n)), .q(w186), .nq(w186n));
	
	ymn_rs_trig rs187(.MCLK(MCLK), .set(reset1 | ~w191), .rst(w169), .q(w187));
	
	assign w188 = ~w181;
	
	ymn_slatch l189(.MCLK(MCLK), .en(hclk1), .inp(w187), .val(w189));
	
	ymn_slatch l190(.MCLK(MCLK), .en(hclk2), .inp(~w189), .val(w190));
	
	ymn_sr_bit l191(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(~w190), .val(w191));
	
	assign w192 = ~(reset1 | w190 | w191);
	
	ymn_sr_bit l193(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w192), .val(w193));
	
	ymn_dlatch l194_0(.MCLK(MCLK), .en(hclk1), .inp(w193), .val(w194_0));
	ymn_dlatch l194_1(.MCLK(MCLK), .en(hclk2), .inp(w194_0), .val(w194));
	
	assign w195 = w192 & reg_code == 2'h0 & ~w184;
	
	ymn_rs_trig rs196(.MCLK(MCLK), .set(w201_ | reset1), .rst(w195 | w180 | w171), .q(w196));
	
	ymn_dlatch l197(.MCLK(MCLK), .en(hclk2), .inp(~w194_0), .val(w197));
	
	assign w198 = ~(w196 | w197);
	
	ymn_rs_trig rs199(.MCLK(MCLK), .set(w201_ | reset1), .rst(w198), .q(w199));
	
	assign w200 = ~(w199 | w343[10]);
	
	assign w201 = ~w200;
	
	ymn_sr_bit l201_(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w200), .val(w201_));
	
	ymn_sr_bit l202(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w201_), .val(w202));
	
	assign w203 = ~w202;
	
	ymn_sr_bit l204(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w202), .val(w204));
	
	ymn_sr_bit l205(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w204), .val(w205));
	
	ymn_rs_trig rs206(.MCLK(MCLK), .rst(reset1 | w205), .set(w180), .q(w206), .nq(w206n));
	
	assign w207 = w206 & w204;
	
	assign w208 = w206n & w212 & w201_;
	assign w209 = w206n & ~w212 & w201_;
	
	assign w210 = ~(w194 | w193);
	
	assign w211 = reg_code == 2'h2 & ~w184 & ~w210;
	
	assign w212 = reg_code != 2'h3;
	
	always @(posedge MCLK)
	begin
		if (~w183)
		begin
			w214 <= io_data;
			w213 <= io_data;
		end
		else
		begin
			if (w215)
				w213 <= w214 + 8'h1;
			else
				w214 <= w213;
		end
	end
	
	ymn_sr_bit l215(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w203), .val(w215));
	
	always @(posedge MCLK)
	begin
		if (~w182)
		begin
			w217 <= io_data[5:0];
			w216 <= io_data[5:0];
		end
		else
		begin
			if (w214[7])
				w216 <= w217 + 6'h1;
			else
				w217 <= w216;
		end
	end
	
	ymn_slatch #(.DATA_WIDTH(2)) l_reg_code(.MCLK(MCLK), .en(~w182), .inp(io_data[7:6]), .val(reg_code));
	
	assign reg_addr = { w217, w214 };
	
	assign reg_sel[0] = reg_addr[11:8] == 4'h0 & w211;
	assign reg_sel[1] = reg_addr[11:8] == 4'h1 & w211;
	assign reg_sel[2] = reg_addr[11:8] == 4'h2 & w211;
	assign reg_sel[3] = reg_addr[11:8] == 4'h3 & w211;
	assign reg_sel[4] = reg_addr[11:8] == 4'h4 & w211;
	assign reg_sel[5] = reg_addr[11:8] == 4'h5 & w211;
	assign reg_sel[6] = reg_addr[11:8] == 4'h6 & w211;
	assign reg_sel[7] = reg_addr[11:8] == 4'h7 & w211;
	assign reg_sel[8] = reg_addr[11:8] == 4'h8 & w211;
	assign reg_sel[9] = reg_addr[11:8] == 4'h9 & w211;
	assign reg_sel[10] = reg_addr[11:8] == 4'ha & w211;
	
	ymn_slatch_r2 l_reg_80_b0(.MCLK(MCLK), .en(reg_sel[0]), .rst(reset1), .inp(reg_addr[0]), .val(reg_80_b0));
	ymn_slatch_r2 l_reg_80_b1(.MCLK(MCLK), .en(reg_sel[0]), .rst(reset1), .inp(reg_addr[1]), .val(reg_80_b1));
	ymn_slatch_r2 l_reg_80_b2(.MCLK(MCLK), .en(reg_sel[0]), .rst(reset1), .inp(reg_addr[2]), .val(reg_80_b2));
	ymn_slatch_r2 l_reg_80_b3(.MCLK(MCLK), .en(reg_sel[0]), .rst(reset1), .inp(reg_addr[3]), .val(reg_80_b3));
	ymn_slatch_r2 l_reg_80_b4(.MCLK(MCLK), .en(reg_sel[0]), .rst(reset1), .inp(reg_addr[4]), .val(reg_80_b4));
	ymn_slatch_r2 l_reg_80_b5(.MCLK(MCLK), .en(reg_sel[0]), .rst(reset1), .inp(reg_addr[5]), .val(reg_80_b5));
	ymn_slatch_r2 l_reg_80_b6(.MCLK(MCLK), .en(reg_sel[0]), .rst(reset1), .inp(reg_addr[6]), .val(reg_80_b6));
	ymn_slatch_r2 l_reg_80_b7(.MCLK(MCLK), .en(reg_sel[0]), .rst(reset1), .inp(reg_addr[7]), .val(reg_80_b7));
	
	ymn_slatch_r2 l_reg_81_b0(.MCLK(MCLK), .en(reg_sel[1]), .rst(reset1), .inp(reg_addr[0]), .val(reg_81_b0));
	ymn_slatch_r2 l_reg_81_b1(.MCLK(MCLK), .en(reg_sel[1]), .rst(reset1), .inp(reg_addr[1]), .val(reg_81_b1));
	ymn_slatch_r2 l_reg_81_b2(.MCLK(MCLK), .en(reg_sel[1]), .rst(reset1), .inp(reg_addr[2]), .val(reg_81_b2));
	ymn_slatch_r2 l_reg_81_b3(.MCLK(MCLK), .en(reg_sel[1]), .rst(reset1), .inp(reg_addr[3]), .val(reg_81_b3));
	ymn_slatch_r2 l_reg_81_b4(.MCLK(MCLK), .en(reg_sel[1]), .rst(reset1), .inp(reg_addr[4]), .val(reg_81_b4));
	ymn_slatch_r2 l_reg_81_b5(.MCLK(MCLK), .en(reg_sel[1]), .rst(reset1), .inp(reg_addr[5]), .val(reg_81_b5));
	ymn_slatch_r2 l_reg_81_b6(.MCLK(MCLK), .en(reg_sel[1]), .rst(reset1), .inp(reg_addr[6]), .val(reg_81_b6));
	
	ymn_slatch #(.DATA_WIDTH(4)) l_reg_nt(.MCLK(MCLK), .en(reg_sel[2]), inp(reg_addr[3:0]), .val(reg_nt));
	
	ymn_slatch #(.DATA_WIDTH(8)) l_reg_ct(.MCLK(MCLK), .en(reg_sel[3]), inp(reg_addr[7:0]), .val(reg_ct));
	
	ymn_slatch #(.DATA_WIDTH(3)) l_reg_bg(.MCLK(MCLK), .en(reg_sel[4]), inp(reg_addr[2:0]), .val(reg_bg));
	
	ymn_slatch #(.DATA_WIDTH(7)) l_reg_sat(.MCLK(MCLK), .en(reg_sel[5]), inp(reg_addr[6:0]), .val(reg_sat));
	
	ymn_slatch #(.DATA_WIDTH(3)) l_reg_spr(.MCLK(MCLK), .en(reg_sel[6]), inp(reg_addr[2:0]), .val(reg_spr));
	
	ymn_sr_bit l218(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w343[6]), .val(w218));
	
	assign w219 = w218 & hclk1;
	
	ymn_dlatch l220(.MCLK(MCLK), .en(hclk1), .inp(w343[4]), .val(w220));
	
	ymn_dlatch l221(.MCLK(MCLK), .en(hclk2), .inp(reg_80_b2 ? w542 : w220), .val(w221));
	
	assign w222 = w221 & hclk1;
	
	ymn_sr_bit l223(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w343[7]), .val(w223));
	
	assign w224 = w223 & hclk1;
	
	ymn_sr_bit l225(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w343[5]), .val(w225));
	
	assign w226 = w225 & hclk1;
	
	ymn_dlatch l227(.MCLK(MCLK), .en(hclk1), .inp(w343[8]), .val(w227));
	
	ymn_dlatch l228(.MCLK(MCLK), .en(hclk2), .inp(reg_80_b2 ? w538 : w227), .val(w228));
	
	assign w229 = w228 & hclk1;
	
	ymn_sr_bit l230(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(~w201), .val(w230));
	
	assign w231 = w230 & hclk1;
	
	assign w232 = ~(w240 | reg_80_b2 | ~w343[6]);
	
	ymn_sr_bit l233(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w232), .val(w233));
	
	assign w234 = w233 & hclk1;
	
	assign w235 = ~(~w343[12] | reg_80_b2);
	
	ymn_sr_bit l236(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w235), .val(w236));
	
	assign w237 = w236 & hclk1;
	
	assign w238 = ~w464;
	
	assign w239 = ~w343[7];
	
	assign w240 = ~reg_80_b1;
	
	ymn_sr_bit l242(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w241), .val(w242));
	
	assign w243 = w242 & hclk1;
	
	assign w244 = ~(reg_80_b2 | w464 | w239);
	
	ymn_sr_bit l245(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w244), .val(w245));
	
	assign w246 = w245 & hclk1;
	
	assign w247 = ~(w238 | w239 | reg_80_b2);
	
	ymn_sr_bit l248(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w247), .val(w248));
	
	assign w249 = w248 & hclk1;
	
	ymn_rs_trig2 rs250(.MCLK(MCLK), .set(w300), .rst(w263), .q(w250));
	
	ymn_rs_trig2 rs251(.MCLK(MCLK), .set(w258), .rst(w263), .q(w251));
	
	ymn_rs_trig2 rs252(.MCLK(MCLK), .set(w255), .rst(w263), .q(w252));
	
	assign w253 = w251;
	
	assign w254 = ~w178;
	
	assign w255 = w157 & w370;
	
	assign w257 = ~w252;
	
	assign w256 = w257 | ~reg_81_b5;
	
	assign w258 = ~(~w257 | ~w516);
	
	ymn_rs_trig rs259(.MCLK(MCLK), .set(~w261), .rst(w178 | reset1), .q(w259));
	
	ymn_sr_bit l260(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(~w259), .val(w260));
	
	ymn_sr_bit l261(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(~w260), .val(w261));
	
	assign w262 = ~(reset1 | w261 | w260);
	
	ymn_dlatch l263(.MCLK(MCLK), .en(hclk1), .inp(w262), .val(w263));
	
	ymn_dlatch l264(.MCLK(MCLK), .en(hclk1), .inp(~w343[0]), .val(w264));
	
	assign w265 = w264 & hclk2;
	
	ymn_dlatch l266(.MCLK(MCLK), .en(hclk1), .inp(w207), .val(w266));
	
	assign w267 = w266 & hclk2;
	
	assign w268 = ~(w267 | w180);
	
	assign w269 = ~w179;
	
	always @(posedge MCLK)
	begin
		if (w180)
			w270 <= io_data;
		else
			w270 <= vram_data[7:0];
	end
	
	assign w271 = ~(reg_81_b2 | w253);
	
	ymn_dlatch l272(.MCLK(MCLK), .en(hclk1), .inp(reg_81_b2), .val(w272));
	
	assign w273 = w272 & hclk2;
	
	assign w274 = ~(w273 | w271);
	
	always @(posedge MCLK)
	begin
		if (w273)
			w275 <= { color_palette, color_index };
		else if (w271)
			w275 <= w533;
	end
	
	assign w276 = ~reg_80_b2;
	
	ymn_dlatch l277(.MCLK(MCLK), .en(hclk1), .inp((w276 & w464 & w359) | (w276 & ~w464 & w358)), .val(w277));
	
	assign w278 = w277 & hclk2;
	
	always @(posedge MCLK)
	begin
		if (w278)
			w279 <= vram_data[7:0];
	end
	
	assign w280 = w279[3:0] == 4'h0;
	
	assign w281 = w279[7:4] == 4'h0;
	
	always @(posedge MCLK)
	begin
		if (w285)
		begin
			w282 <= w280;
			w283 <= w281;
		end
	end
	
	ymn_dlatch l278(.MCLK(MCLK), .en(hclk1), .inp(w289), .val(w278));
	
	assign w285 = w278 & hclk2;
	
	always @(posedge MCLK)
	begin
		if (w291)
			w286 <= w279;
	end
	
	ymn_dlatch l287(.MCLK(MCLK), .en(hclk1), .inp(w276), .val(w287));
	
	ymn_dlatch l288(.MCLK(MCLK), .en(hclk1), .inp(w359), .val(w288));
	
	ymn_dlatch l289(.MCLK(MCLK), .en(hclk2), .inp(w288 & w287), .val(w289));
	
	ymn_sr_bit #(.SR_LENGTH(2)) l290(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w289), .val(w290));
	
	assign w291 = w290 & hclk1;
	
	ymn_dlatch l292(.MCLK(MCLK), .en(hclk1), .inp(w560[0]), .val(w292));
	
	assign w293 = w292 & hclk2;
	
	ymn_dlatch l294(.MCLK(MCLK), .en(hclk1), .inp(w560[1]). .val(w294));
	
	assign w295 = w294 & hclk2;
	
	ymn_dlatch l296(.MCLK(MCLK), .en(hclk1), .inp(w357), .val(w296));
	
	ymn_dlatch l297(.MCLK(MCLK), .en(hclk2), .inp(w296 & ~reg_80_b2), .val(w297));
	
	assign spr_mask = { sprite7_w636, sprite6_w636, sprite5_w636, sprite4_w636,
		sprite3_w604, sprite2_w604, sprite1_w604, sprite0_w604 };
	
	assign spr_mask2 = { sprite3_w566, sprite2_w566, sprite1_w566, sprite0_w566 };
	
	always @(posedge MCLK)
	begin
		if (hclk2)
			w298 <= 1'h1;
		else if (hclk1)
		begin
			if (w559 |
				(spr_mask & 8'd254) == 8'd254 |
				(spr_mask & 8'd253) == 8'd253 |
				(spr_mask & 8'd251) == 8'd251 |
				(spr_mask & 8'd247) == 8'd247 |
				(spr_mask & 8'd239) == 8'd239 |
				(spr_mask & 8'd223) == 8'd223 |
				(spr_mask & 8'd191) == 8'd191 |
				(spr_mask & 8'd127) == 8'd127)
				w298 <= 1'h0;
		end
	end
	
	ymn_dlatch l299(.MCLK(MCLK), .en(hclk1), .inp(w298), .val(w299));
	
	ymn_dlatch l300(.MCLK(MCLK), .en(hclk2), .inp(w299), .val(w300));
	
	assign w301[0] = ~(w559 | w469 | w444 | spr_mask[0] | spr_mask2[0]);
	assign w301[1] = ~(w559 | w469 | w444 | w301[0] | spr_mask[1] | spr_mask2[1]);
	assign w301[2] = ~(w559 | w469 | w444 | |w301[1:0] | spr_mask[2] | spr_mask2[2]);
	assign w301[3] = ~(w559 | w469 | w444 | |w301[2:0] | spr_mask[3] | spr_mask2[3]);
	assign w301[4] = ~(w559 | w469 | w444 | |w301[3:0] | spr_mask[4]);
	assign w301[5] = ~(w559 | w469 | w444 | |w301[4:0] | spr_mask[5]);
	assign w301[6] = ~(w559 | w469 | w444 | |w301[5:0] | spr_mask[6]);
	assign w301[7] = ~(w559 | w469 | w444 | |w301[6:0] | spr_mask[7]);
	assign w301[8] = ~(|w301[7:0]);
	
	assign w302 = ~w301[8];
	
	ymn_sr_bit_array #(.DATA_WIDTH(8)) l303(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w301[7:0]), .val(w303));
	
	ymn_dlatch l304(.MCLK(MCLK), .en(hclk1), .inp(~w317), .val(w304));
	
	ymn_dlatch l305(.MCLK(MCLK), .en(hclk2), .inp(w304), .val(w305));
	
	ymn_dlatch #(.DATA_WIDTH(3)) l306_0(.MCLK(MCLK), .en(hclk2), .inp(w304 ? 3'h0 : w306 + 3'h1), .val(w306_0));
	
	assign w307 = w306 | (w305 ? { 1'h0, w315, 1'h0 } : 3'h0);
	
	ymn_dlatch #(.DATA_WIDTH(3)) l306(.MCLK(MCLK), .en(hclk1), .inp(w307), .val(w306));
	
	ymn_dlatch l308(.MCLK(MCLK), .en(hclk1), .inp(~w320), .val(w308));
	
	ymn_dlatch l309(.MCLK(MCLK), .en(hclk2), .inp(w308), .val(w309));
	
	ymn_dlatch #(.DATA_WIDTH(6)) l310_0(.MCLK(MCLK), .en(hclk2), .inp(w308 ? 6'h0 : w310 + { 5'h0, ~w312 }), .val(w310_0));
	
	assign w311 = w310 | (w309 ? { 1'h1, w315, w315, 1'h0, w315, w314 }} : 6'h0);
	
	ymn_dlatch #(.DATA_WIDTH(6)) l310(.MCLK(MCLK), .en(hclk1), .inp(w311), .val(w310));
	
	ymn_dlatch l312(.MCLK(MCLK), .en(hclk1), .inp(w318), .val(w312));
	
	assign w313 = { w311, w307 };
	
	ymn_sr_bit l314(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w381), .val(w314));
	
	ymn_dlatch l315_0(.MCLK(MCLK), .en(hclk1), .inp(w333), .val(w315_0));
	ymn_dlatch l315(.MCLK(MCLK), .en(hclk2), .inp(w315_0), .val(w315));
	
	assign w316 = w315_0;
	
	assign w317 = ~(w319 | w381 | w333);
	
	assign w318 = ~((w337 & w336) | w319);
	
	assign w319 = w335 & w321;
	
	assign w320 = ~(w333 | w381);
	
	assign w321 = ~(~w380 | w338);
	
	ymn_sr_bit l322(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(~w321), .val(w322));
	
	ymn_dlatch l323(.MCLK(MCLK), .en(hclk1), .inp(w322 | w338), .val(w323));
	
	ymn_sr_bit l324(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(~w328), .val(w324));
	
	assign w325 = ~(w328 | w324 | w326);
	
	assign w747 = CSYNC_i;
	
	ymn_sr_bit l748(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w747), .val(w748));
	
	assign w326 = ~reg_80_b0;
	assign w327 = ~(reg_80_b0 & w748);
	
	ymn_sr_bit l328(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w327), .val(w328));
	
	assign w328 = ~(w326 | ~w368 | w328);
	
	ymn_sr_bit l330(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(reset1), .val(w330));
	
	assign w331 = w330 | w329;
	
	assign w332 = w330 | w325;
	
	assign w333 = w332 | (w382 & w327);
	
	assign w334 = ~w339;
	
	ymn_sr_bit l335(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w334), .val(w335));
	
	assign w336 = ~(w335 | w333 | w338);
	
	ymn_dlatch l337(.MCLK(MCLK), .en(hclk2), .inp(~w323), .val(w337));
	
	ymn_sr_bit l338(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w333), .val(w338));
	
	ymn_rs_trig2 rs339(.MCLK(MCLK), .set(w379 | w338), .rst(w378 & w469), .val(w339));
	
	assign w749 = reg_80_b2 | w122;
	assign w750 = reg_80_b2 | w121;

	assign hpla[0] = (w313 & 9'b111111101) == 9'b111101000 & reg_80_b2;
	assign hpla[1] = (w313 & 9'b100010111) == 9'b000010010 & ~w468;
	assign hpla[2] = (w313 & 9'b100011111) == 9'b000001010 & ~w468;
	assign hpla[3] = (w313 & 9'b000000001) == 9'b000000001;
	assign hpla[4] = (w313 & 9'b111110001) == 9'b111110000 & ~w468;
	assign hpla[5] = (w313 & 9'b111111101) == 9'b100000100 & ~w468 & ~reg_80_b2;
	assign hpla[6] = (w313 & 9'b111111101) == 9'b100001000 & ~w468;
	assign hpla[7] = (w313 & 9'b111111001) == 9'b100010000 & ~w468;
	assign hpla[8] = (w313 & 9'b111111101) == 9'b100011100 & ~w468;
	assign hpla[9] = (w313 & 9'b111111101) == 9'b111010100 & ~w468;
	assign hpla[10] = (w313 & 9'b111111101) == 9'b111011100 & ~w468;
	assign hpla[11] = (w313 & 9'b111111101) == 9'b111100000 & ~w468;
	
	assign hpla[12] = (w313 & 9'b100000011) == 9'b000000000 & ~w466;
	assign hpla[13] = (w313 & 9'b000000111) == 9'b000000000 & w334;
	assign hpla[14] = (w313 & 9'b111111101) == 9'b100001100 & ~w468;
	assign hpla[15] = (w313 & 9'b100000111) == 9'b000000000 & ~w468;
	assign hpla[16] = (w313 & 9'b111111101) == 9'b100011000 & ~w468;
	assign hpla[17] = (w313 & 9'b100000111) == 9'b000000100 & ~w468;
	assign hpla[18] = (w313 & 9'b100000111) == 9'b000000110 & ~w468;
	assign hpla[19] = (w313 & 9'b000000111) == 9'b000000100 & w334;
	assign hpla[20] = (w313 & 9'b111111101) == 9'b111011000 & ~w468;
	assign hpla[21] = (w313 & 9'b111111101) == 9'b111100100 & ~w468;
	
	assign hpla[22] = (w313 & 9'b111111111) == 9'b111100111 & ~w749;
	assign hpla[23] = (w313 & 9'b111111111) == 9'b111100101;
	assign hpla[24] = (w313 & 9'b111111111) == 9'b111100001 & ~w750;
	assign hpla[25] = (w313 & 9'b111111111) == 9'b111011011 & ~w749;
	assign hpla[26] = (w313 & 9'b111111111) == 9'b111011001;
	assign hpla[27] = (w313 & 9'b111111111) == 9'b100100001 & ~w750;
	assign hpla[28] = (w313 & 9'b111111111) == 9'b100011011 & ~w749;
	assign hpla[29] = (w313 & 9'b111111111) == 9'b100011001;
	assign hpla[30] = (w313 & 9'b111111111) == 9'b100010101 & ~w750;
	assign hpla[31] = (w313 & 9'b111111111) == 9'b100001111 & ~w749;
	
	assign hpla[32] = (w313 & 9'b111111111) == 9'b100001101;
	assign hpla[33] = (w313 & 9'b111111111) == 9'b100001001 & ~w750;
	assign hpla[34] = (w313 & 9'b111111111) == 9'b000001001;
	assign hpla[35] = (w313 & 9'b111111111) == 9'b111101001;
	assign hpla[36] = (w313 & 9'b000000111) == 9'b000000111;
	assign hpla[37] = (w313 & 9'b000000111) == 9'b000000001;
	assign hpla[38] = (w313 & 9'b111111111) == 9'b111010111;
	assign hpla[39] = (w313 & 9'b111111111) == 9'b100010111;
	assign hpla[40] = (w313 & 9'b000000111) == 9'b000000011;
	assign hpla[41] = (w313 & 9'b100010000) == 9'b100010000 & ~w469;
	
	assign hpla[42] = (w313 & 9'b111111111) == 9'b111111000;
	assign hpla[43] = (w313 & 9'b111111111) == 9'b111101010;
	assign hpla[44] = (w313 & 9'b111111111) == 9'b111101000;
	assign hpla[45] = (w313 & 9'b111111111) == 9'b100100100;
	assign hpla[46] = (w313 & 9'b111111111) == 9'b000000000;
	assign hpla[47] = (w313 & 9'b111111111) == 9'b100011100;
	assign hpla[48] = (w313 & 9'b111111111) == 9'b100001010;
	
	assign hpla[49] = (w313 & 9'b111111111) == 9'b101011000;
	assign hpla[50] = (w313 & 9'b111111111) == 9'b000010010;
	assign hpla[51] = (w313 & 9'b111111111) == 9'b000001010;
	assign hpla[52] = (w313 & 9'b111111111) == 9'b101000100;
	assign hpla[53] = (w313 & 9'b111111111) == 9'b000000110;
	assign hpla[54] = (w313 & 9'b000000111) == 9'b000000100;
	assign hpla[55] = (w313 & 9'b111111111) == 9'b101011110;
	assign hpla[56] = (w313 & 9'b111111111) == 9'b100100110;
	
	ymn_dlatch #(.DATA_WIDTH(22)) l340(.MCLK(MCLK), .en(hclk1), .inp(hpla[21:0]), .val(w340));
	
	assign w341[0] = w340[1] | w340[2];
	assign w341[1] = w340[2];
	assign w341[2] = w340[3];
	assign w341[3] = w340[4];
	assign w341[4] = w340[5];
	assign w341[5] = w340[6];
	assign w341[6] = w340[7];
	assign w341[7] = w340[8];
	assign w341[8] = w340[9];
	assign w341[9] = w340[10];
	assign w341[10] = w340[11];
	assign w341[11] = w340[12];
	assign w341[12] = w340[13];
	assign w341[13] = w340[14];
	assign w341[14] = w340[15];
	assign w341[15] = w340[16];
	assign w341[16] = w340[17];
	assign w341[17] = w340[18];
	assign w341[18] = w340[19];
	assign w341[19] = w340[20];
	assign w341[20] = w340[21];

	assign w342[0] = w341[2];
	assign w342[1] = w341[4] | w341[5] | w341[6] | w341[7] | w341[8]
		| w341[9] | w341[10] | w341[11] | w341[12];
	assign w342[2] = w341[0] | w341[3] | w341[11] | w341[12];
	assign w342[3] = w341[4] | w341[5] | w341[6] | w341[7] | w341[8]
		| w341[9] | w341[10];
	assign w342[4] = w341[0] | w341[3] | w341[4] | w341[5] | w341[6]
		| w341[7] | w341[8] | w341[9] | w341[10];
	assign w342[5] = w341[12] | w341[14];
	assign w342[6] = w341[16];
	assign w342[7] = w341[17] | w341[18];
	assign w342[8] = w341[1] | w341[13] | w341[15] | w341[19] | w341[20];
	assign w342[9] = w341[13] | w341[15] | w341[17] | w341[18] | w341[19]
		| w341[20];
	assign w342[10] = w341[0] | w341[1] | w341[2] | w341[3] | w341[4]
		| w341[5] | w341[6] | w341[7] | w341[8] | w341[9]
		| w341[10] | w341[11] | w341[12] | w341[13] | w341[14]
		| w341[15] | w341[16] | w341[17] | w341[18] | w341[19]
		| w341[20] | w316;
	assign w342[11] = w341[11] | w341[12];
	assign w342[12] = w341[14];
	
	ymn_dlatch #(.DATA_WIDTH(13)) l343(.MCLK(MCLK), .en(hclk2), .inp(w342), .val(w343));
	
	ymn_sr_bit l344(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[22]), .val(w344));
	ymn_sr_bit l345(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[23]), .val(w345));
	ymn_sr_bit l346(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[24]), .val(w346));
	ymn_sr_bit l347(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[25]), .val(w347));
	ymn_sr_bit l348(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[26]), .val(w348));
	ymn_sr_bit l349(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[27]), .val(w349));
	ymn_sr_bit l350(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[28]), .val(w350));
	ymn_sr_bit l351(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[29]), .val(w351));
	ymn_sr_bit l352(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[30]), .val(w352));
	ymn_sr_bit l353(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[31]), .val(w353));
	ymn_sr_bit l354(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[32]), .val(w354));
	ymn_sr_bit l355(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[33]), .val(w355));
	ymn_sr_bit l356(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[34]), .val(w356));
	ymn_sr_bit l357(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[35]), .val(w357));
	ymn_sr_bit l358(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[36]), .val(w358));
	ymn_sr_bit l359(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[37]), .val(w359));
	
	ymn_dlatch l360(.MCLK(MCLK), .en(hclk1), .inp(hpla[38]), .val(w360));
	ymn_dlatch l361(.MCLK(MCLK), .en(hclk1), .inp(hpla[39]), .val(w361));
	ymn_dlatch l362(.MCLK(MCLK), .en(hclk1), .inp(hpla[40]), .val(w362));
	ymn_dlatch l363(.MCLK(MCLK), .en(hclk1), .inp(hpla[41]), .val(w363));
	
	ymn_dlatch l364(.MCLK(MCLK), .en(hclk2), .inp(w360 | w361 | (w362 & ~w363)), .val(w364));
	
	assign w365 = reg_80_b3 ? w367 : w356;
	
	ymn_dlatch l366(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w365), .val(w366));
	
	ymn_dlatch l367(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(w366), .val(w367));
	
	ymn_sr_bit l368(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[42]), .val(w368));
	ymn_sr_bit l369(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[43]), .val(w369));
	ymn_sr_bit l370(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[44]), .val(w370));
	ymn_sr_bit l371(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[45]), .val(w371));
	ymn_sr_bit l372(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[46]), .val(w372));
	ymn_sr_bit l373(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[47]), .val(w373));
	ymn_sr_bit l374(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[48]), .val(w374));
	ymn_sr_bit l375(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[49]), .val(w375));
	ymn_sr_bit l376(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[50]), .val(w376));
	ymn_sr_bit l377(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[51]), .val(w377));
	ymn_sr_bit l378(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[53]), .val(w378));
	ymn_sr_bit l379(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[52]), .val(w379));
	ymn_sr_bit l380(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[54]), .val(w380));
	ymn_sr_bit l381(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[55]), .val(w381));
	ymn_sr_bit l382(.MCLK(MCLK), .c1(hclk1), .c2(hclk2), .inp(hpla[56]), .val(w382));
	
	ymn_rs_trig2 rs383(.MCLK(MCLK), .set(w369), .rst(w368), .q(w383));
	ymn_rs_trig2 rs384(.MCLK(MCLK), .set(w371 & ~w334), .rst(w370), .q(w384));
	ymn_rs_trig2 rs385(.MCLK(MCLK), .set(w373 & ~w334), .rst(w372), .q(w385));
	ymn_rs_trig rs386(.MCLK(MCLK), .set(w376 | (~w334 & w377 & ~reg_80_b5)), .rst(w375 | (w374 & ~w334)), .q(w386));
	
	assign w387 = w386 & reg_81_b6 & w159;

endmodule

