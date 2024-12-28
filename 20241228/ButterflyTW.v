module ButterflyTW #(
    parameter   WIDTH = 16
)(
    input   signed  [WIDTH-1:0] x0_re,  //  Input Data #0 (Real)
    input   signed  [WIDTH-1:0] x0_im,  //  Input Data #0 (Imag)
    input   signed  [WIDTH-1:0] x1_re,  //  Input Data #1 (Real)
    input   signed  [WIDTH-1:0] x1_im,  //  Input Data #1 (Imag)
    input           [5:0]       tw_addr,
    output  signed  [WIDTH-1:0] y0_re,  //  Output Data #0 (Real)
    output  signed  [WIDTH-1:0] y0_im,  //  Output Data #0 (Imag)
    output  signed  [WIDTH-1:0] y1_re,  //  Output Data #1 (Real)
    output  signed  [WIDTH-1:0] y1_im   //  Output Data #1 (Imag)
);

wire signed [WIDTH-1:0]   add_re, add_im, sub_re, sub_im, twout_re, twout_im, sub_prod_re, sub_prod_im;

Twiddle tw (
    .addr(tw_addr),
    .tw_re(twout_re),
    .tw_im(twout_im)
);

assign  add_re = x0_re + x1_re;
assign  add_im = x0_im + x1_im;
assign  sub_re = x0_re - x1_re;
assign  sub_im = x0_im - x1_im;

Multiply mult (
    .a_re(sub_re[WIDTH-1:0]),
    .a_im(sub_im[WIDTH-1:0]),
    .b_re(twout_re),
    .b_im(twout_im),
    .m_re(sub_prod_re),
    .m_im(sub_prod_im)
);

assign  y0_re = add_re[WIDTH-1:0];
assign  y0_im = add_im[WIDTH-1:0];
assign  y1_re = sub_prod_re[WIDTH-1:0];
assign  y1_im = sub_prod_im[WIDTH-1:0];

endmodule
