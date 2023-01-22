module Register_sync_rw #(
     parameter WIDTH=4)
    (
	  input  clk, reset,write,
	  input	[WIDTH-1:0] DATA,
	  output reg [WIDTH-1:0] A
    );
	 
always@(posedge clk) begin
	case(reset)
	1'b0:begin
		if(write==1'b1)
			A<=DATA;
	end
	1'b1:A<=0;
	default:A<=0;
	endcase

end
	 
endmodule	 