/*8:3 encoder*/

module test_encoder();
    reg clock;
    reg [31:0] config_data [0:49];

    wire [4:0] out;
    wire [3:0] A;
    wire [3:0] B;
    reg c,d;
    wire [2:0] OUT;
    reg [7:0] IN; 
    FPGA encoder(.out(out),.A(A),.B(B),.c(c),.d(1'b0),.clock(clock));

    assign A=IN[3:0];
    assign B=IN[7:4];
    assign OUT=out[2:0];
    initial clock=0;
    always #10 clock=~clock;
    initial #1000 $finish;

    initial
    begin
        $readmemh("config_files/config_encoder.mem",config_data);
        encoder.L1.mem[31:0]=config_data[0];
        encoder.L1.mem[32]=config_data[1];
        encoder.L2.mem[31:0]=config_data[2];
        encoder.L2.mem[32]=config_data[3];
        encoder.L3.mem[31:0]=config_data[4];
        encoder.L3.mem[32]=config_data[5];
        encoder.L4.mem[31:0]=config_data[6];
        encoder.L4.mem[32]=config_data[7];
        encoder.L5.mem[31:0]=config_data[8];
        encoder.L5.mem[32]=config_data[9];
        encoder.L6.mem[31:0]=config_data[10];
        encoder.L6.mem[32]=config_data[11];
        encoder.L7.mem[31:0]=config_data[12];
        encoder.L7.mem[32]=config_data[13];
        encoder.L8.mem[31:0]=config_data[14];
        encoder.L8.mem[32]=config_data[15];
        encoder.L9.mem[31:0]=config_data[16];
        encoder.L9.mem[32]=config_data[17];
        encoder.L10.mem[31:0]=config_data[18];
        encoder.L10.mem[32]=config_data[19];
        encoder.L11.mem[31:0]=config_data[20];
        encoder.L11.mem[32]=config_data[21];
        encoder.L12.mem[31:0]=config_data[22];
        encoder.L13_C.mem[31:0]=config_data[24];
        encoder.L13_C.mem[32]=config_data[25];
        encoder.L14_D.mem[31:0]=config_data[26];
        encoder.L14_D.mem[32]=config_data[27];

        encoder.S5.configure=config_data[28];
        encoder.S6.configure=config_data[29];
        encoder.S7.configure=config_data[30];
        encoder.S8.configure=config_data[31];
        encoder.S1cd.configure=config_data[32];
        encoder.S1ab.configure=config_data[33];
        encoder.S2cd.configure=config_data[34];
        encoder.S2ab.configure=config_data[35];
        encoder.S3cd.configure=config_data[36];
        encoder.S3ab.configure=config_data[37];
        encoder.S5dc.configure=config_data[38];
        encoder.S6dc.configure=config_data[39];
        encoder.S6b.configure=config_data[40];
        encoder.S7dc.configure=config_data[41];
        encoder.S7b.configure=config_data[42];
        encoder.S8dc.configure=config_data[43];
        encoder.S8b.configure=config_data[44];
        encoder.S9dc.configure=config_data[45];
        encoder.S10dc.configure=config_data[46];
        encoder.S11dc.configure=config_data[47];
        encoder.S12dc.configure=config_data[48];
        encoder.carry.configure=config_data[49];
    end

    initial
    begin
        IN=8'b00000001;
        #20 $display("In- %b, out- %b",IN,OUT); 
        IN=8'b00000010;
        #20 $display("In- %b, out- %b",IN,OUT); 
        IN=8'b00000100;
        #20 $display("In- %b, out- %b",IN,OUT); 
        IN=8'b00001000;
        #20 $display("In- %b, out- %b",IN,OUT); 
        IN=8'b00010000;
        #20 $display("In- %b, out- %b",IN,OUT); 
        IN=8'b00100000;
        #20 $display("In- %b, out- %b",IN,OUT); 
        IN=8'b01000000;
        #20 $display("In- %b, out- %b",IN,OUT); 
        IN=8'b10000000;
        #20 $display("In- %b, out- %b",IN,OUT); 
    end

    initial begin
        $dumpfile("vcd/encoder.vcd");
        $dumpvars;
    end

endmodule