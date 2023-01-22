// Copyright (C) 2022  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 21.1.1 Build 850 06/23/2022 SJ Lite Edition"
// CREATED		"Thu Dec  8 22:16:14 2022"

module basiccomputerdatapath(
	clk,
	rst,
	memory_we,
	write_en_AR,
	increment_AR,
	write_en_TR,
	increment_TR,
	increment_IR,
	write_en_IR,
	increment_AC,
	write_en_AC,
	increment_DR,
	write_en_DR,
	increment_PC,
	write_en_PC,
	ALU_OP,
	in0,
	slect,
	ALU_CO,
	ALU_OVF,
	ALU_N,
	ALU_Z
);


input wire	clk;
input wire	rst;
input wire	memory_we;
input wire	write_en_AR;
input wire	increment_AR;
input wire	write_en_TR;
input wire	increment_TR;
input wire	increment_IR;
input wire	write_en_IR;
input wire	increment_AC;
input wire	write_en_AC;
input wire	increment_DR;
input wire	write_en_DR;
input wire	increment_PC;
input wire	write_en_PC;
input wire	[2:0] ALU_OP;
input wire	[15:0] in0;
input wire	[2:0] slect;
output wire	ALU_CO;
output wire	ALU_OVF;
output wire	ALU_N;
output wire	ALU_Z;

wire	[15:0] arg;
wire	[15:0] SYNTHESIZED_WIRE_0;
wire	[15:0] SYNTHESIZED_WIRE_19;
wire	[0:0] SYNTHESIZED_WIRE_3;
wire	[15:0] SYNTHESIZED_WIRE_20;
wire	[15:0] SYNTHESIZED_WIRE_21;
wire	[15:0] SYNTHESIZED_WIRE_7;
wire	[15:0] SYNTHESIZED_WIRE_10;
wire	[15:0] SYNTHESIZED_WIRE_11;
wire	[15:0] SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;

assign	ALU_CO = SYNTHESIZED_WIRE_16;
assign	SYNTHESIZED_WIRE_14 = 1;
assign	SYNTHESIZED_WIRE_15 = 0;




registers	b2v_AC(
	.clk(clk),
	.reset(rst),
	.write_en(write_en_AC),
	.increment(increment_AC),
	.data(SYNTHESIZED_WIRE_0),
	.out(SYNTHESIZED_WIRE_20));
	defparam	b2v_AC.W = 16;


registers	b2v_AR(
	.clk(clk),
	.reset(rst),
	.write_en(write_en_AR),
	.increment(increment_AR),
	.data(SYNTHESIZED_WIRE_19),
	.out(arg));
	defparam	b2v_AR.W = 16;


registers	b2v_DR(
	.clk(clk),
	.reset(rst),
	.write_en(write_en_DR),
	.increment(increment_DR),
	.data(SYNTHESIZED_WIRE_19),
	.out(SYNTHESIZED_WIRE_21));
	defparam	b2v_DR.W = 16;


ALU	b2v_inst(
	.E(SYNTHESIZED_WIRE_3),
	.AC(SYNTHESIZED_WIRE_20),
	.DR(SYNTHESIZED_WIRE_21),
	.OP(ALU_OP),
	.CO(SYNTHESIZED_WIRE_16),
	.OVF(ALU_OVF),
	.N(ALU_N),
	.Z(ALU_Z),
	.RES(SYNTHESIZED_WIRE_0));
	defparam	b2v_inst.W = 16;




memory	b2v_inst2(
	.clk(clk),
	.write_en(memory_we),
	.addr(arg[11:0]),
	.write_data(SYNTHESIZED_WIRE_19),
	.read_data(SYNTHESIZED_WIRE_12));


data_Mux_8x1	b2v_inst3(
	.Input0(in0),
	.Input1(arg),
	.Input2(SYNTHESIZED_WIRE_7),
	.Input3(SYNTHESIZED_WIRE_21),
	.Input4(SYNTHESIZED_WIRE_20),
	.Input5(SYNTHESIZED_WIRE_10),
	.Input6(SYNTHESIZED_WIRE_11),
	.Input7(SYNTHESIZED_WIRE_12),
	.Selection(slect),
	.Output_res(SYNTHESIZED_WIRE_19));
	defparam	b2v_inst3.W = 16;


registers	b2v_IR(
	.clk(clk),
	.reset(rst),
	.write_en(write_en_IR),
	.increment(increment_IR),
	.data(SYNTHESIZED_WIRE_19),
	.out(SYNTHESIZED_WIRE_10));
	defparam	b2v_IR.W = 16;


registers	b2v_IR6(
	.clk(clk),
	.reset(rst),
	.write_en(SYNTHESIZED_WIRE_14),
	.increment(SYNTHESIZED_WIRE_15),
	.data(SYNTHESIZED_WIRE_16),
	.out(SYNTHESIZED_WIRE_3));
	defparam	b2v_IR6.W = 1;


registers	b2v_PC(
	.clk(clk),
	.reset(rst),
	.write_en(write_en_PC),
	.increment(increment_PC),
	.data(SYNTHESIZED_WIRE_19),
	.out(SYNTHESIZED_WIRE_7));
	defparam	b2v_PC.W = 16;


registers	b2v_TR(
	.clk(clk),
	.reset(rst),
	.write_en(write_en_TR),
	.increment(increment_TR),
	.data(SYNTHESIZED_WIRE_19),
	.out(SYNTHESIZED_WIRE_11));
	defparam	b2v_TR.W = 16;


endmodule
