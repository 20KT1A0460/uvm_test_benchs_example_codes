class scrb extends uvm_scoreboard;
`uvm_component_utils(scrb)

`uvm_blocking_put_imp_decl(_1)
`uvm_blocking_put_imp_decl(_2)
seqt s[$],r[$];
seqt si,sm;

int t,q;
string result;

uvm_blocking_put_imp_1#(seqt,scrb) m1;
uvm_blocking_put_imp_2#(seqt,scrb) m2;
uvm_tlm_fifo#(seqt) f1;
uvm_tlm_fifo#(seqt) f2;

function new(string s="",uvm_component pa);
super.new(s,pa);
m1=new("m1",this);
m2=new("m2",this);
f1=new("f1",this);
f2=new("f2",this);

endfunction
function void build_phase(uvm_phase phase);
si=seqt::type_id::create("si");
sm=seqt::type_id::create("sm");
endfunction

task put_1(seqt se);
f1.put(se);
//s.push_back(se);
endtask

task put_2(seqt se1);
f2.put(se1);
//r.push_back(se1);
endtask

task run_phase(uvm_phase phase);
forever begin
f1.get(si);
f2.get(sm);
//wait(s.size>0&&r.size>0);
//if(s.size>0&&r.size>0)begin
    //si=s.pop_front();
   // sm=r.pop_front();
if(si.compare(sm))begin
    uvm_report_info("scrb","test_pass",100);
    si.print();
    sm.print();
   t=t+1;
    end
  else begin
      uvm_report_info("scrb","test_fail",100);
      si.print();
      sm.print();
      q=q+1;
      end
//end
end
endtask


function void extract_phase(uvm_phase phase);
$display("test_pass=%d",t,"test_fail=%d",q);
if (t==20 || t==19||t==18)
      result="PASS";
 else
     result="FAIl";


$display("result=%s",result);
    
endfunction


endclass
