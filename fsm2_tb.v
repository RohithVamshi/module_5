
module fsm2_tb( );

reg clk,arst;
reg [15:0]s_data;
reg s_valid,s_last;
wire s_ready;
reg [7:0]s_keep;
wire  [15:0] m_data;
wire m_valid,m_last;
reg m_ready;
wire [7:0]m_keep;
integer i;
reg rd_en;
reg [11:0]m, mem;
wire last;

fsm_2 instance1 (clk,arst,s_data,s_valid,s_last,s_ready,s_keep,m_data, m_valid,m_last,m_ready,m_keep,rd_en,mem,last);

initial
begin
forever #5 clk=~clk;
end

initial begin
clk=1;
arst=0;
m=0;
rd_en=0;
m_ready=0;
#5;arst=1;
#25;
m_ready=1;
mem=40;

for(i=0;i<=25;i=i+1)
 begin
s_data=$urandom;
s_valid=1;
if(i==10 | i==20)
s_last<=1;
else
s_last<=0;

#10;
end
end
initial begin

#25;s_keep<=7'd16;
#10;s_keep<=7'd16;
#10;s_keep<=7'd8;
#10;s_keep<=7'd4;
#10;s_keep<=7'd12;
#10;s_keep<=7'd16;
#10;s_keep<=7'd4;
#10;s_keep<=7'd8;
#10;s_keep<=7'd16;
end

initial begin
#80;
rd_en=1;
end
endmodule
