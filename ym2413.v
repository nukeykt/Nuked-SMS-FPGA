module ym2413
	(
	input MCLK,
	input XIN,
	input [7:0] DATA_i,
	input CS,
	input WE,
	input IC,
	input A0,
	output [1:0] DATA_o,
	output DATA_d,
	output [9:0] RO,
	output [9:0] MO
	);
	
	wire reset = ~IC;
	wire clk = ~XIN;
	
	wire mclk1 = clk;
	wire mclk2 = ~clk;
	wire ic_latch;
	wire [1:0] prescaler_cnt;
	wire prescaler_reset;
	wire prescaler_cnt0_cout;
	wire clk1_latch_1, clk1_latch;
	wire clk2_latch_1, clk2_latch;
	wire dac_clk;
	wire clk1;
	wire clk2;
	wire write;
	wire dbg_read;
	wire write0_sel;
	wire write1_sel;
	wire write0_rs;
	wire write1_rs;
	reg write0_rs_l1;
	reg write1_rs_l1;
	wire write0_rs_l2;
	wire write1_rs_l2;
	reg write0_rs_l3;
	reg write1_rs_l3;
	wire write0_rs_l4;
	wire write1_rs_l4;
	wire write0;
	wire write1;
	wire [7:0] data_reg;
	wire [2:0] fsm_cnt1;
	wire [1:0] fsm_cnt2;
	wire ic_latch2;
	wire fsm_reset;
	wire [1:0] fsm_cnt1_c;
	wire fsm_cnt2_c;
	wire fsm_reset1;
	wire fsm_reset2;
	wire fsm_cnt1_of;
	wire [4:0] fsm_cnt;
	wire fsm_cnt_l1;
	wire fsm_cnt_l2_1, fsm_cnt_l2;
	wire fsm_cnt_l3_1, fsm_cnt_l3;
	wire [13:0] fsm_out;
	wire rclk;
	wire rclk_latch;
	wire rclk1;
	wire rclk2;
	wire [9:0] reg_addr_decoder;
	wire [9:0] reg_addr_write;
	wire [7:0] regs_0_v, regs_0_oe;
	wire [7:0] regs_1_v, regs_1_oe;
	wire [7:0] regs_2_v, regs_2_oe;
	wire [1:0] regs_3h_v, regs_3h_oe;
	wire [4:0] regs_3l_v, regs_3l_oe;
	wire [7:0] regs_4_v, regs_4_oe;
	wire [7:0] regs_5_v, regs_5_oe;
	wire [7:0] regs_6_v, regs_6_oe;
	wire [7:0] regs_7_v, regs_7_oe;
	wire [5:0] regs_e_v;
	wire [3:0] regs_f_v;
	wire [4:0] multi;
	wire ksr;
	wire sustain;
	wire vibrato;
	wire tremolo;
	wire [5:0] tl;
	wire [1:0] ksl;
	wire [2:0] feedback;
	wire wf_mod;
	wire wf_car;
	wire [3:0] decay;
	wire [3:0] attack;
	wire [3:0] release_rate;
	wire [3:0] sustain_level;
	wire rhythm;
	wire bass_drum;
	wire snare_drum;
	wire tom_tom;
	wire top_cymbal;
	wire high_hat;
	wire test0;
	wire test1;
	wire test2;
	wire test3;
	wire rhy_sel0;
	wire rhy_bd0;
	wire rhy_hh;
	wire rhy_tom;
	wire rhy_bd1;
	wire rhy_sd;
	wire rhy_tc;
	wire [3:0] instr;
	wire key_on;
	wire inst_hh_tom_l;
	wire inst_kon_l;
	wire inst_mc_l;
	wire inst_cust_l;
	wire force_zerorate;
	wire mod_sel_custom;
	wire car_sel_custom;
	wire rom_sel1;
	wire rom_sel2;
	
	ymn_sr_bit #(.SR_LENGTH(2)) l_ic_latch(.MCLK(MCLK), .c1(mclk1), .c2(mclk2), .inp(reset), .val(ic_latch));
	
	assign prescaler_reset = ~(~reset | ic_latch);
	
	cnt_bit_2 prescaler_cnt0(.MCLK(MCLK), .c_in(1'h1), .reset(prescaler_reset), .c1(mclk1), .c2(mclk2), .val(prescaler_cnt[0]), .c_out(prescaler_cnt0_cout));
	cnt_bit_2 prescaler_cnt1(.MCLK(MCLK), .c_in(prescaler_cnt0_cout), .reset(prescaler_reset), .c1(mclk1), .c2(mclk2), .val(prescaler_cnt[1]));

	ymn_sr_bit l_clk1_latch_1(.MCLK(MCLK), .c1(mclk1), .c2(mclk2), .inp(prescaler_cnt == 2'h2), .val(clk1_latch_1));
	ymn_dlatch l_clk1_latch(.MCLK(MCLK), .en(mclk1), .inp(clk1_latch_1), .val(clk1_latch));
	
	ymn_sr_bit l_clk2_latch_1(.MCLK(MCLK), .c1(mclk1), .c2(mclk2), .inp(prescaler_cnt == 2'h0), .val(clk2_latch_1));
	ymn_dlatch l_clk2_latch(.MCLK(MCLK), .en(mclk1), .inp(clk2_latch_1), .val(clk2_latch));

	ymn_sr_bit l_dac_clk(.MCLK(MCLK). .c1(mclk1), .c2(mclk2), .inp(prescaler__cnt == 2'h0), .nval(dac_clk));
	
	assign clk1 = clk1_latch_1 | clk1_latch;
	assign clk2 = clk2_latch_1 | clk2_latch;
	
	assign write = ~(CS | WE | reset);
	
	assign dbg_read = ~(CS | ~WE | A0 | reset);
	
	assign write0_sel = ~(CS | WE | reset | A0);
	assign write1_sel = ~(CS | WE | reset | ~A0);
	
	ymn_rs_trig rs_write0(.MCLK(MCLK), .set(~(~write0_sel | write0_rs_l4)), .rst(write0_rs_l4), .q(write0_rs));
	ymn_rs_trig rs_write1(.MCLK(MCLK), .set(~(~write1_sel | write1_rs_l4)), .rst(write1_rs_l4), .q(write1_rs));
	
	always @(posedge MCLK)
	begin
		if (mclk2)
		begin
			write0_rs_l1 <= write0_rs;
			write1_rs_l1 <= write1_rs;
		end
		if (clk2)
		begin
			write0_rs_l3 <= write0_rs_l2;
			write1_rs_l3 <= write1_rs_l2;
		end
	end
	
	ymn_sr_bit l_write0_rs_l2(.MCLK(MCLK), .c1(mclk1), .c2(mclk2), .inp(write0_rs_l1), .val(write0_rs_l2));
	ymn_sr_bit l_write1_rs_l2(.MCLK(MCLK), .c1(mclk1), .c2(mclk2), .inp(write1_rs_l1), .val(write1_rs_l2));
	
	ymn_sr_bit l_write0_rs_l4(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(write0_rs_l3), .val(write0_rs_l4));
	ymn_sr_bit l_write1_rs_l4(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(write1_rs_l3), .val(write1_rs_l4));
	
	assign write0 = ~write0_rs_l4;
	assign write1 = write1_rs_l4;
	
	ymn_slatch #(.DATA_WIDTH(8)) l_data_reg(.MCLK(MCLK), .en(write), .inp(DATA_i), .val(data_reg));
	
	ymn_sr_bit #(.SR_LENGTH(2)) l_ic_latch2(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(reset), .val(ic_latch2));
	
	assign fsm_reset = ~(reset & ~ic_latch2);
	
	cnt_bit cnt_fsm0(.MCLK(MCLK), .c_in(1'h1), .reset(fsm_reset1), .c1(clk1), .c2(clk2), .val(fsm_cnt1[0]), c_out(fsm_cnt1_c[0]));
	cnt_bit cnt_fsm1(.MCLK(MCLK), .c_in(fsm_cnt1_c[0]), .reset(fsm_reset1), .c1(clk1), .c2(clk2), .val(fsm_cnt1[1]), c_out(fsm_cnt1_c[1]));
	cnt_bit cnt_fsm2(.MCLK(MCLK), .c_in(fsm_cnt1_c[1]), .reset(fsm_reset1), .c1(clk1), .c2(clk2), .val(fsm_cnt1[2]));
	
	assign fsm_cnt1_of = ~(fsm_cnt1[0] & fsm_cnt1[2]);
	
	assign fsm_reset1 = ~(fsm_reset & fsm_cnt1_of);
	assign fsm_reset2 = ~(fsm_reset & ~(fsm_cnt2[1] & ~fsm_cnt1_of));
	
	cnt_bit cnt_fsm3(.MCLK(MCLK), .c_in(~fsm_cnt1_of), .reset(fsm_reset2), .c1(clk1), .c2(clk2), .val(fsm_cnt2[0]), c_out(fsm_cnt2_c));
	cnt_bit cnt_fsm4(.MCLK(MCLK), .c_in(fsm_cnt2_c), .reset(fsm_reset2), .c1(clk1), .c2(clk2), .val(fsm_cnt2[1]));
	
	assign fsm_cnt = { fsm_cnt2, fsm_cnt1 };
	
	ymn_sr_bit #(.SR_LENGTH(2)) l_fsm_cnt_l1(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(fsm_cnt[4]), .val(fsm_cnt_l1));
	ymn_sr_bit #(.SR_LENGTH(2)) l_fsm_cnt_l2_1(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(fsm_cnt[3]), .val(fsm_cnt_l2_1));
	ymn_sr_bit l_fsm_cnt_l2(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(fsm_cnt_l2_1), .val(fsm_cnt_l2));
	
	ymn_sr_bit l_fsm_cnt_l3_1(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(fsm_out[4]), .val(fsm_cnt_l3_1));
	ymn_sr_bit l_fsm_cnt_l3(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(fsm_cnt_l3_1), .val(fsm_cnt_l3));
	
	// 0 - dac_en
	// 1 -
	// 2 - dac_load
	// 3 - modcar_sel
	// 4 - sync16
	// 5 -
	// 6 -
	// 7 - chan_sel1
	// 8 - chan_sel2
	// 9 - tremolo_sync
	// 10 - sync17
	// 11 - sync0
	// 12 - can_sel0
	// 13 - dac_en_r
	assign fsm_out[0] = fsm_out[3] & ~(rhythm & fsm_cnt_l1);
	assign fsm_out[1] = fsm_out[3] & ~(rhythm & fsm_cnt[4:1] == 4'h8);
	assign fsm_out[2] = ~fsm_out[3] & ~(rhythm & fsm_cnt == 5'h14) & ~(rhythm & fsm_cnt == 5'h13);
	assign fsm_out[3] = ~((fsm_cnt & 5'h5) == 5'h4 | (fsm_cnt & 5'h6) == 5'h2);
	assign fsm_out[4] = fsm_cnt == 5'h14;
	assign fsm_out[5] = fsm_cnt == 5'h11;
	assign fsm_out[6] = fsm_cnt == 5'hc;
	assign fsm_out[7] = fsm_cnt_l2_1;
	assign fsm_out[8] = ~fsm_out[7] & ~fsm_out[12];
	assign fsm_out[9] = ~fsm_cnt_l2 & ~fsm_cnt[4];
	assign fsm_out[10] = fsm_cnt_l3_1;
	assign fsm_out[11] = fsm_cnt_l3;
	assign fsm_out[12] = fsm_cnt_l1;
	assign fsm_out[13] = rhythm & (~fsm_out[3] | fsm_cnt_l1) & fsm_cnt != 5'hc & fsm_cnt != 5'h12;
	
	assign rclk = ~rhythm | fsm_out[13];
	ymn_dlatch l_rclk(.MCLK(MCLK), .en(clk1), .inp(rclk), .val(rclk_latch));
	
	assign rclk1 = rclk & clk1;
	assign rclk2 = rclk_latch & clk2;
	
	
	assign reg_addr_decoder[0] = data_reg == 8'h0;
	assign reg_addr_decoder[1] = data_reg == 8'h1;
	assign reg_addr_decoder[2] = data_reg == 8'h2;
	assign reg_addr_decoder[3] = data_reg == 8'h3;
	assign reg_addr_decoder[4] = data_reg == 8'h4;
	assign reg_addr_decoder[5] = data_reg == 8'h5;
	assign reg_addr_decoder[6] = data_reg == 8'h6;
	assign reg_addr_decoder[7] = data_reg == 8'h7;
	assign reg_addr_decoder[8] = data_reg == 8'he;
	assign reg_addr_decoder[9] = data_reg == 8'hf;
	
	reg_handler rh0(.MCLK(MCLK), .sel(reg_addr_decoder[0]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[0]));
	reg_handler rh1(.MCLK(MCLK), .sel(reg_addr_decoder[1]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[1]));
	reg_handler rh2(.MCLK(MCLK), .sel(reg_addr_decoder[2]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[2]));
	reg_handler rh3(.MCLK(MCLK), .sel(reg_addr_decoder[3]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[3]));
	reg_handler rh4(.MCLK(MCLK), .sel(reg_addr_decoder[4]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[4]));
	reg_handler rh5(.MCLK(MCLK), .sel(reg_addr_decoder[5]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[5]));
	reg_handler rh6(.MCLK(MCLK), .sel(reg_addr_decoder[6]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[6]));
	reg_handler rh7(.MCLK(MCLK), .sel(reg_addr_decoder[7]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[7]));
	reg_handler rh8(.MCLK(MCLK), .sel(reg_addr_decoder[8]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[8]));
	reg_handler rh9(.MCLK(MCLK), .sel(reg_addr_decoder[9]), .write0(write0), .write1(write1), .c1(clk1), .c2(clk2), .val(reg_addr_write[9]));
	
	reg_bit2 #(.DATA_WIDTH(8)) regs_0(.MCLK(MCLK), .en(reg_addr_write[0]), .inp(data_reg), .rst(reset), .oe(mod_sel_custom), .val(regs_0_v), .v_oe(regs_0_oe));
	reg_bit2 #(.DATA_WIDTH(8)) regs_1(.MCLK(MCLK), .en(reg_addr_write[1]), .inp(data_reg), .rst(reset), .oe(car_sel_custom), .val(regs_1_v), .v_oe(regs_1_oe));
	reg_bit2 #(.DATA_WIDTH(8)) regs_2(.MCLK(MCLK), .en(reg_addr_write[2]), .inp(data_reg), .rst(reset), .oe(mod_sel_custom), .val(regs_2_v), .v_oe(regs_2_oe));
	reg_bit2 #(.DATA_WIDTH(2)) regs_3h(.MCLK(MCLK), .en(reg_addr_write[3]), .inp(data_reg[7:6]), .rst(reset), .oe(car_sel_custom), .val(regs_3h_v), .v_oe(regs_3h_oe));
	reg_bit2 #(.DATA_WIDTH(5)) regs_3l(.MCLK(MCLK), .en(reg_addr_write[3]), .inp(data_reg[4:0]), .rst(reset), .oe(inst_cust_l), .val(regs_3l_v), .v_oe(regs_3l_oe));
	reg_bit2 #(.DATA_WIDTH(8)) regs_4(.MCLK(MCLK), .en(reg_addr_write[4]), .inp(data_reg), .rst(reset), .oe(mod_sel_custom), .val(regs_4_v), .v_oe(regs_4_oe));
	reg_bit2 #(.DATA_WIDTH(8)) regs_5(.MCLK(MCLK), .en(reg_addr_write[5]), .inp(data_reg), .rst(reset), .oe(car_sel_custom), .val(regs_5_v), .v_oe(regs_5_oe));
	reg_bit2 #(.DATA_WIDTH(8)) regs_6(.MCLK(MCLK), .en(reg_addr_write[6]), .inp(data_reg), .rst(reset), .oe(mod_sel_custom), .val(regs_6_v), .v_oe(regs_6_oe));
	reg_bit2 #(.DATA_WIDTH(8)) regs_7(.MCLK(MCLK), .en(reg_addr_write[7]), .inp(data_reg), .rst(reset), .oe(car_sel_custom), .val(regs_7_v), .v_oe(regs_7_oe));
	
	ymn_slatch_r2 #(.DATA_WIDTH(6)) regs_e(.MCLK(MCLK), .en(reg_addr_write[8]), inp(data_reg[5:0]), .rst(reset), .val(regs_e_v));
	ymn_slatch_r2 #(.DATA_WIDTH(4)) regs_f(.MCLK(MCLK), .en(reg_addr_write[9]), inp(data_reg[3:0]), .rst(reset), .val(regs_f_v));
	
	assign rhythm = regs_e_v[5];
	assign bass_drum = regs_e_v[4];
	assign snare_drum = regs_e_v[3];
	assign tom_tom = regs_e_v[2];
	assign top_cymbal = regs_e_v[1];
	assign high_hat = regs_e_v[0];
	assign test0 = reg_f_v[0];
	assign test1 = regs_e_v[1];
	assign test2 = regs_e_v[2];
	assign test3 = regs_e_v[3];
	
	ymn_sr_bit l_rhy_sel0(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(fsm_sel[6]), .val(rhy_sel0));
	ymn_sr_bit l_rhy_sel1(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(rhy_sel0 & rhythm), .val(rhy_bd0));
	ymn_sr_bit l_rhy_sel2(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(rhy_bd0), .val(rhy_hh));
	ymn_sr_bit l_rhy_sel2(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(rhy_hh), .val(rhy_tom));
	ymn_sr_bit l_rhy_sel2(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(rhy_tom), .val(rhy_bd1));
	ymn_sr_bit l_rhy_sel2(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(rhy_bd1), .val(rhy_sd));
	ymn_sr_bit l_rhy_sel2(.MCLK(MCLK), .c1(clk1), .c2(clk2), .inp(rhy_sd), .val(rhy_tc));
	
	ymn_dlatch inst_hh_tom(.MCLK(MCLK), .en(clk1), .inp(rhy_hh | rhy_tom), .val(inst_hh_tom_l));
	ymn_dlatch inst_kon(.MCLK(MCLK), .en(clk1), .inp(key_on), .val(inst_kon_l));
	ymn_dlatch inst_mc(.MCLK(MCLK), .en(clk1), .inp(fsm_sel[3]), .val(inst_mc_l));
	ymn_dlatch inst_cust(.MCLK(MCLK), .en(clk1), .inp(inst == 4'h0), .val(inst_cust_l));
	
	assign force_zerorate = ~inst_hh_tom_l & ~inst_kon_l & inst_mc_l;
	
	assign mod_sel_custom = inst_cust_l & inst_mc_l;
	assign car_sel_custom = inst_cust_l & ~inst_mc_l;
	
	assign sel_rom1 = ~inst_cust_l;
	assign sel_rom2 = ~mod_sel_custom & ~inst_hh_tom_l & inst_mc_l;
	
	reg [62:0] instr_data;
	wire [36:0] instr_data_m;
	wire [36:0] instr_data_c;
	reg [36:0] instr_data_l;
	
	assign instr_data_m[10:0] = instr_data[10:0];
	assign instr_data_c[10:0] = instr_data[10:0];
	
	genvar i;
	generate
		for (i = 0; i < 26; i++)
		begin
			assign instr_data_m[11+i] = instr_data[11+i*2];
			assign instr_data_c[11+i] = instr_data[12+i*2];
		end
	endgenerate
	
	always @(posedge MCLK)
	begin
		if (~clk2)
		begin
			if (rhy_sel_bd0)
				instr_data <= 63'b011000011110000000000000010000010100010101010100010100010001000;
			else if (rhy_sel_hh)
				instr_data <= 63'b000000000000000000000000010000010100000100000001000100000101010;
			else if (rhy_sel_tom)
				instr_data <= 63'b000000000000000000000100010000010101010100000000010001010000010;
			else if (rhy_sel_bd1)
				instr_data <= 63'b000000000000000000000000001000001010101010000000001010001010001;
			else if (rhy_sel_sd)
				instr_data <= 63'b000000000000000000000000001000001010001010000000001000001000000;
			else if (rhy_sel_tc)
				instr_data <= 63'b000000000000000000000000001000001000100010001000001000100010001;
			else
			begin
				case (instr)
					4'h1: instr_data <= 63'b011110101110011111000000011000010110111010000000000000100010101;
					4'h2: instr_data <= 63'b011010011010001001000001011000011110111100101010000100100001111;
					4'h3: instr_data <= 63'b011001000000000001000001011100011111010000110000000011000000111;
					4'h4: instr_data <= 63'b001110001110001111000000011000010011100100100000010111000010101;
					4'h5: instr_data <= 63'b011110001100000111000001001000010111101000101000000010001000000;
					4'h6: instr_data <= 63'b010110001010000111000000110000010111101000000010000000101000000;
					4'h7: instr_data <= 63'b011101001110001110000000011000011000000000010010000001000010101;
					4'h8: instr_data <= 63'b101101101000000110000001011000010011101000011000000000000010101;
					4'h9: instr_data <= 63'b011011001100011110000000011000000111100001100010000001100010101;
					4'ha: instr_data <= 63'b001011110000011010000000011000011010101001101110010101000010111;
					4'hb: instr_data <= 63'b000011100010000001000001011100011111110100110000000001000010000;
					4'hc: instr_data <= 63'b100100001110101001000101011000011111111110000000000100100001100;
					4'hd: instr_data <= 63'b001100001010011100100000010000011110101000110010001100000000100;
					4'he: instr_data <= 63'b010101000110000000000000011001011100001100100110000000000001110;
					4'hf: instr_data <= 63'b001001000110011100000000011100011111110000100100010000100000101;
					default: instr_data <= 63'b000000000000000000000000000000000000000000000000000000000000000;
				endcase
			end
		end
		if (clk1)
		begin
			instr_data_l <= fsm_sel[6] ? instr_data_m : instr_data_c;
		end
	end
	
endmodule

module reg_handler
	(
	input MCLK,
	input sel,
	input write0,
	input write1,
	input c1,
	input c2,
	output val
	);
	
	wire val1;
	
	ymn_sr_bit mem(.MCLK(MCLK), .c1(c1), .c2(c2), .inp(write0 ? sel : val1), .val(val1));
	
	assign val = val1 & write1;
	
endmodule

module reg_bit2 #(parameter DATA_WIDTH = 1)
	(
	input MCLK,
	input en,
	input [DATA_WIDTH-1:0] inp,
	input rst,
	input oe,
	output [DATA_WIDTH-1:0] val,
	output [DATA_WIDTH-1:0] v_oe
	);
	
	reg [DATA_WIDTH-1:0] mem;
	
	always @(posedge MCLK)
	begin
		if (en)
			mem <= en ? inp : (rst ? {DATA_WIDTH{1'h0}} : mem);
	end
	
	assign val = mem;
	
	assign v_oe = {DATA_WIDTH{oe}} & ~(mem & {DATA_WIDTH{rst}});

endmodule


module cnt_bit
	(
	input MCLK,
	input c_in,
	input reset,
	input c1,
	input c2,
	output val,
	output c_out
	);
	
	wire nval;
	
	wire c_in_n = ~c_in;
	
	assign c_out = ~(nval | c_in_n);
	
	wire sum = ~(reset | (nval & c_in_n) | c_out);
	
	ymn_sr_bit mem(.MCLK(MCLK), .c1(c1), .c2(c2), .inp(sum), .val(val), .nval(nval));

endmodule

module cnt_bit_2
	(
	input MCLK,
	input c_in,
	input reset,
	input c1,
	input c2,
	output val,
	output c_out
	);
	
	wire c_in_n = ~c_in;
	
	assign c_out = ~(val | c_in_n);
	
	wire sum = ~(reset | (val & c_in_n) | c_out);
	
	ymn_sr_bit mem(.MCLK(MCLK), .c1(c1), .c2(c2), .inp(sum), .nval(val));

endmodule
