module scalar_product4(result, IX, IY);
   parameter SIZE_ARRAY = 256;
   parameter SIZE_INT = 32;

   parameter N1 = (SIZE_ARRAY / 2) + (SIZE_ARRAY % 2);
   parameter N2 = SIZE_ARRAY / 2;

   input [SIZE_INT-1:0] IX[SIZE_ARRAY-1:0];//tableau de 256 cellule de 32 bit
   input [SIZE_INT-1:0] IY[SIZE_ARRAY-1:0];//tableau de 256 cellule de 32 bit

   wire [SIZE_INT-1:0] result_tmp1;
   wire [SIZE_INT-1:0] result_tmp2;
   output [SIZE_INT-1:0] result;

   //toutes les operations ici sont parrallele
   //et s'executent en meme temps
   //ce sont des affectations continue
   if (SIZE_ARRAY == 1)
     assign result = IX[0] * IY[0];
   else if (SIZE_ARRAY > 1)
     begin
	scalar_product4 #(.SIZE_ARRAY(N1)) recall1(result_tmp1,
						   IX[SIZE_ARRAY-1:SIZE_ARRAY-N1],
						   IY[SIZE_ARRAY-1:SIZE_ARRAY-N1]);
	scalar_product4 #(.SIZE_ARRAY(N2)) recall2(result_tmp2,
						   IX[N2-1:0],
						   IY[N2-1:0]);
	assign result = result_tmp1 + result_tmp2;
     end
endmodule

