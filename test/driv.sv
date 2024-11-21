class driv extends uvm_driver#(seqt);
`uvm_component_utils(driv)
seqt sq;

function new(string s="",uvm_component pa);
super.new(s,pa);
endfunction


virtual interf in; //dut interface
virtual interf2 in2;  //bfm interface

function void build_phase(uvm_phase phase);
sq=seqt::type_id::create("sq");
uvm_config_db#(virtual interf)::get(this,"","interface",in);
uvm_config_db#(virtual interf2)::get(this,"","interface",in2);
endfunction

task run_phase(uvm_phase phase);
forever begin
seq_item_port.get_next_item(sq);
in.a<=sq.a;
in2.a<=sq.a;
in.b<=sq.b;
in2.b<=sq.b;
in.cin<=sq.cin;
in2.cin<=sq.cin;
uvm_report_info("driver","driving to interface");
sq.print();
seq_item_port.item_done();
//seq_item_port.put(sq);
end
endtask


endclass
