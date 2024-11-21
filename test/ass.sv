module ass(interf in);
property p1;
@(in.a,in.b)in.cin==0;
endproperty

property p2;
@(in.a,in.b)in.a inside{[0:15]};
endproperty

property p3;
@(in.a,in.b)in.b inside{[0:15]};
endproperty

property p4;
@(in.a,in.b)in.sum inside{[0:15]};
endproperty

property p5;
@(in.a,in.b)in.carry inside{0,1};
endproperty

a1:assert property(p1);
a2:assert property(p2);
a3:assert property(p3);
a4:assert property(p4);
a5:assert property(p5);

endmodule
