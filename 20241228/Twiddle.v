module Twiddle 
(
    input   [5:0]   addr,   
    output  [15:0]  tw_re,  
    output  [15:0]  tw_im   
);

wire[15:0]  wn_re[0:31];    
wire[15:0]  wn_im[0:31]; 

assign tw_re = wn_re[addr];
assign tw_im = wn_im[addr];

// fi(cos(-2*(0:32)*(1/64*pi)), 1, 16, 10)
assign  wn_re[00] = 16'b0000010000000000;
assign  wn_re[01] = 16'b0000001111111011;
assign  wn_re[02] = 16'b0000001111101100;
assign  wn_re[03] = 16'b0000001111010100;
assign  wn_re[04] = 16'b0000001110110010;
assign  wn_re[05] = 16'b0000001110000111;
assign  wn_re[06] = 16'b0000001101010011;
assign  wn_re[07] = 16'b0000001100011000;
assign  wn_re[08] = 16'b0000001011010100;
assign  wn_re[09] = 16'b0000001010001010;
assign  wn_re[10] = 16'b0000001000111001;
assign  wn_re[11] = 16'b0000000111100011;
assign  wn_re[12] = 16'b0000000110001000;
assign  wn_re[13] = 16'b0000000100101001;
assign  wn_re[14] = 16'b0000000011001000;
assign  wn_re[15] = 16'b0000000001100100;
assign  wn_re[16] = 16'b0000000000000000;
assign  wn_re[17] = 16'b1111111110011100;
assign  wn_re[18] = 16'b1111111100111000;
assign  wn_re[19] = 16'b1111111011010111;
assign  wn_re[20] = 16'b1111111001111000;
assign  wn_re[21] = 16'b1111111000011101;
assign  wn_re[22] = 16'b1111110111000111;
assign  wn_re[23] = 16'b1111110101110110;
assign  wn_re[24] = 16'b1111110100101100;
assign  wn_re[25] = 16'b1111110011101000;
assign  wn_re[26] = 16'b1111110010101101;
assign  wn_re[27] = 16'b1111110001111001;
assign  wn_re[28] = 16'b1111110001001110;
assign  wn_re[29] = 16'b1111110000101100;
assign  wn_re[30] = 16'b1111110000010100;
assign  wn_re[31] = 16'b1111110000000101;

// fi(sin(-2*(0:32)*(1/64*pi)), 1, 16, 10)
assign  wn_im[00] = 16'b0000000000000000;
assign  wn_im[01] = 16'b1111111110011100;
assign  wn_im[02] = 16'b1111111100111000;
assign  wn_im[03] = 16'b1111111011010111;
assign  wn_im[04] = 16'b1111111001111000;
assign  wn_im[05] = 16'b1111111000011101;
assign  wn_im[06] = 16'b1111110111000111;
assign  wn_im[07] = 16'b1111110101110110;
assign  wn_im[08] = 16'b1111110100101100;
assign  wn_im[09] = 16'b1111110011101000;
assign  wn_im[10] = 16'b1111110010101101;
assign  wn_im[11] = 16'b1111110001111001;
assign  wn_im[12] = 16'b1111110001001110;
assign  wn_im[13] = 16'b1111110000101100;
assign  wn_im[14] = 16'b1111110000010100;
assign  wn_im[15] = 16'b1111110000000101;
assign  wn_im[16] = 16'b1111110000000000;
assign  wn_im[17] = 16'b1111110000000101;
assign  wn_im[18] = 16'b1111110000010100;
assign  wn_im[19] = 16'b1111110000101100;
assign  wn_im[20] = 16'b1111110001001110;
assign  wn_im[21] = 16'b1111110001111001;
assign  wn_im[22] = 16'b1111110010101101;
assign  wn_im[23] = 16'b1111110011101000;
assign  wn_im[24] = 16'b1111110100101100;
assign  wn_im[25] = 16'b1111110101110110;
assign  wn_im[26] = 16'b1111110111000111;
assign  wn_im[27] = 16'b1111111000011101;
assign  wn_im[28] = 16'b1111111001111000;
assign  wn_im[29] = 16'b1111111011010111;
assign  wn_im[30] = 16'b1111111100111000;
assign  wn_im[31] = 16'b1111111110011100;

endmodule
