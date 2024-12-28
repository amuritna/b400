
module qmult #(
	parameter N = 16,
	parameter Q = 10
)
(
	 input		[N-1:0]	a,
	 input		[N-1:0]	b,
	 output     [N-1:0] q_result
);
	// Multiplication requires register of size 2N
	wire [2*N-1:0]	f_result;
	wire [N-1:0]	multiplicand, multiplier;
	wire [N-1:0]    a_2cmp, b_2cmp;
	wire [N-2:0]    quantized_result,quantized_result_2cmp;
	
	assign a_2cmp = {~a[N-1],~a[N-2:0]+ 1'b1};  //2's complement of a {(N-1){1'b1}} - 
	assign b_2cmp = {~b[N-1],~b[N-2:0]+ 1'b1};  //2's complement of b  {(N-1){1'b1}} - 
	
    assign multiplicand = (a[N-1]) ? a_2cmp : a;              
    assign multiplier   = (b[N-1]) ? b_2cmp : b;

	// Remove sign bit
    assign f_result = multiplicand[N-2:0] * multiplier[N-2:0];

	// Sign bit of output would be XOR or input sign bits
    assign q_result[N-1] = a[N-1]^b[N-1]; 

	// Quantization of output to required number of bits                    
    assign quantized_result = f_result[N-2+Q:Q];       

	// 2's complement of quantized_result  {(N-1){1'b1}} -        
    assign quantized_result_2cmp = ~quantized_result[N-2:0] + 1'b1;  

	// If negative result, return output in 2c representation
    assign q_result[N-2:0] = (a[N-1]^b[N-1]) ? quantized_result_2cmp : quantized_result; 

endmodule