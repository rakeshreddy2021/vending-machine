module fsm_tb();
reg clk,rst;
reg [1:0]i;
wire p,r;

fsm UUT(clk,rst,i,p,r);

initial 
begin
clk=0;
forever #10 clk=~clk;
end

task data(input [1:0]k);
begin
//@(negedge clk)
 #10 i=k;
//@(negedge clk)
// #10 i=0;
end
endtask

task reset();
begin
@(negedge clk)
rst=1'b1;
@(negedge clk)
rst=1'b0;
end
endtask

initial 
begin
	reset;
	#10 data(2'b11);
	#10 data(2'b10);
	#10 reset;
	#10 data(2'b11);
	#10 data(2'b11);
	#10 reset;
	#10 data(2'b10);
	#10 data(2'b10);
	#10 data(2'b10);
end
endmodule 
