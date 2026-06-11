

module counter_97(input cen , ld , input clk , rst , output co);
	
	logic [6:0] count;
	always@(posedge clk , posedge rst)begin 
		if(rst) count<=7'b0;
		else begin
			if (ld)
				count<=7'b0011111;
			else if (cen) count<=count+1;
		end
	end

	assign co = cen? &count : 1'b0;

endmodule
