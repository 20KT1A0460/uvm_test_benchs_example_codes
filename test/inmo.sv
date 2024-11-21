class inmo extends uvm_monitor;
`uvm_component_utils(inmo)
seqt sqin;
uvm_blocking_put_port#(seqt)p1;
function new(string s="",uvm_component pa);
super.new(s,pa);
p1=new("p1",this);
endfunction


virtual interf2 in2;

function void build_phase(uvm_phase phase);
uvm_config_db#(virtual interf2)::get(this,"","interface",in2);
endfunction

task run_phase(uvm_phase phase);
sqin=seqt::type_id::create("sqin");
forever begin
@(in2.a,in2.b,in2.cin);
sqin.a<=in2.a;
sqin.b<=in2.b;
sqin.cin<=in2.cin;
sqin.sum<=in2.sum;
sqin.carry<=in2.carry;
p1.put(sqin);
uvm_report_info("inmo","driving to scrb");
sqin.print();
end
endtask


endclass
