/*r-rishabh-j*/								
/*4 bit adder,8:3 encoder, 4 bit counter*/

/*DELAYS HAVE NOT BEEN INCLUDED*/

module switch_box_4x4(out, in);

    input [3:0] in;
    output [3:0] out;
    reg [15:0] configure;    
    assign out[0] = (configure[0]&&in[0]) || (configure[1]&& in[1]) || (configure[2]&&in[2]) || (configure[3]&&in[3]); 
    assign out[1] = (configure[4]&&in[0]) || (configure[5]&& in[1]) || (configure[6]&&in[2]) || (configure[7]&&in[3]); 
    assign out[2] = (configure[8]&&in[0]) || (configure[9]&& in[1]) || (configure[10]&&in[2]) || (configure[11]&&in[3]); 
    assign out[3] = (configure[12]&&in[0]) || (configure[13]&& in[1]) || (configure[14]&&in[2]) || (configure[15]&&in[3]); 
endmodule

module mux_2_to_1(out,inp1,inp2,select); 
    input inp1,inp2,select;
    output out;
    assign  out = (inp1&&(~select)) || (inp2&&select); /*least significant to complement*/
endmodule

module logic_tile(out, clock, in1, in2, in3, in4, in5); 

    input in1,in2,in3,in4,in5,clock;
    output out;
    reg [32:0] mem;
    wire [15:0] level1;
    wire [7:0] level2;
    wire [3:0] level3;
    wire [1:0] level4;
    wire D;
    reg Q, Qbar;
    /*32 : 1 MUX (designed in 5 stages)*/
    genvar i;
    generate
        for(i=0;i<16;i=i+1)
        begin: level1_l
            mux_2_to_1 _(level1[i],mem[2*i],mem[2*i+1],in1);
        end
    endgenerate
    genvar q;
    generate
        for(q=0;q<8;q=q+1)
        begin: level1_2
            mux_2_to_1 _(level2[q],level1[2*q],level1[2*q+1],in2);
        end
    endgenerate
    genvar r;
    generate
        for(r=0;r<4;r=r+1)
        begin: level1_3
            mux_2_to_1 _(level3[r],level2[2*r],level2[2*r+1],in3);
        end
    endgenerate
    genvar t;
    generate
        for(t=0;t<2;t=t+1)
        begin: level1_4
            mux_2_to_1 _(level4[t],level3[2*t],level3[2*t+1],in4);
        end
    endgenerate
    mux_2_to_1  finally(D,level4[0],level4[1],in5);

    initial
    begin
    Q=0;    
    end 
    
    /*D-flip flop*/
    always @(posedge clock)
    begin
        Q <= D; 
        Qbar <= !D;
    end
    /*2:1 MUX*/
    mux_2_to_1 ENDD(out,D,Q,mem[32]);
endmodule

