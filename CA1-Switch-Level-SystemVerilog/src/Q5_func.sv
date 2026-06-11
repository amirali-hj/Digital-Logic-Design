
`timescale 1ns/1ns

module Q5_func(input a1,a0,b1,b0,output g);
    
    wire b10,b01,a01;

    OAI_assign NOTb1(b1,b1,b1,b10);
    OAI_assign NOTb0(b0,b0,b0,b01);
    OAI_assign NOTa0(a0,a0,a0,a01);

    OAI_assign jout(a1,b10,b01,j);
    OAI_assign kout(a1,a1,b10,k);
    OAI_assign gout(a01,j,k,g);
    
    
endmodule