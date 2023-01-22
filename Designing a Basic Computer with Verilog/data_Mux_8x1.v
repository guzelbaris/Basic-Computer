module data_Mux_8x1 #(
	
	parameter W=16)(Selection,
	Input0,Input1,Input2,Input3,Input4,Input5,Input6,Input7,Output_res);
	
	input          [2:0] Selection; // to decide output
	input      [(W-1):0] Input0;
	input      [(W-1):0] Input1;
	input      [(W-1):0] Input2;
	input      [(W-1):0] Input3;
	input      [(W-1):0] Input4;
	input      [(W-1):0] Input5;
	input      [(W-1):0] Input6;
	input      [(W-1):0] Input7;
	output reg [(W-1):0] Output_res;
	
	always @(*)
	begin
	
		case (Selection)  
         3'd0 : Output_res = Input0;  
			3'd1 : Output_res = Input1;
			3'd2 : Output_res = Input2;
			3'd3 : Output_res = Input3; 
			3'd4 : Output_res = Input4;
			3'd5 : Output_res = Input5;
			3'd6 : Output_res = Input6;
			3'd7 : Output_res = Input7;
      endcase
	
	end

endmodule