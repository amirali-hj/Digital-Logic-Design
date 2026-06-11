`timescale 1ns/1ns
module Q7 #(parameter N=16)(input [0:N-1]A,B ,output GT,EQ);
	wire [0:N-2]gt,eq;
	genvar k,i;
	generate
		for(k=0 ; k<N/2 ; k=k+1)begin: C1B
			C1B C1(.a(A[2*k:2*k+1]),.b(B[2*k:2*k+1]),.GT(gt[k]),.EQ(eq[k]));
		end
		for(i=0 ; i<N/2-1 ; i=i+1)begin: GTEQ
			GTEQ C2(.gt(gt[2*i:2*i+1]),.eq(eq[2*i:2*i+1]),.GT(gt[N/2+i]),.EQ(eq[N/2+i]));
		end
	endgenerate
	assign GT = gt[N-2];
	assign EQ = eq[N-2];
endmodule