module FPGA(out,A,B,c,d,clock);
    output [4:0] out;//5th (out[4]) for carry bit, first 4 for adder, counter, 0->2 for encoder
    input c,d,clock; //and c,d for counter, c for carry in.
    input [3:0] A, B; //adder bits, encoder inputs A[0]->B[3];
    wire C,D;
    wire [11:0] L_out; //index=LUT no-1, c and d not here.
    wire [4:0] L1_in; //inputs to all LUTs.
    wire [4:0] L2_in;
    wire [4:0] L3_in;
    wire [4:0] L4_in;
    wire [4:0] L5_in;
    wire [4:0] L6_in;
    wire [4:0] L7_in;
    wire [4:0] L8_in;
    wire [4:0] L9_in;
    wire [4:0] L10_in;
    wire [4:0] L11_in;
    wire [4:0] L12_in;
    wire [4:0] L13_in;
    wire [4:0] L14_in;
    wire [3:0] S1_out;

    wire [3:0] S1_t;
    wire [3:0] S2_t;
    wire [3:0] S3_t;
    wire [1:0] S5_t;
    wire [1:0] S6_t;
    wire [2:0] S6b_t;
    wire [1:0] S7_t;
    wire [2:0] S7b_t;
    wire [1:0] S8_t;
    wire [2:0] S8b_t;
    wire [1:0] S9_t;
    wire [1:0] S10_t;
    wire [1:0] S11_t;
    wire [1:0] S12_t;
    wire [7:0] SwDp;

    logic_tile L1(L_out[0],clock,L1_in[0],L1_in[1],L1_in[2],L1_in[3],1'b0);    
    logic_tile L2(L_out[1],clock,L2_in[0],L2_in[1],L2_in[2],L2_in[3],1'b0);     
    logic_tile L3(L_out[2],clock,L3_in[0],L3_in[1],L3_in[2],L3_in[3],1'b0);     
    logic_tile L4(L_out[3],clock,L5_in[4],L6_in[4],L7_in[4],L8_in[4],1'b0);    

    logic_tile L5(L_out[4],clock,D,C,L5_in[2],L5_in[3],L5_in[4]);    
    logic_tile L6(L_out[5],clock,D,L6_in[1],L6_in[2],L6_in[3],L6_in[4]);
    logic_tile L7(L_out[6],clock,D,L7_in[1],L7_in[2],L7_in[3],L7_in[4]);
    logic_tile L8(L_out[7],clock,D,L8_in[1],L8_in[2],L8_in[3],L8_in[4]);

    logic_tile L9(L_out[8],clock,L5_in[4],L6_in[4],L9_in[2],L9_in[3],C);  
    logic_tile L10(L_out[9],clock,L5_in[4],L6_in[4],L10_in[2],L10_in[3],L_out[8]);
    logic_tile L11(L_out[10],clock,L5_in[4],L6_in[4],L11_in[2],L11_in[3],L_out[9]);
    logic_tile L12(L12_in[0],clock,L5_in[4],L6_in[4],L12_in[2],L12_in[3],L_out[10]);

    logic_tile L13_C(C,clock,c,1'b0,1'b0,1'b0,1'b0); 
    logic_tile L14_D(D,clock,d,1'b0,1'b0,1'b0,1'b0); 

    //S<no> are connected to output of LUT
    
    switch_box_4x4 S5({SwDp[1:0],L5_in[4],out[0]}, {1'b0,1'b0,L_out[0],L_out[4]});  //S5 to S8 latched in counter, xor in adder, 1st stage 2:1 mux 
    switch_box_4x4 S6({SwDp[3:2],L6_in[4],out[1]}, {1'b0,1'b0,L_out[1],L_out[5]});  
    switch_box_4x4 S7({SwDp[5:4],L7_in[4],out[2]}, {1'b0,1'b0,L_out[2],L_out[6]});  //inputs are from increm LUT and store LUTs.
    switch_box_4x4 S8({SwDp[7:6],L8_in[4],out[3]}, {1'b0,1'b0,1'b0,L_out[7]});

    //used in encoder and counter to switch between A or O
    switch_box_4x4 S1cd({S1_t[3:2],L1_in[3],L1_in[2]},{L8_in[4],A[1],L7_in[4],A[3]});  //btw ports c and d
    switch_box_4x4 S1ab({S1_t[1:0],L1_in[1],L1_in[0]},{L6_in[4],B[1],L5_in[4],B[3]});  //btw ports a and b

    //used in encoder and counter to switch between A or O
    switch_box_4x4 S2cd({S2_t[3:2],L2_in[3],L2_in[2]},{L8_in[4],A[2],L7_in[4],A[3]}); //btw ports c and d
    switch_box_4x4 S2ab({S2_t[1:0],L2_in[1],L2_in[0]},{L6_in[4],B[2],L5_in[4],B[3]});  //btw ports a and b

    //used in encoder and counter to switch between A or O
    switch_box_4x4 S3cd({S3_t[3:2],L3_in[3],L3_in[2]},{L8_in[4],B[0],L7_in[4],B[1]});  //btw ports c and d
    switch_box_4x4 S3ab({S3_t[1:0],L3_in[1],L3_in[0]},{L6_in[4],B[2],L5_in[4],B[3]}); //btw ports a and b

    //used in counter and adder to switch between A or O
    switch_box_4x4 S5dc({S5_t,L5_in[3],L5_in[2]},{L_out[0],A[0],L_out[8],B[0]});
    
    //used in counter and adder to switch between A or O
    switch_box_4x4 S6dc({S6_t,L6_in[3],L6_in[2]},{L_out[1],A[1],L_out[9],B[1]});
    //used in counter and adder to switch between carry and c
    switch_box_4x4 S6b({S6b_t,L6_in[1]},{1'b0,1'b0,L_out[8],C});
    
    //used in counter and adder to switch between A or O
    switch_box_4x4 S7dc({S7_t,L7_in[3],L7_in[2]},{L_out[2],A[2],L_out[10],B[2]});
    //used in counter and adder to switch between carry and c
    switch_box_4x4 S7b({S7b_t,L7_in[1]},{1'b0,1'b0,L_out[9],C});
    
    //used in counter and adder to switch between A or O
    switch_box_4x4 S8dc({S8_t,L8_in[3],L8_in[2]},{L_out[3],A[3],L_out[11],B[3]});
    //used in counter and adder to switch between carry and c
    switch_box_4x4 S8b({S8b_t,L8_in[1]},{1'b0,1'b0,L_out[10],C});
    
    //used in counter and adder to switch between A or O
    switch_box_4x4 S9dc({S9_t,L9_in[3],L9_in[2]},{L_out[7],A[0],L_out[6],B[0]});
    
    //used in counter and adder to switch between A or O
    switch_box_4x4 S10dc({S10_t,L10_in[3],L10_in[2]},{L_out[7],A[1],L_out[6],B[1]});
    
    //used in counter and adder to switch between A or O
    switch_box_4x4 S11dc({S11_t,L11_in[3],L11_in[2]},{L_out[7],A[2],L_out[6],B[2]});
    
    //used in counter and adder to switch between A or O
    switch_box_4x4 S12dc({S12_t,L12_in[3],L12_in[2]},{L_out[7],A[3],L_out[6],B[3]});
    
    wire [1:0] ct;
    switch_box_4x4 carry({ct,out[4],L_out[11]},{1'b0,1'b0,1'b0,L12_in[0]}); //switch  box to take carry out in adder.
    
endmodule
