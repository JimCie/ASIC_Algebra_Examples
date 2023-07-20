//structurel simple
//simple exemple
module scalar_product3(result, IX, IY);
   parameter SIZE_ARRAY = 4;
   parameter SIZE_INT = 32;
   parameter SIZE = SIZE_ARRAY * SIZE_INT;

   input [SIZE-1:0] IX, IY;

   wire [31:0] result1;
   wire [31:0] result2;
   wire [31:0] result3;
   wire [31:0] result4;
   wire [31:0] result;

   //toutes les operations ici sont parrallele
   //et s'execute en meme temps
   //ce sont des affectations continue
   assign result1[31:0]  = IX[31:0]
	 		* IY[31:0];

   assign result2[31:0]  = IX[63:32]
			 * IY[63:32];

   assign result3[31:0]  = IX[95:64]
			 * IY[95:64];

   assign result4[31:0]  = IX[127:96]
			  * IY[127:96];
   assign result = result1 + result2 + result3 + result4;
endmodule
