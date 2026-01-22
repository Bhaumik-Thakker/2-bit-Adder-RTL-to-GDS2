module adder_2bit (clk, a, b, sum, cout);
    input clk;
    input [1:0] a, b;
    output reg [1:0] sum;
    output reg cout;

    always @(posedge clk) begin
        {cout, sum} = a + b; // Directly compute sum and cout
    end
endmodule
