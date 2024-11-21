class seqt extends uvm_sequence_item;
randc bit[3:0] a,b;
bit [3:0]sum;
bit carry;
rand bit cin;

constraint ab_con{a!=b;cin==0;};

`uvm_object_utils_begin(seqt)
`uvm_field_int(a,UVM_ALL_ON|UVM_DEC)
`uvm_field_int(b,UVM_ALL_ON|UVM_DEC)
`uvm_field_int(cin,UVM_ALL_ON|UVM_DEC)
`uvm_field_int(sum,UVM_ALL_ON|UVM_DEC)
`uvm_field_int(carry,UVM_ALL_ON|UVM_DEC)
`uvm_object_utils_end

`objnew

endclass

class seqt1 extends seqt;
`fac_obj(seqt1)
`objnew
constraint ab_con{a%2==0;b%2==1;cin==0;};

endclass  

class seqt2 extends seqt;
`fac_obj(seqt2)
`objnew
constraint ab_con{a%2==0;b%3==0;cin==0;};

endclass

class seqt3 extends seqt;
`fac_obj(seqt3)
`objnew
constraint ab_con{a!=b;cin==0;};

endclass


class seqt4 extends seqt;
`fac_obj(seqt4)
`objnew
constraint ab_con{a%2==0;b==0;cin==0;};

endclass

class seqt5 extends seqt;
`fac_obj(seqt5)
`objnew
constraint ab_con{a==0;b%3==0;cin==0;};

endclass


class seqt6 extends seqt;
`fac_obj(seqt6)
`objnew
constraint ab_con{a<b;cin==0;};

endclass

class seqt7 extends seqt;
`fac_obj(seqt7)
`objnew
constraint ab_con{a>b;cin==0;};

endclass
