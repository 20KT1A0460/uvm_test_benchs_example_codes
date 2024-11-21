vlog top.sv +acc
transcript on simulation_results.log
vsim -assertdebug top  +UVM_TESTNAME=test   +UVM_TESTNAME=test1 +UVM_TESTNAME=test2 
add wave /top/dut/*
add wave /top/in/*
add wave /top/bfm/*
add wave /top/in2/*
add wave sim:/top/as/a1
add wave sim:/top/as/a2
add wave sim:/top/as/a3
add wave sim:/top/as/a4
add wave sim:/top/as/a5
run -all
transcript off

