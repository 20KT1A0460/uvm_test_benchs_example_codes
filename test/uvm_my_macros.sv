`define objnew\
        function new(string obj="");\
          super.new(obj);\
        endfunction\

`define compnew\
        function new(string obj="",uvm_component comp);\
          super.new(obj,comp);\
        endfunction\

 `define tlm_compnew(text)\
          function new(string obj="",uvm_component comp);\
          super.new(obj,comp);\
          txt\
         endfunction\

  `define run_phase(text)\
       task run_phase(uvm_phase phase);\
       text\
       endtask\

 `define build_phase(text)\
       function void build_phase(uvm_phase phase);\
       text\
       endfunction

  `define connect_phase(text)\
       function void connect_phase(uvm_phase phase);\
       text\
       endfunction

 `define  forever_begin(text)\
          forever begin\
          text\
          end\
  `define repeat_begin(arg,text)\
          repeat (arg)begin\
          text\
          end\
  `define initial_begin(text)\
          initial begin\
          text\
          end

  `define fac_obj(arg) \
      `uvm_object_utils(arg) \

  `define  fac_component(arg) \
      `uvm_component_utils(arg ) \
 



       






          




