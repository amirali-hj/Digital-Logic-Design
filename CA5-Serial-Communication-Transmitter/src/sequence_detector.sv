

module sequence_detector(input clk , rst , J , output logic detected);
	logic [2:0]ps , ns;
	logic inz , cen;
	logic [2:0]PI;
	wire co;
	parameter [2:0]A=3'b000 , B=3'b001 , C=3'b010 , D=3'b011;

	
    always @(posedge clk , posedge rst) begin
        if (rst)
            ps <= A;
        else
            ps <= ns;
    end

   
    always@(*)begin
        cen = 1'b0;
	inz = 1'b0;
	detected = 1'b0;
        case (ps)
            A: ns =  J ? B : A;
            B:begin  if(J) ns=B; else begin ns=C; inz=1'b1; end  end
            C:begin  cen=1'b1; if (co&J) ns = D;else if (co&~J) ns = A ; else if (~co&J) ns = B ; else ns = C ; end
            D:begin  detected = 1'b1; if (J) ns = B ; else begin ns = C ; inz = 1 ; end   end
            default: ns = A;
        endcase
    end
    
    always@(posedge clk , posedge rst)begin
	if(rst) PI <=3'b0;
	else if(inz) PI<= 3'b010;
	else if(cen) PI <= PI+1;
     end

     assign co = & PI;

endmodule