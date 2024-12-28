module Multiply #(
    parameter   WIDTH = 16
)(
    input   signed  [WIDTH-1:0] a_re,
    input   signed  [WIDTH-1:0] a_im,
    input   signed  [WIDTH-1:0] b_re,
    input   signed  [WIDTH-1:0] b_im,
    output  signed  [WIDTH-1:0] m_re,
    output  signed  [WIDTH-1:0] m_im
);

wire signed [WIDTH-1:0]   ar_x_br, ar_x_bi, ai_x_br, ai_x_bi;

// fixed point multiplication
qmult qm_ar_br (
    .a(a_re),
    .b(b_re),
    .q_result(ar_x_br)
);

qmult qm_ar_bi (
    .a(a_re),
    .b(b_im),
    .q_result(ar_x_bi)
);

qmult qm_ai_br (
    .a(a_im),
    .b(b_re),
    .q_result(ai_x_br)
);

qmult qm_ai_bi (
    .a(a_im),
    .b(b_im),
    .q_result(ai_x_bi)
);

assign  m_re = ar_x_br - ai_x_bi;
assign  m_im = ar_x_bi + ai_x_br;

endmodule
