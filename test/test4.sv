class test4 extends test;
`uvm_component_utils(test4);

function new(string s="",uvm_component pa);
super.new(s,pa);
endfunction



task run_phase(uvm_phase phase);
factory.set_type_override_by_type(seqt::get_type(),seqt4::get_type(),1);
phase.raise_objection(this);
su.start(en.ag1.sr);
#100;
phase.drop_objection(this);
endtask

endclass


