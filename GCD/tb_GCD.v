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
	
	//This block assigns values to inA and inB after reading the test data
	initial	begin
		times = 0;
		fp_r = $fopen("tb_file/GCD_test.txt", "r");		//read test data
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
	//This block assigns values to inA and inB, instead of reading the data
	initial	begin
		inA = 27;
		inB = 15;
		num_gcd = 3;
		#10;

		if ( out == num_gcd )	begin
			$display( "Test ( gcd(27,15) ) succeeded, [ %x == %x ]", out, num_gcd );
		end
		else	begin
			$display( "Test ( gcd(27,15) ) failed, [ %x != %x ]", out, num_gcd );
		end
		
		#10;

		inA = 49;
		inB = 42;
		num_gcd = 7;
		#10;

		if ( out == num_gcd )	begin
			$display( "Test ( gcd(49,42) ) succeeded, [ %x == %x ]", out, num_gcd );
		end
		else	begin
			$display( "Test ( gcd(49,43) ) failed, [ %x != %x ]", out, num_gcd );
		end
*/

		$finish;
	end
endmodule
