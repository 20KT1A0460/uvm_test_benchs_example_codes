class omr extends uvm_monitor;
`uvm_component_utils(omr)
seqt sqom;
uvm_blocking_put_port#(seqt)p2;
uvm_analysis_port#(seqt) a1;
function new(string s="",uvm_component pa);
super.new(s,pa);
p2=new("p2",this);
a1=new("a1",this);
endfunction


virtual interf in;

function void build_phase(uvm_phase phase);
uvm_config_db#(virtual interf)::get(this,"","interface",in);
endfunction

task run_phase(uvm_phase phase);
sqom=seqt::type_id::create("sqom");
forever begin
@(in.sum,in.carry);
sqom.a<=in.a;
sqom.b<=in.b;
sqom.cin<=in.cin;
sqom.sum<=in.sum;
sqom.carry<=in.carry;
p2.put(sqom);
a1.write(sqom);
uvm_report_info("omr","driving to scrb");
sqom.print();
end
endtask


endclass
