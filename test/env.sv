class env extends uvm_env;
`uvm_component_utils(env);
scrb sb;
agent1 ag1;
agent2 ag2;
subsc su;

function new(string s="",uvm_component pa);
super.new(s,pa);
endfunction



function void build_phase(uvm_phase phase);
sb=scrb::type_id::create("sb",this);
su=subsc::type_id::create("su",this);
ag1=agent1::type_id::create("ag1",this);
ag2=agent2::type_id::create("ag2",this);
endfunction

function void connect_phase(uvm_phase phase);
ag1.im.p1.connect(sb.m1);
ag2.om.p2.connect(sb.m2);
ag2.om.a1.connect(su.analysis_export);
endfunction



endclass
