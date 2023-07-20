//code comportemental
module scalar_product2(result, IX, IY);
   parameter SIZE_ARRAY = 256;
   parameter SIZE_INT = 32;
   parameter SIZE = SIZE_ARRAY * SIZE_INT;

   input [SIZE-1:0] IX;
   input [SIZE-1:0] IY;

   output reg[31:0] result;

   integer 	     i;//compteur de generation

   //ici les operations sont sequentiels
   //ce n'est pas parallele
   initial
     begin
	for (i=0 ; i<SIZE_ARRAY ; i = i+1)
	  result <= result + (IX[(i* SIZE_INT) +: 32]
			    * IY[(i* SIZE_INT) +: 32]);
     end
endmodule

