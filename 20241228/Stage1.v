module Stage1_64 #(
    parameter   WIDTH = 16
)(
    input  [(WIDTH*64)-1:0] x0_re,
    input  [(WIDTH*64)-1:0] x0_im,
    output  [(WIDTH*64)-1:0] x1_re,
    output  [(WIDTH*64)-1:0] x1_im
);

// in stage 1, 
// x1[i] = x0[i] + x0[i+32] 
// x1[i+32] = (x0[i] - x[i+32]) x twiddl[i]
// for i = 0 to 31 inclusive

genvar i;
generate
    for (i = 0; i < 32; i = i + 1) begin
        parameter [5:0] i_tw = i;
        ButterflyTW BF(
            .x0_re(x0_re[(i+33)*16-1:(i+32)*16]),
            .x0_im(x0_im[(i+33)*16-1:(i+32)*16]),
            .x1_re(x0_re[(i+1)*16-1:(i*16)]),
            .x1_im(x0_im[(i+1)*16-1:(i*16)]),
            .tw_addr(i_tw), // note that tw_addr and x are indexed differently
            .y0_re(x1_re[(i+33)*16-1:(i+32)*16]),
            .y0_im(x1_im[(i+33)*16-1:(i+32)*16]),
            .y1_re(x1_re[(i+1)*16-1:(i*16)]),
            .y1_im(x1_im[(i+1)*16-1:(i*16)])
        );
        
    end
endgenerate

endmodule
