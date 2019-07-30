/*
 * This module is GCD module's test bench
 * 
 * The test bench has a test data in GCD_test.txt file
 * 		Data format is "inA inB num_gcd"
 */

module tb_GCD;
	reg [31:0] inA, inB, num_gcd;
	wire [31:0] out;
	integer fp_r, times;
	
	GCD#(32) gcd_unit( .in_num1(inA), .in_num2(inB), .out_num(out));
	

	initial	begin
		times = 0;
		fp_r = $fopen("tb_file/GCD_test.txt", "r");
		#10;
		
		while(!$feof(fp_r)) begin
			times = times + 1;
			$fscanf(fp_r, "%d %d %d", inA, inB, num_gcd);
			$display("inA=%5d inB=%5d num_gcd=%5d", inA, inB, num_gcd);
			
			if ( out == num_gcd )	begin
				$display( "<< Test%2d >> : ( gcd(%5d, %5d) ) succeeded, [ out == num_gcd == %x ]\n", times, inA, inB, out);
			end
			else	begin
				$display( "<< Test%2d >> : ( gcd(%5d, %5d) ) failed, [ (out == %x) != (num_gcd == %5d) ]\n", times, inA, inB, out, num_gcd);
			end
			
		end
			
		$fclose(fp_r);	



/*
		// 3 = GCD( 27, 15 )
		inA = 27;
		inB = 15;
		#10;

		if ( out == 3 )	begin
			$display( "Test ( gcd(27,15) ) succeeded, [ %x == %x ]", out, 3 );
		end
		else	begin
			$display( "Test ( gcd(27,15) ) failed, [ %x != %x ]", out, 3 );
		end
*/		
		$finish;
	end
endmodule
