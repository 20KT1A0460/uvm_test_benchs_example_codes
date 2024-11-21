class subsc extends uvm_subscriber#(seqt);
`uvm_component_utils(subsc)
seqt st;

covergroup c1;
a1:coverpoint st.a { bins b1 = { [0:$] } with (item % 2 == 0);}
a2:coverpoint st.b{bins b2={[0:15]};}
a3:coverpoint st.cin{bins b3={0};}
a4:coverpoint st.sum{bins b4={[0:15]};}
a5:coverpoint st.carry{bins b5={0,1};}
endgroup

function new(string en="",uvm_component pa);
super.new(en,pa);
c1=new();
st=new();
endfunction

function void write(seqt t);
st=t;
c1.sample();
endfunction


endclass
