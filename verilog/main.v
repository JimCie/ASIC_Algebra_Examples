//banc de test de simulation
//ce code n'est pas synthetisable
module test_scalar_product;
   parameter SIZE_ARRAY = 256;
   parameter SIZE_INT = 32;
   parameter SIZE = SIZE_ARRAY * SIZE_INT;

   reg [SIZE-1 : 0] IX1;
   reg [SIZE-1 : 0] IY1;

   reg [31:0] IX2 [255:0];
   reg [31:0] IY2 [255:0];

   wire [31:0] result1;
   wire [31:0] result2;

   integer     i;
   initial
     begin
	$dumpfile("signal_scalar_product.vcd");
        $dumpvars;
        $display("\t\ttime, \tresult1");
        $monitor("%d \t%d\n", $time, result1);

	for (i=0; i < SIZE_ARRAY; i = i + 1)
	  begin
	     IX1[(i * SIZE_INT) +: 32] <= {$random} %255;
	     IY1[(i * SIZE_INT) +: 32] <= {$random} %255;
	  end
	#10;
     end

   scalar_product1 test1(result1, IX1, IY1);
endmodule
