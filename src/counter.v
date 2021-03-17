/*modulo 16 counter*/
module test_counter();
    reg clock;
    reg [31:0] config_data [0:49];
    //A,B not required
    wire [4:0] out;
    reg [3:0] A;
    reg [3:0] B;
    reg c,d; 
    FPGA counter(.out(out),.A(A),.B(B),.c(c),.d(d),.clock(clock));

    wire [3:0]out_num;
    assign out_num=out[3:0];
    initial clock=0;
    always #10 clock=~clock;
    initial #1000 $finish;

    initial
    begin
        $readmemh("config_files/config_counter.mem",config_data);
        counter.L1.mem[31:0]=config_data[0];
        counter.L1.mem[32]=config_data[1];
        counter.L2.mem[31:0]=config_data[2];
        counter.L2.mem[32]=config_data[3];
        counter.L3.mem[31:0]=config_data[4];
        counter.L3.mem[32]=config_data[5];
        counter.L4.mem[31:0]=config_data[6];
        counter.L4.mem[32]=config_data[7];
        counter.L5.mem[31:0]=config_data[8];
        counter.L5.mem[32]=config_data[9];
        counter.L6.mem[31:0]=config_data[10];
        counter.L6.mem[32]=config_data[11];
        counter.L7.mem[31:0]=config_data[12];
        counter.L7.mem[32]=config_data[13];
        counter.L8.mem[31:0]=config_data[14];
        counter.L8.mem[32]=config_data[15];
        counter.L9.mem[31:0]=config_data[16];
        counter.L9.mem[32]=config_data[17];
        counter.L10.mem[31:0]=config_data[18];
        counter.L10.mem[32]=config_data[19];
        counter.L11.mem[31:0]=config_data[20];
        counter.L11.mem[32]=config_data[21];
        counter.L12.mem[31:0]=config_data[22];
        counter.L12.mem[32]=config_data[23];
        counter.L13_C.mem[31:0]=config_data[24];
        counter.L13_C.mem[32]=config_data[25];
        counter.L14_D.mem[31:0]=config_data[26];
        counter.L14_D.mem[32]=config_data[27];

        counter.S5.configure=config_data[28];
        counter.S6.configure=config_data[29];
        counter.S7.configure=config_data[30];
        counter.S8.configure=config_data[31];
        counter.S1cd.configure=config_data[32];
        counter.S1ab.configure=config_data[33];
        counter.S2cd.configure=config_data[34];
        counter.S2ab.configure=config_data[35];
        counter.S3cd.configure=config_data[36];
        counter.S3ab.configure=config_data[37];
        counter.S5dc.configure=config_data[38];
        counter.S6dc.configure=config_data[39];
        counter.S6b.configure=config_data[40];
        counter.S7dc.configure=config_data[41];
        counter.S7b.configure=config_data[42];
        counter.S8dc.configure=config_data[43];
        counter.S8b.configure=config_data[44];
        counter.S9dc.configure=config_data[45];
        counter.S10dc.configure=config_data[46];
        counter.S11dc.configure=config_data[47];
        counter.S12dc.configure=config_data[48];
        counter.carry.configure=config_data[49];

    end

    initial
    begin
        c=1'b1;
        d=1'b0;
        $display("increment");
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        c=1'b0;
        d=1'b1;
        $display("decrement");
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        c=1'b0;
        d=1'b0;
        $display("held constant");
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        c=1'b1;
        d=1'b0;
        $display("increment");
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
        #20 $display("count = %b",out_num);
    end

    initial begin
        $dumpfile("vcd/counter.vcd");
        $dumpvars;
    end

endmodule