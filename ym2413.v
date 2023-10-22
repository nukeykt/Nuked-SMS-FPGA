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
