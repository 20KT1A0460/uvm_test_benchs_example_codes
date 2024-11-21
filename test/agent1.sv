class agent1 extends uvm_agent;
`uvm_component_utils(agent1);
seqr sr;
driv dr;
inmo im;

`compnew

`build_phase(
sr=seqr::type_id::create("sr",this);
dr=driv::type_id::create("dr",this);
im=inmo::type_id::create("im",this);
)

`connect_phase(
dr.seq_item_port.connect(sr.seq_item_export);
)


endclass
