module fsm(
input clk,rst,
input [1:0]i,
output p,r);


parameter s0=2'b00,
			 s1=2'b01,
			 s2=2'b10;
			 
reg[1:0]pre_state,next_state;

always@(posedge clk)

if(rst)
	pre_state<=s0;
else
	pre_state<=next_state;
			 
always@(posedge clk)
begin
	case(pre_state)
	
		s0:begin
		case(i)
		2'b10:next_state=s1;   //1rs
		2'b11:next_state=s2;   //2rs
		default: next_state=s0;
		endcase
		end
		
		s1:begin
		case(i)
		2'b10:next_state=s2;
		2'b11:next_state=s0;
		default:next_state=s1;
		endcase
		end
		
		s2:begin
		case(i)
		2'b10:next_state=s0;
		2'b11:next_state=s0;
		default:next_state=s2;
		endcase
		end
		default:next_state=s0;
	endcase
end

assign p=(((pre_state==s1) && (i==2'b11)) ||((pre_state==s2)&&(i==2'b10)) || ((pre_state==s2)&&(i==2'b11)));
assign r=((pre_state==s2)&&(i==2'b11));

endmodule 
