 `timescale 1fs/1fs
 `include "uvm_macros.svh"
  import  uvm_pkg::*;
 `include "uvm_my_macros.sv"

`include "seqt.sv"
`include "sequ.sv"
`include "seqr.sv"
`include "driv.sv"
`include "inmo.sv"
`include "agent1.sv"
`include "omr.sv"
`include "agent2.sv"
`include "scrb.sv"
`include "subsc.sv"
`include "env.sv"
`include "test.sv"
`include "test1.sv"
`include "test2.sv"
`include "test3.sv"
`include "test4.sv"
`include "test5.sv"
`include "interf.sv"
`include "fbadder.v"
`include "ass.sv"
module top;
fbadder dut (.a(in.a),.b(in.b),.cin(in.cin),.sum(in.sum),.carry(in.carry));
interf in();
interf2 in2();
fbadder bfm (.a(in2.a),.b(in2.b),.cin(in2.cin),.sum(in2.sum),.carry(in2.carry)); //bfm module
ass as(in);
initial begin
run_test("test");
end

initial begin
uvm_config_db#(virtual interf)::set(uvm_root::get(),"*.en*","interface",in);
end

initial begin
uvm_config_db#(virtual interf2)::set(uvm_root::get(),"*.en*","interface",in2);
end

endmodule
