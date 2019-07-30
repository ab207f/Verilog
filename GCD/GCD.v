///////////////////////////////////////////////////////
///	This module is a top module	    	    ///
///						    ///
///////////////////////////////////////////////////////

/* 	This module is used to find a greatest common divisor between two numbers.
 * 	
 * 	By Euclidean algorithm
 * 
 * 	for example
 * 		 1.	num1=96		 , num2=40
 * 		 2.	num1=num1-num2=56, num2=40
 * 		 3.	num1=nun1-num2=16, num2=40
 * 		 4.	num1=40		 , num2=16	//swap
 * 		 5.	num1=nun1-num2=24, num2=16
 * 		 6.	num1=nun1-num2=8 , num2=16
 * 		 7.	num1=16		 , num2=8	//swap
 * 		 8.	num1=nun1-num2=8 , num2=8
 * 		 9.	num1=nun1-num2=0 , num2=8
 * 		10.	GCD=num2=8
 */

module GCD	#(parameter LENGTH = 1)		//default the two numbers' length are 1
(in_num1, in_num2, out_num);
	input	[LENGTH - 1 : 0]	in_num1, in_num2;
	output	[LENGTH - 1 : 0]	out_num;
	
	reg	[LENGTH - 1 : 0]	reg_num1, reg_num2, reg_out;
	
	assign out_num = reg_out;
	
	
	//this function is used to sort two input numbers
	//output : bigger is left(MSB), smaller is right(LSB)
	function [LENGTH * 2 - 1 : 0] SWAP;
		input [LENGTH - 1 : 0]	num1, num2;
		
		if(num1 < num2)	begin
			SWAP = {num2, num1};
		end
		else	begin
			SWAP = {num1, num2};
		end
	endfunction	
	
	
	always @(in_num1, in_num2)	begin
		reg_num1 = in_num1;
		reg_num2 = in_num2;
		
		while (reg_num1 != 0)	begin
			{reg_num1, reg_num2} = SWAP (reg_num1, reg_num2);
			reg_num1 = reg_num1 - reg_num2;
		end
		
		reg_out = reg_num2;	//GCD
	end
	
	initial begin
		$display("<< In GCD module >> : in_num1=%5d, in_num2=%5d, out_num=%5d\n", in_num1, in_num2, out_num);
	end
endmodule
