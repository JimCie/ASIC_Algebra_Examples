//code structurel
//sauf le assign r = x * y
module scalar_product1(result, IX, IY);
   parameter SIZE_ARRAY = 256;
   parameter SIZE_INT = 32;
   parameter SIZE = SIZE_ARRAY * SIZE_INT;

   parameter N1 = (SIZE_ARRAY / 2) + (SIZE_ARRAY % 2);
   parameter N2 = SIZE_ARRAY / 2;

   input [SIZE-1:0] IX;//bus de 256 * 32 bit
   input [SIZE-1:0] IY;//bus de 256 * 32 bit

   wire [SIZE_INT-1:0] result_tmp1;
   wire [SIZE_INT-1:0] result_tmp2;
   output [SIZE_INT-1:0] result;

   //toutes les operations ici sont parrallele
   //et s'executent en meme temps
   //ce sont des affectations continue
   if (SIZE_ARRAY == 1)
     assign result[SIZE_INT-1:0] = IX[SIZE_INT-1:0] * IY[SIZE_INT-1:0];
   else if (SIZE_ARRAY > 1)
     begin
	scalar_product1 #(.SIZE_ARRAY(N1)) recall1(result_tmp1,
						  IX[SIZE-1:SIZE-(N1 * SIZE_INT)],
						  IY[SIZE-1:SIZE-(N1 * SIZE_INT)]);
	scalar_product1 #(.SIZE_ARRAY(N2)) recall2(result_tmp2,
						  IX[(N2*SIZE_INT)-1:0],
						  IY[(N2*SIZE_INT)-1:0]);
	assign result = result_tmp1 + result_tmp2;
     end
endmodule // scalar_product1
