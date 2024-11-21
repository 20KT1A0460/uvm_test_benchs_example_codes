class sequ extends uvm_sequence #(seqt);
seqt sq;
`uvm_object_utils(sequ)

`objnew

task body();
sq=seqt::type_id::create("sq");
repeat(20)begin
start_item(sq);
sq.randomize();
finish_item(sq);
#10;
end
endtask

endclass

/*
class sequ1 extends uvm_sequence#(seqt);
  `fac_obj(sequ1)
  `objnew
  seqt sq;
                     
  task body();
  repeat (20)begin
  `uvm_do(sq)
  #10;
  end
  endtask
endclass

class sequ2 extends uvm_sequence#(seqt);
  `fac_obj(sequ2)
  `objnew
  seqt sq;
                     
  task body();
   repeat (20)begin
    sq=seqt::type_id::create("sq");
    wait_for_grant();
    //start_item(sq);
    sq.randomize();
   // finish_item(sq);
    send_request(sq);
    wait_for_item_done();
    get_response(sq);
   #10;
  end
  endtask
endclass

class sequ3 extends uvm_sequence#(seqt);
  `fac_obj(sequ3)
  `objnew
  seqt sq;
                     
  task body();
  repeat (20)begin
  `uvm_create(sq)
  `uvm_rand_send(sq)
  #10;
  end
  endtask
endclass


class sequ4 extends uvm_sequence#(seqt);
  `fac_obj(sequ4)
  `objnew
  seqt sq;
                     
  task body();
  repeat (20)begin
  `uvm_create(sq)
  `uvm_rand_send_with(sq,{sq.cin==0;})
  #10;
  end
  endtask
endclass


class sequ5 extends uvm_sequence#(seqt);
  `fac_obj(sequ5)
  `objnew
  seqt sq;
                     
  task body();
  repeat (20)begin
  `uvm_do_with(sq,{sq.cin==0;})
  #10;
  end
  endtask
endclass

class sequ6 extends uvm_sequence#(seqt);
  `fac_obj(sequ6)
  `objnew
  seqt sq;
                     
  task body();
  repeat (20)begin
  `uvm_do_pri(sq,10)
  #10;
  end
  endtask
endclass 

class sequ7 extends uvm_sequence#(seqt);
  `fac_obj(sequ7)
  `objnew
  seqt sq;
                     
  task body();
  repeat (20)begin
  `uvm_do_pri_with(sq,10,{sq.cin==0;})
  #10;
  end
  endtask
endclass


class sequ8 extends uvm_sequence#(seqt);
  `fac_obj(sequ8)
  `objnew
  seqt sq;
                     
  task body();
  repeat (20)begin
  `uvm_create(sq)
   sq.randomize();
   `uvm_send(sq)
  #10;
  end
  endtask
endclass

class sequ9 extends uvm_sequence#(seqt);
  `fac_obj(sequ10)
  `objnew
  seqt sq;
                     
  task body();
  repeat (20)begin
  `uvm_create(sq)
  sq.randomize();
  `uvm_send_pri(sq,10)
  #10;
  end
  endtask
endclass

class sequ10 extends uvm_sequence#(seqt);
  `fac_obj(sequ10)
  `objnew
  seqt sq;
                     
  task body();
  repeat (20)begin
  `uvm_create(sq)
  `uvm_rand_send_pri_with(sq,10,{sq.cin==0;})
  #10;
  end
  endtask
endclass */

