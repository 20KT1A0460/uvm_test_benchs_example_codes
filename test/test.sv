class test extends uvm_test;
`uvm_component_utils(test);
sequ su;
env en;

function new(string s="",uvm_component pa);
super.new(s,pa);
endfunction



function void build_phase(uvm_phase phase);
su=sequ::type_id::create("su");
en=env::type_id::create("en",this);
endfunction

task run_phase(uvm_phase phase);
//factory.set_type_override_by_type(seqt::get_type(),seqt1::get_type(),1);
//factory.set_type_override_by_name("seqt","seqt1");
//factory.set_inst_override_by_type(seqt::get_type(),seqt1::get_type(),"*");
//factory.set_inst_override_by_name("seqt","seqt1","*");
phase.raise_objection(this);
su.start(en.ag1.sr);
#100;
phase.drop_objection(this);
endtask

function void end_of_elaboration_phase(uvm_phase phase);
uvm_top.print_topology();
factory.print();
endfunction

endclass

/*
class test1 extends test;
`uvm_component_utils(test1);

task run_phase(uvm_phase phase);
factory.set_type_override_by_type(seqt::get_type(),seqt1::get_type(),1);
phase.raise_objection(this);
su.start(en.ag1.sr);
#100;
phase.drop_objection(this);
endtask

endclass



class test2 extends test;
`uvm_component_utils(test2);

task run_phase(uvm_phase phase);
factory.set_type_override_by_type(seqt::get_type(),seqt2::get_type(),1);
phase.raise_objection(this);
su.start(en.ag1.sr);
#100;
phase.drop_objection(this);
endtask

endclass


class test3 extends test;
`uvm_component_utils(test3);

task run_phase(uvm_phase phase);
factory.set_type_override_by_type(seqt::get_type(),seqt3::get_type(),1);
phase.raise_objection(this);
su.start(en.ag1.sr);
#100;
phase.drop_objection(this);
endtask

endclass

class test4 extends test;
`uvm_component_utils(test4);

task run_phase(uvm_phase phase);
factory.set_type_override_by_type(seqt::get_type(),seqt4::get_type(),1);
phase.raise_objection(this);
su.start(en.ag1.sr);
#100;
phase.drop_objection(this);
endtask

endclass

class test5 extends test;
`uvm_component_utils(test5);

task run_phase(uvm_phase phase);
factory.set_type_override_by_type(seqt::get_type(),seqt5::get_type(),1);
phase.raise_objection(this);
su.start(en.ag1.sr);
#100;
phase.drop_objection(this);
endtask

endclass*/
