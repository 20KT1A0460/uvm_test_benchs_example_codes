# Help section
help:
	@echo "======================================================================";
	@echo "Usage:"; 
	@echo "  > make regress          - run all tests & generate summary";
	@echo "  > make test_index       - run individual test [see list below]";
	@echo "  > make clean            - run CLEAN script";
	@echo "  > make summary          - run generate_summary.py  loads each test result into summary.text gives report as PASS or FAIL  ";
	@echo "    -----------------------------------------";
	@echo "    test_index      test_name";
	@echo "    -----------------------------------------";
	@echo "    1              test";
	@echo "    2              test1";
	@echo "    3              test2";
	@echo "    4              test3";
	@echo "    5              test4";
	@echo "    6              test5";
	@echo "======================================================================";

# Variables
TOP_FILE = top.sv
TOP_MODULE = top  
WORK_DIR = work

# Main target: Run all tests and generate summary
regress: alltest summary 

# Run all tests
alltest: test test1 test2 test3 test4 test5

# Create work library
lib:
	vlib $(WORK_DIR)
	vmap work $(WORK_DIR)

# Compile the design
compile: lib
	vlog -work $(WORK_DIR) $(TOP_FILE) +acc
	

# Run the simulation for all test cases
test: compile
	vsim -assertdebug $(TOP_MODULE) +UVM_TESTNAME=$@ -do "add wave /top/dut/*; add wave /top/in/*; add wave /top/bfm/*; add wave /top/in2/*; \
	add wave sim:/top/as/a1; add wave sim:/top/as/a2; add wave sim:/top/as/a3; add wave sim:/top/as/a4; add wave sim:/top/as/a5; run -all; \
	write transcript $@.log ; "
 

# Run the simulation for individual test cases
test1: compile
	vsim -assertdebug $(TOP_MODULE) +UVM_TESTNAME=$@ -do "add wave /top/dut/*; add wave /top/in/*; add wave /top/bfm/*; add wave /top/in2/*; \
	add wave sim:/top/as/a1; add wave sim:/top/as/a2; add wave sim:/top/as/a3; add wave sim:/top/as/a4; add wave sim:/top/as/a5; run -all;\
	write transcript $@.log ; " 

test2: compile
	vsim -assertdebug $(TOP_MODULE) +UVM_TESTNAME=$@ -do "add wave /top/dut/*; add wave /top/in/*; add wave /top/bfm/*; add wave /top/in2/*; \
	add wave sim:/top/as/a1; add wave sim:/top/as/a2; add wave sim:/top/as/a3; add wave sim:/top/as/a4; add wave sim:/top/as/a5; run -all;\
	write transcript $@.log ; "

test3: compile
	vsim -assertdebug $(TOP_MODULE) +UVM_TESTNAME=$@ -do "add wave /top/dut/*; add wave /top/in/*; add wave /top/bfm/*; add wave /top/in2/*; \
	add wave sim:/top/as/a1; add wave sim:/top/as/a2; add wave sim:/top/as/a3; add wave sim:/top/as/a4; add wave sim:/top/as/a5; run -all;\
	write transcript $@.log ; "

test4: compile
	vsim -assertdebug $(TOP_MODULE) +UVM_TESTNAME=$@ -do "add wave /top/dut/*; add wave /top/in/*; add wave /top/bfm/*; add wave /top/in2/*; \
	add wave sim:/top/as/a1; add wave sim:/top/as/a2; add wave sim:/top/as/a3; add wave sim:/top/as/a4; add wave sim:/top/as/a5; run -all;\
	write transcript $@.log ; "

test5: compile
	vsim -assertdebug $(TOP_MODULE) +UVM_TESTNAME=$@ -do "add wave /top/dut/*; add wave /top/in/*; add wave /top/bfm/*; add wave /top/in2/*; \
	add wave sim:/top/as/a1; add wave sim:/top/as/a2; add wave sim:/top/as/a3; add wave sim:/top/as/a4; add wave sim:/top/as/a5; run -all;\
	write transcript $@.log ; "

# Clean up build files
clean:
	if exist $(WORK_DIR) (rmdir /s /q $(WORK_DIR))
	del /q transcript vsim.wlf *.log modelsim.ini summary.txt  2>nul

summary:
	python	generate_summary.py
