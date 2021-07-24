module approx_mul_2X8(
    input wire [1:0]a,
    input wire [7:0]b,
	//output wire [8:0]p,pbar,
	//output wire [9:1]c,ov,
	output wire [9:0]myadder
    );
	
	wire [7:0]a0b,a1b;
	wire [8:0]p,pbar;
	wire [7:1]g;
	wire [9:1]c,ov;
	wire w,cd,cdbar;
	wire [9:0]w1,w2;
	
	//assign a0b = {1'b0,a0&b};
	and and0(a0b[0],a[0],b[0]);
	and and1(a0b[1],a[0],b[1]);
	and and2(a0b[2],a[0],b[2]);
	and and3(a0b[3],a[0],b[3]);
	and and4(a0b[4],a[0],b[4]);
	and and5(a0b[5],a[0],b[5]);
	and and6(a0b[6],a[0],b[6]);
	and and7(a0b[7],a[0],b[7]);

	
	//assign a1b = {a1&b,1'b0};
	and and8(a1b[0],a[1],b[0]);
	and and9(a1b[1],a[1],b[1]);
	and and10(a1b[2],a[1],b[2]);
	and and11(a1b[3],a[1],b[3]);
	and and12(a1b[4],a[1],b[4]);
	and and13(a1b[5],a[1],b[5]);
	and and14(a1b[6],a[1],b[6]);
	and and15(a1b[7],a[1],b[7]);
	
	//assign p = {1'b0,a0b|a1b};
	assign p[0] = a0b[0];
	or or1(p[1],a0b[1],a1b[0]);
	or or2(p[2],a0b[2],a1b[1]);
	or or3(p[3],a0b[3],a1b[2]);
	or or4(p[4],a0b[4],a1b[3]);
	or or5(p[5],a0b[5],a1b[4]);
	or or6(p[6],a0b[6],a1b[5]);
	or or7(p[7],a0b[7],a1b[6]);	
	assign p[8] = a1b[7];
	
	//assign g = {1'b0,a0b&a1b};
	//assign g[0] = 1'b0;
	and and16(g[1],a0b[1],a1b[0]);
	and and17(g[2],a0b[2],a1b[1]);
	and and18(g[3],a0b[3],a1b[2]);
	and and19(g[4],a0b[4],a1b[3]);
	and and20(g[5],a0b[5],a1b[4]);
	and and21(g[6],a0b[6],a1b[5]);
	and and22(g[7],a0b[7],a1b[6]);
	//assign g[8] = 1'b0;
	
	not not1(pbar[0],p[0]);
	not not2(pbar[1],p[1]);
	not not3(pbar[2],p[2]);
	not not4(pbar[3],p[3]);
	not not5(pbar[4],p[4]);
	not not6(pbar[5],p[5]);
	not not7(pbar[6],p[6]);
	not not8(pbar[7],p[7]);
	not not9(pbar[8],p[8]);
	
	//assign c[0]=1'b0;
	and and23(c[1],pbar[1],p[0]);
	and and24(c[2],pbar[2],p[1]);
	and and25(c[3],pbar[3],p[2]);
	and and26(c[4],pbar[4],p[3]);
	and and27(c[5],pbar[5],p[4]);
	and and28(c[6],pbar[6],p[5]);
	and and29(c[7],pbar[7],p[6]);
	and and30(c[8],pbar[8],p[7]);
	assign c[9]=p[8];
	
	//assign ps = p<<1;
	
	//assign c = (~p)&ps;
	
	//assign ov = c|g;
	//assign ov[0] = 1'b0;
	or or8(ov[1],c[1],g[1]);
	or or9(ov[2],c[2],g[2]);
	or or10(ov[3],c[3],g[3]);
	or or11(ov[4],c[4],g[4]);
	or or12(ov[5],c[5],g[5]);
	or or13(ov[6],c[6],g[6]);
	or or14(ov[7],c[7],g[7]);
	assign ov[8]=c[8];
	assign ov[9]=c[9];
	
	//assign cd = g[7]|g[6]|g[5];
	or or15(w,g[7],g[6]);
	or or16(cd,g[5],w);
	not not10(cdbar,cd);
	
	//assign myadder = ((~cond)&p)|(cond&ov);
	
	
	and and31(w1[0],cdbar,p[0]);
	and and32(w1[1],cdbar,p[1]);
	and and33(w1[2],cdbar,p[2]);
	and and34(w1[3],cdbar,p[3]);
	and and35(w1[4],cdbar,p[4]);
	and and36(w1[5],cdbar,p[5]);
	and and37(w1[6],cdbar,p[6]);
	and and38(w1[7],cdbar,p[7]);
	and and39(w1[8],cdbar,p[8]);
	
	and and41(w2[1],cd,ov[1]);
	and and42(w2[2],cd,ov[2]);
	and and43(w2[3],cd,ov[3]);
	and and44(w2[4],cd,ov[4]);
	and and45(w2[5],cd,ov[5]);
	and and46(w2[6],cd,ov[6]);
	and and47(w2[7],cd,ov[7]);
	and and48(w2[8],cd,ov[8]);
	and and49(w2[9],cd,ov[9]);
	
	assign myadder[0] = w1[0];
	or or17(myadder[1],w1[1],w2[1]);
	or or18(myadder[2],w1[2],w2[2]);
	or or19(myadder[3],w1[3],w2[3]);
	or or20(myadder[4],w1[4],w2[4]);
	or or21(myadder[5],w1[5],w2[5]);
	or or22(myadder[6],w1[6],w2[6]);
	or or23(myadder[7],w1[7],w2[7]);
	or or24(myadder[8],w1[8],w2[8]);
	assign myadder[9] = w2[9];
	
endmodule
