/*4 bit adder*/

module test_adder();
    reg clock;
    reg [31:0] config_data [0:49];

    wire [4:0] out;
    reg [3:0] A;
    reg [3:0] B;
    reg cin; 
    FPGA adder(.out(out),.A(A),.B(B),.c(cin),.d(1'b0),.clock(clock));

    wire [3:0] sum;
    wire cout;
    assign sum=out[3:0];
    assign cout=out[4];

    initial clock=0;
    always #10 clock=~clock;
    initial #1000 $finish;

    initial
    begin
        $readmemh("config_files/config_adder.mem",config_data);
        adder.L1.mem[31:0]=config_data[0];
        adder.L1.mem[32]=config_data[1];
        adder.L2.mem[31:0]=config_data[2];
        adder.L2.mem[32]=config_data[3];
        adder.L3.mem[31:0]=config_data[4];
        adder.L3.mem[32]=config_data[5];
        adder.L4.mem[31:0]=config_data[6];
        adder.L4.mem[32]=config_data[7];
        adder.L5.mem[31:0]=config_data[8];
        adder.L5.mem[32]=config_data[9];
        adder.L6.mem[31:0]=config_data[10];
        adder.L6.mem[32]=config_data[11];
        adder.L7.mem[31:0]=config_data[12];
        adder.L7.mem[32]=config_data[13];
        adder.L8.mem[31:0]=config_data[14];
        adder.L8.mem[32]=config_data[15];
        adder.L9.mem[31:0]=config_data[16];
        adder.L9.mem[32]=config_data[17];
        adder.L10.mem[31:0]=config_data[18];
        adder.L10.mem[32]=config_data[19];
        adder.L11.mem[31:0]=config_data[20];
        adder.L11.mem[32]=config_data[21];
        adder.L12.mem[31:0]=config_data[22];
        adder.L12.mem[32]=config_data[23];
        adder.L13_C.mem[31:0]=config_data[24];
        adder.L13_C.mem[32]=config_data[25];
        adder.L14_D.mem[31:0]=config_data[26];
        adder.L14_D.mem[32]=config_data[27];

        adder.S5.configure=config_data[28];
        adder.S6.configure=config_data[29];
        adder.S7.configure=config_data[30];
        adder.S8.configure=config_data[31];
        adder.S1cd.configure=config_data[32];
        adder.S1ab.configure=config_data[33];
        adder.S2cd.configure=config_data[34];
        adder.S2ab.configure=config_data[35];
        adder.S3cd.configure=config_data[36];
        adder.S3ab.configure=config_data[37];
        adder.S5dc.configure=config_data[38];
        adder.S6dc.configure=config_data[39];
        adder.S6b.configure=config_data[40];
        adder.S7dc.configure=config_data[41];
        adder.S7b.configure=config_data[42];
        adder.S8dc.configure=config_data[43];
        adder.S8b.configure=config_data[44];
        adder.S9dc.configure=config_data[45];
        adder.S10dc.configure=config_data[46];
        adder.S11dc.configure=config_data[47];
        adder.S12dc.configure=config_data[48];
        adder.carry.configure=config_data[49];
    end

    initial
    begin
        A=4'b1010;
        B=4'b0101;
        cin=1'b1;
        #20 $display("A= %b, B= %b, cin= %b ==> sum = %b, cout=%b",A,B,cin,sum,cout); 
        A=4'b1111;
        B=4'b0101;
        cin=1'b0;
        #20 $display("A= %b, B= %b, cin= %b ==> sum = %b, cout=%b",A,B,cin,sum,cout);
        A=4'b1011;
        B=4'b1100;
        cin=1'b0;
        #20 $display("A= %b, B= %b, cin= %b ==> sum = %b, cout=%b",A,B,cin,sum,cout);        
        A=4'b1111;
        B=4'b1111;
        cin=1'b1;
        #20 $display("A= %b, B= %b, cin= %b ==> sum = %b, cout=%b",A,B,cin,sum,cout);
        A=4'b1000;
        B=4'b0001;
        cin=1'b0;
        #20 $display("A= %b, B= %b, cin= %b ==> sum = %b, cout=%b",A,B,cin,sum,cout);
        A=4'b1110;
        B=4'b0101;
        cin=1'b1;
        #20 $display("A= %b, B= %b, cin= %b ==> sum = %b, cout=%b",A,B,cin,sum,cout);    
        A=4'b0000;
        B=4'b0000;
        cin=1'b0;
        #20 $display("A= %b, B= %b, cin= %b ==> sum = %b, cout=%b",A,B,cin,sum,cout);    
        A=4'b0110;
        B=4'b0110;
        cin=1'b1;
        #20 $display("A= %b, B= %b, cin= %b ==> sum = %b, cout=%b",A,B,cin,sum,cout);    
    end

    initial begin
        $dumpfile("vcd/adder.vcd");
        $dumpvars;
    end

endmodule