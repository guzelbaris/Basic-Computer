module ALU #(
        parameter integer W=16) (
    input [W-1:0] AC, 
    input [W-1:0] DR, 
    input E, 
    input [2:0] OP, 
    output reg [W-1:0] RES, 
    output reg CO, 
    output reg OVF, 
    output reg N, 
    output reg Z
);

always@(*) begin
    if (OP == 3'd0) begin
    RES <= AC + DR;
    CO <= ((AC[W-1] & DR[W-1]) | (AC[W-1] & ~RES[W-1]) | (~DR[W-1] & ~RES[W-1]));
    OVF <= ((~AC[W-1] & ~DR[W-1] & RES[W-1]) | (AC[W-1] & DR[W-1] & ~RES[W-1]));
    N <= RES[W-1];
    Z <= (RES == 0);
end
else if (OP == 3'd1) begin
    RES <= AC & DR;
    CO <= 0;
    OVF <= 0;
    N <= RES[W-1];
    Z <= (RES == 0);
end
else if (OP == 3'd2) begin
    RES <= DR;
    CO <= 0;
    OVF <= 0;
    N <= RES[W-1];
    Z <= (RES == 0);
end
else if (OP == 3'd3) begin
    RES <= ~AC;
    CO <= 0;
    OVF <= 0;
    N <= RES[W-1];
    Z <= (RES == 0);
end
else if (OP == 3'd4) begin
    case (E)
        0: RES <= AC;
        1: RES <= AC >> 1;
        2: RES <= AC >> 2;
        3: RES <= AC >> 3;
        // Add additional cases for larger values of E
    endcase
    CO <= AC[W-1];
    OVF <= 0;
    N <= RES[W-1];
    Z <= (RES == 0);
end

else if (OP == 3'd5) begin
    case (E)
        0: RES <= AC;
        1: RES <= AC << 1;
        2: RES <= AC << 2;
        3: RES <= AC << 3;
        // Add additional cases for larger values of E
    endcase
    CO <= AC[0];
    OVF <= 0;
    N <= RES[W-1];
    Z <= (RES == 0);
end


end

endmodule
