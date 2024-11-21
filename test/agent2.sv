class agent2 extends uvm_agent;
`uvm_component_utils(agent2);

omr om;

`compnew


`build_phase(
om=omr::type_id::create("om",this);
)

endclass
