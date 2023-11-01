// 128 bit xoring of round key and input data add_in
module add_key(
  
    input wire [127:0] r_key,
    input wire [127:0] add_in,
    output wire [127:0] add_out
	);
	
	
	
	
	wire [127:0] r_key_temp;
	wire [127:0] add_out_temp; 
	wire [127:0] add_out_var;
	
		

    	assign r_key_temp = r_key;
    	assign add_out_temp = add_in;


    	// Xoring 128 bit
       assign  add_out_var = add_out_temp[127:0] ^ r_key_temp[127:0];
    
    assign add_out = add_out_var;
	
	
endmodule

// subsitute 1 byte (8 bit / 2 hexadecimal) to some other byte using a standard transformation table
module sub_bytes(
   
    input wire [127:0] subbyte_in,
    output wire [127:0] subbyte_out
	);
	
	wire [127:0] zero;
	wire [127:0] subbyte_out_temp_1; 
	wire [127:0] subbyte_out_temp;

	assign zero = 128'b0;
	
	assign subbyte_out_temp_1 = subbyte_in;
    	
      // subval is the function call for the subsitution of a byte , function defined below. 
     assign    subbyte_out_temp[7:0] = subval(subbyte_out_temp_1[7:0]);      
     assign    subbyte_out_temp[15:8] = subval(subbyte_out_temp_1[15:8]);    
     assign    subbyte_out_temp[23:16] = subval(subbyte_out_temp_1[23:16]);  
     assign    subbyte_out_temp[31:24] = subval(subbyte_out_temp_1[31:24]);  
     assign    subbyte_out_temp[39:32] = subval(subbyte_out_temp_1[39:32]);  
     assign    subbyte_out_temp[47:40] = subval(subbyte_out_temp_1[47:40]);  
     assign    subbyte_out_temp[55:48] = subval(subbyte_out_temp_1[55:48]);  
     assign    subbyte_out_temp[63:56] = subval(subbyte_out_temp_1[63:56]);  
     assign    subbyte_out_temp[71:64] = subval(subbyte_out_temp_1[71:64]);  
     assign    subbyte_out_temp[79:72] = subval(subbyte_out_temp_1[79:72]);  
     assign    subbyte_out_temp[87:80] = subval(subbyte_out_temp_1[87:80]);  
     assign    subbyte_out_temp[95:88] = subval(subbyte_out_temp_1[95:88]);  
     assign    subbyte_out_temp[103:96] = subval(subbyte_out_temp_1[103:96]);    
     assign    subbyte_out_temp[111:104] = subval(subbyte_out_temp_1[111:104]);  
      assign   subbyte_out_temp[119:112] = subval(subbyte_out_temp_1[119:112]);  
       assign  subbyte_out_temp[127:120] = subval(subbyte_out_temp_1[127:120]);  

  	 assign  subbyte_out = subbyte_out_temp;
    
	    function [7:0] subval;
	    input[7:0] address;
	 
	    //This function implements the "subval", it takes in one byte
	    //and returns this corresponding substituted byte
		// function implemented using case statements rather than lookup table
	    begin
	    

		case({address[7],address[3]})
			2'b00: 
				begin

					case({address[6:4],address[2:0]})

					6'o00 : subval = 8'h63;
	       				6'o01 : subval = 8'h7C;
	       				6'o02 : subval = 8'h77;
	       				6'o03 : subval = 8'h7B;
	        			6'o04 : subval = 8'hF2;
	       				6'o05 : subval = 8'h6B;
	       				6'o06 : subval = 8'h6F;
	       				6'o07 : subval = 8'hC5;

	      				6'o10 : subval = 8'hCA;
	       				6'o11 : subval = 8'h82;
	        			6'o12 : subval = 8'hC9;
	        			6'o13 : subval = 8'h7D;
	       				6'o14 : subval = 8'hFA;
	       				6'o15 : subval = 8'h59;
	        			6'o16 : subval = 8'h47;
	        			6'o17 : subval = 8'hF0;

					6'o20 : subval = 8'hB7;
	        			6'o21 : subval = 8'hFD;
	        			6'o22 : subval = 8'h93;
	        			6'o23 : subval = 8'h26;
	        			6'o24 : subval = 8'h36;
	        			6'o25 : subval = 8'h3F;
	        			6'o26 : subval = 8'hF7;
	        			6'o27 : subval = 8'hCC;

	        			6'o30 : subval = 8'h04;
	        			6'o31 : subval = 8'hC7;
	       				6'o32 : subval = 8'h23;
	        			6'o33 : subval = 8'hC3;
	        			6'o34 : subval = 8'h18;
	        			6'o35 : subval = 8'h96;
	        			6'o36 : subval = 8'h05;
	        			6'o37 : subval = 8'h9A;

	        			6'o40 : subval = 8'h09;
	        			6'o41 : subval = 8'h83;
	        			6'o42 : subval = 8'h2C;
	        			6'o43 : subval = 8'h1A;
	        			6'o44 : subval = 8'h1B;
	        			6'o45 : subval = 8'h6E;
	        			6'o46 : subval = 8'h5A;
	       				6'o47 : subval = 8'hA0;

	        			6'o50 : subval = 8'h53;
	        			6'o51 : subval = 8'hD1;
	        			6'o52 : subval = 8'h00;
	        			6'o53 : subval = 8'hED;
	        			6'o54 : subval = 8'h20;
	        			6'o55 : subval = 8'hFC;
	        			6'o56 : subval = 8'hB1;
	        			6'o57 : subval = 8'h5B;

	        			6'o60 : subval = 8'hD0;
	       				6'o61 : subval = 8'hEF;
	       				6'o62 : subval = 8'hAA;
	        			6'o63 : subval = 8'hFB;
	       				6'o64 : subval = 8'h43;
	        			6'o65 : subval = 8'h4D;
	        			6'o66 : subval = 8'h33;
	        			6'o67 : subval = 8'h85;

	        			6'o70 : subval = 8'h51;
	        			6'o71 : subval = 8'hA3;
	        			6'o72 : subval = 8'h40;
	       				6'o73 : subval = 8'h8F;
	        			6'o74 : subval = 8'h92;
	        			6'o75 : subval = 8'h9D;
	        			6'o76 : subval = 8'h38;
	        			6'o77 : subval = 8'hF5;



					
					endcase
		
				end

			2'b01: 
				begin
					case({address[6:4],address[2:0]})

		6'o00 : subval = 8'h30;
	        6'o01 : subval = 8'h01;
	        6'o02 : subval = 8'h67;
	        6'o03 : subval = 8'h2B;
	        6'o04 : subval = 8'hFE;
	        6'o05 : subval = 8'hD7;
	        6'o06 : subval = 8'hAB;
	        6'o07 : subval = 8'h76;

	        6'o10 : subval = 8'hAD;
	        6'o11 : subval = 8'hD4;
	        6'o12 : subval = 8'hA2;
	        6'o13 : subval = 8'hAF;
	        6'o14 : subval = 8'h9C;
	        6'o15 : subval = 8'hA4;
	        6'o16 : subval = 8'h72;
	        6'o17 : subval = 8'hC0;

	        6'o20 : subval = 8'h34;
	        6'o21 : subval = 8'hA5;
	        6'o22 : subval = 8'hE5;
	        6'o23 : subval = 8'hF1;
	        6'o24 : subval = 8'h71;
	        6'o25 : subval = 8'hD8;
	        6'o26 : subval = 8'h31;
	        6'o27 : subval = 8'h15;

	        6'o30 : subval = 8'h07;
	        6'o31 : subval = 8'h12;
	        6'o32 : subval = 8'h80;
	        6'o33 : subval = 8'hE2;
	        6'o34 : subval = 8'hEB;
	        6'o35 : subval = 8'h27;
	        6'o36 : subval = 8'hB2;
	        6'o37 : subval = 8'h75;

	        6'o40 : subval = 8'h52;
	        6'o41 : subval = 8'h3B;
	        6'o42 : subval = 8'hD6;
	        6'o43 : subval = 8'hB3;
	        6'o44 : subval = 8'h29;
	        6'o45 : subval = 8'hE3;
	        6'o46 : subval = 8'h2F;
	        6'o47 : subval = 8'h84;

	        6'o50 : subval = 8'h6A;
	        6'o51 : subval = 8'hCB;
	        6'o52 : subval = 8'hBE;
	        6'o53 : subval = 8'h39;
	        6'o54 : subval = 8'h4A;
	        6'o55 : subval = 8'h4C;
	        6'o56 : subval = 8'h58;
	        6'o57 : subval = 8'hCF;

	        6'o60 : subval = 8'h45;
	        6'o61 : subval = 8'hF9;
	        6'o62 : subval = 8'h02;
	        6'o63 : subval = 8'h7F;
	        6'o64 : subval = 8'h50;
	        6'o65 : subval = 8'h3C;
	        6'o66 : subval = 8'h9F;
	        6'o67 : subval = 8'hA8;

	        6'o70 : subval = 8'hBC;
	        6'o71 : subval = 8'hB6;
	        6'o72 : subval = 8'hDA;
	        6'o73 : subval = 8'h21;
	        6'o74 : subval = 8'h10;
	        6'o75 : subval = 8'hFF;
	        6'o76 : subval = 8'hF3;
	        6'o77 : subval = 8'hD2;



					endcase
		
				end


			2'b10: 
				begin
					case({address[6:4],address[2:0]})

	        6'o00 : subval = 8'hCD;
	        6'o01 : subval = 8'h0C;
	        6'o02 : subval = 8'h13;
	        6'o03 : subval = 8'hEC;
	        6'o04 : subval = 8'h5F;
	        6'o05 : subval = 8'h97;
	        6'o06 : subval = 8'h44;
	        6'o07 : subval = 8'h17;

	        6'o10 : subval = 8'h60;
	        6'o11 : subval = 8'h81;
	        6'o12 : subval = 8'h4F;
	        6'o13 : subval = 8'hDC;
	        6'o14 : subval = 8'h22;
	        6'o15 : subval = 8'h2A;
	        6'o16 : subval = 8'h90;
	        6'o17 : subval = 8'h88;

	        6'o20 : subval = 8'hE0;
	        6'o21 : subval = 8'h32;
	        6'o22 : subval = 8'h3A;
	        6'o23 : subval = 8'h0A;
	        6'o24 : subval = 8'h49;
	        6'o25 : subval = 8'h06;
	        6'o26 : subval = 8'h24;
	        6'o27 : subval = 8'h5C;

	        6'o30 : subval = 8'hE7;
	        6'o31 : subval = 8'hC8;
	        6'o32 : subval = 8'h37;
	        6'o33 : subval = 8'h6D;
	        6'o34 : subval = 8'h8D;
	        6'o35 : subval = 8'hD5;
	        6'o36 : subval = 8'h4E;
	        6'o37 : subval = 8'hA9;

	        6'o40 : subval = 8'hBA;
	        6'o41 : subval = 8'h78;
	        6'o42 : subval = 8'h25;
	        6'o43 : subval = 8'h2E;
	        6'o44 : subval = 8'h1C;
	        6'o45 : subval = 8'hA6;
	        6'o46 : subval = 8'hB4;
	        6'o47 : subval = 8'hC6;

	        6'o50 : subval = 8'h70;
	        6'o51 : subval = 8'h3E;
	        6'o52 : subval = 8'hB5;
	        6'o53 : subval = 8'h66;
	        6'o54 : subval = 8'h48;
	        6'o55 : subval = 8'h03;
	        6'o56 : subval = 8'hF6;
	        6'o57 : subval = 8'h0E;

	        6'o60 : subval = 8'hE1;
	        6'o61 : subval = 8'hF8;
	        6'o62 : subval = 8'h98;
	        6'o63 : subval = 8'h11;
	        6'o64 : subval = 8'h69;
	        6'o65 : subval = 8'hD9;
	        6'o66 : subval = 8'h8E;
	        6'o67 : subval = 8'h94;

	        6'o70 : subval = 8'h8C;
	        6'o71 : subval = 8'hA1;
	        6'o72 : subval = 8'h89;
	        6'o73 : subval = 8'h0D;
	        6'o74 : subval = 8'hBF;
	        6'o75 : subval = 8'hE6;
	        6'o76 : subval = 8'h42;
	        6'o77 : subval = 8'h68;



					
					endcase
		
				end


			2'b11: 
				begin
					case({address[6:4],address[2:0]})

	        6'o00 : subval = 8'hC4;
	        6'o01 : subval = 8'hA7;
	        6'o02 : subval = 8'h7E;
	        6'o03 : subval = 8'h3D;
	        6'o04 : subval = 8'h64;
	        6'o05 : subval = 8'h5D;
	        6'o06 : subval = 8'h19;
	        6'o07 : subval = 8'h73;

	        6'o10 : subval = 8'h46;
	        6'o11 : subval = 8'hEE;
	        6'o12 : subval = 8'hB8;
	        6'o13 : subval = 8'h14;
	        6'o14 : subval = 8'hDE;
	        6'o15 : subval = 8'h5E;
	        6'o16 : subval = 8'h0B;
	        6'o17 : subval = 8'hDB;

	        6'o20 : subval = 8'hC2;
	        6'o21 : subval = 8'hD3;
	        6'o22 : subval = 8'hAC;
	        6'o23 : subval = 8'h62;
	        6'o24 : subval = 8'h91;
	        6'o25 : subval = 8'h95;
	        6'o26 : subval = 8'hE4;
	        6'o27 : subval = 8'h79;

	        6'o30 : subval = 8'h6C;
	        6'o31 : subval = 8'h56;
	        6'o32 : subval = 8'hF4;
	        6'o33 : subval = 8'hEA;
	        6'o34 : subval = 8'h65;
	        6'o35 : subval = 8'h7A;
	        6'o36 : subval = 8'hAE;
	        6'o37 : subval = 8'h08;

	        6'o40 : subval = 8'hE8;
	        6'o41 : subval = 8'hDD;
	        6'o42 : subval = 8'h74;
	        6'o43 : subval = 8'h1F;
	        6'o44 : subval = 8'h4B;
	        6'o45 : subval = 8'hBD;
	        6'o46 : subval = 8'h8B;
	        6'o47 : subval = 8'h8A;

	        6'o50 : subval = 8'h61;
	        6'o51 : subval = 8'h35;
	        6'o52 : subval = 8'h57;
	        6'o53 : subval = 8'hB9;
	        6'o54 : subval = 8'h86;
	        6'o55 : subval = 8'hC1;
	        6'o56 : subval = 8'h1D;
	        6'o57 : subval = 8'h9E;

	        6'o60 : subval = 8'h9B;
	        6'o61 : subval = 8'h1E;
	        6'o62 : subval = 8'h87;
	        6'o63 : subval = 8'hE9;
	        6'o64 : subval = 8'hCE;
	        6'o65 : subval = 8'h55;
	        6'o66 : subval = 8'h28;
	        6'o67 : subval = 8'hDF;

	        6'o70 : subval = 8'h41;
	        6'o71 : subval = 8'h99;
	        6'o72 : subval = 8'h2D;
	        6'o73 : subval = 8'h0F;
	        6'o74 : subval = 8'hB0;
	        6'o75 : subval = 8'h54;
	        6'o76 : subval = 8'hBB;
	        6'o77 : subval = 8'h16;







					endcase
		
				end




		endcase
	    end
	endfunction
    
    
endmodule
	
// shift row is used to transform the matrix and swap values or left shift values in the 2D matrix using standard shifting
// 2D vector represented into 1D vector.
module shift_rows(
   
    input wire [127:0] shiftrow_in,
    output wire [127:0] shiftrow_out
	);
	
	wire [127:0] zero;

	assign zero = 128'b0;

	wire [127:0] temp; 
	wire [127:0] shiftrow_out_temp;
	
assign shiftrow_out_temp =shiftrow_in;
	
	 // temp vector used to stored shifted 2D matrix or swapped vector
	 assign    temp[7:0] = shiftrow_out_temp[39:32];
	 assign    temp[15:8] = shiftrow_out_temp[79:72];
	 assign    temp[23:16] = shiftrow_out_temp[119:112];
	assign     temp[31:24] = shiftrow_out_temp[31:24];
	
	assign     temp[39:32] = shiftrow_out_temp[71:64];
	assign     temp[47:40] = shiftrow_out_temp[111:104];
	assign     temp[55:48] = shiftrow_out_temp[23:16];
	assign     temp[63:56] = shiftrow_out_temp[63:56];
	
	assign     temp[71:64] = shiftrow_out_temp[103:96];
	assign     temp[79:72] = shiftrow_out_temp[15:8];
	assign     temp[87:80] = shiftrow_out_temp[55:48];
	assign     temp[95:88] = shiftrow_out_temp[95:88];
	
	assign     temp[103:96] = shiftrow_out_temp[7:0];
	assign     temp[111:104] = shiftrow_out_temp[47:40];
	assign     temp[119:112] = shiftrow_out_temp[87:80];
	assign     temp[127:120] = shiftrow_out_temp[127:120];

	assign shiftrow_out = temp;
	    
    
    
endmodule	

//mix column is used to tranform the matrix using matrix multiplication
// special matrix is used for this transformation.
module mix_columns(
      
    input wire [127:0] mix_in,
    output wire [127:0] mix_out
	);
	
	wire [127:0] zero;

	assign zero = 128'b0;	
	
	wire [127:0] temp; 
 
	wire [127:0] mix_out_temp;
	
	
	
	assign mix_out_temp = mix_in;
    	
    	// multiplication funtion is being called for multiplication by 2 ,3.
      assign   temp[7:0] =  mul_3(mix_out_temp[31:24]) ^ mix_out_temp[23:16] ^ mix_out_temp[15:8] ^ mul_2(mix_out_temp[7:0]);        
      assign   temp[15:8] = mix_out_temp[31:24] ^ mix_out_temp[23:16] ^ mul_2(mix_out_temp[15:8]) ^ mul_3(mix_out_temp[7:0]);
      assign   temp[23:16] = mix_out_temp[31:24] ^ mul_2(mix_out_temp[23:16]) ^ mul_3(mix_out_temp[15:8]) ^ mix_out_temp[7:0];
      assign   temp[31:24] = mul_2(mix_out_temp[31:24]) ^ mul_3(mix_out_temp[23:16]) ^ mix_out_temp[15:8] ^ mix_out_temp[7:0];
    
      assign   temp[39:32] = mul_3(mix_out_temp[63:56]) ^ mix_out_temp[55:48] ^ mix_out_temp[47:40] ^ mul_2(mix_out_temp[39:32]);
      assign   temp[47:40] = mix_out_temp[63:56] ^ mix_out_temp[55:48] ^ mul_2(mix_out_temp[47:40]) ^ mul_3(mix_out_temp[39:32]);
      assign   temp[55:48] = mix_out_temp[63:56] ^ mul_2(mix_out_temp[55:48])^ mul_3(mix_out_temp[47:40])^mix_out_temp[39:32];
      assign   temp[63:56] = mul_2(mix_out_temp[63:56]) ^ mul_3(mix_out_temp[55:48]) ^ mix_out_temp[47:40] ^ mix_out_temp[39:32];
    
      assign   temp[71:64] = mul_3(mix_out_temp[95:88]) ^ mix_out_temp[87:80] ^ mix_out_temp[79:72] ^ mul_2(mix_out_temp[71:64]);
      assign   temp[79:72] = mix_out_temp[95:88] ^ mix_out_temp[87:80] ^ mul_2(mix_out_temp[79:72]) ^ mul_3(mix_out_temp[71:64]);
      assign   temp[87:80] = mix_out_temp[95:88] ^ mul_2(mix_out_temp[87:80]) ^ mul_3(mix_out_temp[79:72])^mix_out_temp[71:64];
      assign   temp[95:88] = mul_2(mix_out_temp[95:88]) ^ mul_3(mix_out_temp[87:80]) ^ mix_out_temp[79:72] ^mix_out_temp[71:64];
        
      assign   temp[103:96] = mul_3(mix_out_temp[127:120]) ^ mix_out_temp[119:112] ^ mix_out_temp[111:104] ^ mul_2(mix_out_temp[103:96]);
      assign   temp[111:104] = mix_out_temp[127:120] ^ mix_out_temp[119:112] ^ mul_2(mix_out_temp[111:104]) ^ mul_3(mix_out_temp[103:96]);
      assign   temp[119:112] = mix_out_temp[127:120] ^ mul_2(mix_out_temp[119:112]) ^ mul_3(mix_out_temp[111:104]) ^ mix_out_temp[103:96];
      assign   temp[127:120] = mul_2(mix_out_temp[127:120]) ^ mul_3(mix_out_temp[119:112]) ^ mix_out_temp[111:104] ^ mix_out_temp[103:96];
        
  	assign mix_out = temp;
	
// multiplication is hard coded for a byte and is not called calculated dynamically.
//for every value between 00-ff , corresponding multiplication value of 1 byte is returned.
	
	function [7:0] mul_2;
    input [7:0] x;

 
		case({x[7],x[3]})
			2'b00: 
				begin

					case({x[6:4],x[2:0]})



					6'o00 : mul_2 = 8'h00; 
	       				6'o01 : mul_2 = 8'h02;
	       				6'o02 : mul_2 = 8'h04;
	       				6'o03 : mul_2 = 8'h06;
	        			6'o04 : mul_2 = 8'h08;
	       				6'o05 : mul_2 = 8'h0A;
	       				6'o06 : mul_2 = 8'h0C;
	       				6'o07 : mul_2 = 8'h0E;


	      				6'o10 : mul_2 = 8'h20;
	       				6'o11 : mul_2 = 8'h22;
	        			6'o12 : mul_2 = 8'h24;
	        			6'o13 : mul_2 = 8'h26;
	       				6'o14 : mul_2 = 8'h28;
	       				6'o15 : mul_2 = 8'h2A;
	        			6'o16 : mul_2 = 8'h2C;
	        			6'o17 : mul_2 = 8'h2E;


					6'o20 : mul_2 = 8'h40;
	        			6'o21 : mul_2 = 8'h42;
	        			6'o22 : mul_2 = 8'h44;
	        			6'o23 : mul_2 = 8'h46;
	        			6'o24 : mul_2 = 8'h48;
	        			6'o25 : mul_2 = 8'h4A;
	        			6'o26 : mul_2 = 8'h4C;
	        			6'o27 : mul_2 = 8'h4E;


	        			6'o30 : mul_2 = 8'h60;
	        			6'o31 : mul_2 = 8'h62;
	       				6'o32 : mul_2 = 8'h64;
	        			6'o33 : mul_2 = 8'h66;
	        			6'o34 : mul_2 = 8'h68;
	        			6'o35 : mul_2 = 8'h6A;
	        			6'o36 : mul_2 = 8'h6C;
	        			6'o37 : mul_2 = 8'h6E;


	        			6'o40 :  mul_2 = 8'h80;
	        			6'o41 :  mul_2 = 8'h82;
	        			6'o42 :  mul_2 = 8'h84;
	        			6'o43 :  mul_2 = 8'h86;
	        			6'o44 :  mul_2 = 8'h88;
	        			6'o45 :  mul_2 = 8'h8A;
	        			6'o46 :  mul_2 = 8'h8C;
	       				6'o47 :  mul_2 = 8'h8E;


	        			6'o50 : mul_2 = 8'hA0;
	        			6'o51 : mul_2 = 8'hA2;
	        			6'o52 : mul_2 = 8'hA4;
	        			6'o53 : mul_2 = 8'hA6;
	        			6'o54 : mul_2 = 8'hA8;
	        			6'o55 : mul_2 = 8'hAA;
	        			6'o56 : mul_2 = 8'hAC;
	        			6'o57 : mul_2 = 8'hAE;


	        			6'o60 : mul_2 = 8'hC0;
	       				6'o61 : mul_2 = 8'hC2;
	       				6'o62 : mul_2 = 8'hC4;
	        			6'o63 : mul_2 = 8'hC6;
	       				6'o64 : mul_2 = 8'hC8;
	        			6'o65 : mul_2 = 8'hCA;
	        			6'o66 : mul_2 = 8'hCC;
	        			6'o67 : mul_2 = 8'hCE;


	        			6'o70 : mul_2 = 8'hE0;
	        			6'o71 : mul_2 = 8'hE2;
	        			6'o72 : mul_2 = 8'hE4;
	       				6'o73 : mul_2 = 8'hE6;
	        			6'o74 : mul_2 = 8'hE8;
	        			6'o75 : mul_2 = 8'hEA;
	        			6'o76 : mul_2 = 8'hEC;
	        			6'o77 : mul_2 = 8'hEE;



					
					endcase
		
				end

			2'b01: 
				begin
					case({x[6:4],x[2:0]})



					6'o00 : mul_2 = 8'h10; 
	       				6'o01 : mul_2 = 8'h12;
	       				6'o02 : mul_2 = 8'h14;
	       				6'o03 : mul_2 = 8'h16;
	        			6'o04 : mul_2 = 8'h18;
	       				6'o05 : mul_2 = 8'h1A;
	       				6'o06 : mul_2 = 8'h1C;
	       				6'o07 : mul_2 = 8'h1E;


	      				6'o10 : mul_2 = 8'h30;
	       				6'o11 : mul_2 = 8'h32;
	        			6'o12 : mul_2 = 8'h34;
	        			6'o13 : mul_2 = 8'h36;
	       				6'o14 : mul_2 = 8'h38;
	       				6'o15 : mul_2 = 8'h3A;
	        			6'o16 : mul_2 = 8'h3C;
	        			6'o17 : mul_2 = 8'h3E;


					6'o20 : mul_2 = 8'h50;
	        			6'o21 : mul_2 = 8'h52;
	        			6'o22 : mul_2 = 8'h54;
	        			6'o23 : mul_2 = 8'h56;
	        			6'o24 : mul_2 = 8'h58;
	        			6'o25 : mul_2 = 8'h5A;
	        			6'o26 : mul_2 = 8'h5C;
	        			6'o27 : mul_2 = 8'h5E;


	        			6'o30 : mul_2 = 8'h70;
	        			6'o31 : mul_2 = 8'h72;
	       				6'o32 : mul_2 = 8'h74;
	        			6'o33 : mul_2 = 8'h76;
	        			6'o34 : mul_2 = 8'h78;
	        			6'o35 : mul_2 = 8'h7A;
	        			6'o36 : mul_2 = 8'h7C;
	        			6'o37 : mul_2 = 8'h7E;


	        			6'o40 :  mul_2 = 8'h90;
	        			6'o41 :  mul_2 = 8'h92;
	        			6'o42 :  mul_2 = 8'h94;
	        			6'o43 :  mul_2 = 8'h96;
	        			6'o44 :  mul_2 = 8'h98;
	        			6'o45 :  mul_2 = 8'h9A;
	        			6'o46 :  mul_2 = 8'h9C;
	       				6'o47 :  mul_2 = 8'h9E;


	        			6'o50 : mul_2 = 8'hB0;
	        			6'o51 : mul_2 = 8'hB2;
	        			6'o52 : mul_2 = 8'hB4;
	        			6'o53 : mul_2 = 8'hB6;
	        			6'o54 : mul_2 = 8'hB8;
	        			6'o55 : mul_2 = 8'hBA;
	        			6'o56 : mul_2 = 8'hBC;
	        			6'o57 : mul_2 = 8'hBE;


	        			6'o60 : mul_2 = 8'hD0;
	       				6'o61 : mul_2 = 8'hD2;
	       				6'o62 : mul_2 = 8'hD4;
	        			6'o63 : mul_2 = 8'hD6;
	       				6'o64 : mul_2 = 8'hD8;
	        			6'o65 : mul_2 = 8'hDA;
	        			6'o66 : mul_2 = 8'hDC;
	        			6'o67 : mul_2 = 8'hDE;


	        			6'o70 : mul_2 = 8'hF0;
	        			6'o71 : mul_2 = 8'hF2;
	        			6'o72 : mul_2 = 8'hF4;
	       				6'o73 : mul_2 = 8'hF6;
	        			6'o74 : mul_2 = 8'hF8;
	        			6'o75 : mul_2 = 8'hFA;
	        			6'o76 : mul_2 = 8'hFC;
	        			6'o77 : mul_2 = 8'hFE;



					endcase
		
				end


			2'b10: 
				begin
					case({x[6:4],x[2:0]})


					6'o00 : mul_2 = 8'h1B; 
	       				6'o01 : mul_2 = 8'h19;
	       				6'o02 : mul_2 = 8'h1F;
	       				6'o03 : mul_2 = 8'h1D;
	        			6'o04 : mul_2 = 8'h13;
	       				6'o05 : mul_2 = 8'h11;
	       				6'o06 : mul_2 = 8'h17;
	       				6'o07 : mul_2 = 8'h15;


	      				6'o10 : mul_2 = 8'h3B;
	       				6'o11 : mul_2 = 8'h39;
	        			6'o12 : mul_2 = 8'h3F;
	        			6'o13 : mul_2 = 8'h3D;
	       				6'o14 : mul_2 = 8'h33;
	       				6'o15 : mul_2 = 8'h31;
	        			6'o16 : mul_2 = 8'h37;
	        			6'o17 : mul_2 = 8'h35;


					6'o20 : mul_2 = 8'h5B;
	        			6'o21 : mul_2 = 8'h59;
	        			6'o22 : mul_2 = 8'h5F;
	        			6'o23 : mul_2 = 8'h5D;
	        			6'o24 : mul_2 = 8'h53;
	        			6'o25 : mul_2 = 8'h51;
	        			6'o26 : mul_2 = 8'h57;
	        			6'o27 : mul_2 = 8'h55;


	        			6'o30 : mul_2 = 8'h7B;
	        			6'o31 : mul_2 = 8'h79;
	       				6'o32 : mul_2 = 8'h7F;
	        			6'o33 : mul_2 = 8'h7D;
	        			6'o34 : mul_2 = 8'h73;
	        			6'o35 : mul_2 = 8'h71;
	        			6'o36 : mul_2 = 8'h77;
	        			6'o37 : mul_2 = 8'h75;


	        			6'o40 :  mul_2 = 8'h9B;
	        			6'o41 :  mul_2 = 8'h99;
	        			6'o42 :  mul_2 = 8'h9F;
	        			6'o43 :  mul_2 = 8'h9D;
	        			6'o44 :  mul_2 = 8'h93;
	        			6'o45 :  mul_2 = 8'h91;
	        			6'o46 :  mul_2 = 8'h97;
	       				6'o47 :  mul_2 = 8'h95;


	        			6'o50 : mul_2 = 8'hBB;
	        			6'o51 : mul_2 = 8'hB9;
	        			6'o52 : mul_2 = 8'hBF;
	        			6'o53 : mul_2 = 8'hBD;
	        			6'o54 : mul_2 = 8'hB3;
	        			6'o55 : mul_2 = 8'hB1;
	        			6'o56 : mul_2 = 8'hB7;
	        			6'o57 : mul_2 = 8'hB5;


	        			6'o60 : mul_2 = 8'hDB;
	       				6'o61 : mul_2 = 8'hD9;
	       				6'o62 : mul_2 = 8'hDF;
	        			6'o63 : mul_2 = 8'hDD;
	       				6'o64 : mul_2 = 8'hD3;
	        			6'o65 : mul_2 = 8'hD1;
	        			6'o66 : mul_2 = 8'hD7;
	        			6'o67 : mul_2 = 8'hD5;


	        			6'o70 : mul_2 = 8'hFB;
	        			6'o71 : mul_2 = 8'hF9;
	        			6'o72 : mul_2 = 8'hFF;
	       				6'o73 : mul_2 = 8'hFD;
	        			6'o74 : mul_2 = 8'hF3;
	        			6'o75 : mul_2 = 8'hF1;
	        			6'o76 : mul_2 = 8'hF7;
	        			6'o77 : mul_2 = 8'hF5;



					
					endcase
		
				end


			2'b11: 
				begin
					case({x[6:4],x[2:0]})

					6'o00 : mul_2 = 8'h0B; 
	       				6'o01 : mul_2 = 8'h09;
	       				6'o02 : mul_2 = 8'h0F;
	       				6'o03 : mul_2 = 8'h0D;
	        			6'o04 : mul_2 = 8'h03;
	       				6'o05 : mul_2 = 8'h01;
	       				6'o06 : mul_2 = 8'h07;
	       				6'o07 : mul_2 = 8'h05;


	      				6'o10 : mul_2 = 8'h2B;
	       				6'o11 : mul_2 = 8'h29;
	        			6'o12 : mul_2 = 8'h2F;
	        			6'o13 : mul_2 = 8'h2D;
	       				6'o14 : mul_2 = 8'h23;
	       				6'o15 : mul_2 = 8'h21;
	        			6'o16 : mul_2 = 8'h27;
	        			6'o17 : mul_2 = 8'h25;


					6'o20 : mul_2 = 8'h4B;
	        			6'o21 : mul_2 = 8'h49;
	        			6'o22 : mul_2 = 8'h4F;
	        			6'o23 : mul_2 = 8'h4D;
	        			6'o24 : mul_2 = 8'h43;
	        			6'o25 : mul_2 = 8'h41;
	        			6'o26 : mul_2 = 8'h47;
	        			6'o27 : mul_2 = 8'h45;


	        			6'o30 : mul_2 = 8'h6B;
	        			6'o31 : mul_2 = 8'h69;
	       				6'o32 : mul_2 = 8'h6F;
	        			6'o33 : mul_2 = 8'h6D;
	        			6'o34 : mul_2 = 8'h63;
	        			6'o35 : mul_2 = 8'h61;
	        			6'o36 : mul_2 = 8'h67;
	        			6'o37 : mul_2 = 8'h65;


	        			6'o40 :  mul_2 = 8'h8B;
	        			6'o41 :  mul_2 = 8'h89;
	        			6'o42 :  mul_2 = 8'h8F;
	        			6'o43 :  mul_2 = 8'h8D;
	        			6'o44 :  mul_2 = 8'h83;
	        			6'o45 :  mul_2 = 8'h81;
	        			6'o46 :  mul_2 = 8'h87;
	       				6'o47 :  mul_2 = 8'h85;


	        			6'o50 : mul_2 = 8'hAB;
	        			6'o51 : mul_2 = 8'hA9;
	        			6'o52 : mul_2 = 8'hAF;
	        			6'o53 : mul_2 = 8'hAD;
	        			6'o54 : mul_2 = 8'hA3;
	        			6'o55 : mul_2 = 8'hA1;
	        			6'o56 : mul_2 = 8'hA7;
	        			6'o57 : mul_2 = 8'hA5;


	        			6'o60 : mul_2 = 8'hCB;
	       				6'o61 : mul_2 = 8'hC9;
	       				6'o62 : mul_2 = 8'hCF;
	        			6'o63 : mul_2 = 8'hCD;
	       				6'o64 : mul_2 = 8'hC3;
	        			6'o65 : mul_2 = 8'hC1;
	        			6'o66 : mul_2 = 8'hC7;
	        			6'o67 : mul_2 = 8'hC5;


	        			6'o70 : mul_2 = 8'hEB;
	        			6'o71 : mul_2 = 8'hE9;
	        			6'o72 : mul_2 = 8'hEF;
	       				6'o73 : mul_2 = 8'hED;
	        			6'o74 : mul_2 = 8'hE3;
	        			6'o75 : mul_2 = 8'hE1;
	        			6'o76 : mul_2 = 8'hE7;
	        			6'o77 : mul_2 = 8'hE5;


					endcase
		
				end
	endcase


  endfunction

  function [7:0] mul_3;
    input [7:0] x;
 
  

	case({x[7],x[3]})
			2'b00: 
				begin

					case({x[6:4],x[2:0]})


					6'o00 : mul_3 = 8'h00; 
	       				6'o01 : mul_3 = 8'h03;
	       				6'o02 : mul_3 = 8'h06;
	       				6'o03 : mul_3 = 8'h05;
	        			6'o04 : mul_3 = 8'h0C;
	       				6'o05 : mul_3 = 8'h0F;
	       				6'o06 : mul_3 = 8'h0A;
	       				6'o07 : mul_3 = 8'h09;


	      				6'o10 : mul_3 = 8'h30;
	       				6'o11 : mul_3 = 8'h33;
	        			6'o12 : mul_3 = 8'h36;
	        			6'o13 : mul_3 = 8'h35;
	       				6'o14 : mul_3 = 8'h3C;
	       				6'o15 : mul_3 = 8'h3F;
	        			6'o16 : mul_3 = 8'h3A;
	        			6'o17 : mul_3 = 8'h39;


					6'o20 : mul_3 = 8'h60;
	        			6'o21 : mul_3 = 8'h63;
	        			6'o22 : mul_3 = 8'h66;
	        			6'o23 : mul_3 = 8'h65;
	        			6'o24 : mul_3 = 8'h6C;
	        			6'o25 : mul_3 = 8'h6F;
	        			6'o26 : mul_3 = 8'h6A;
	        			6'o27 : mul_3 = 8'h69;


	        			6'o30 : mul_3 = 8'h50;
	        			6'o31 : mul_3 = 8'h53;
	       				6'o32 : mul_3 = 8'h56;
	        			6'o33 : mul_3 = 8'h55;
	        			6'o34 : mul_3 = 8'h5C;
	        			6'o35 : mul_3 = 8'h5F;
	        			6'o36 : mul_3 = 8'h5A;
	        			6'o37 : mul_3 = 8'h59;


	        			6'o40 :  mul_3 = 8'hC0;
	        			6'o41 :  mul_3 = 8'hC3;
	        			6'o42 :  mul_3 = 8'hC6;
	        			6'o43 :  mul_3 = 8'hC5;
	        			6'o44 :  mul_3 = 8'hCC;
	        			6'o45 :  mul_3 = 8'hCF;
	        			6'o46 :  mul_3 = 8'hCA;
	       				6'o47 :  mul_3 = 8'hC9;


	        			6'o50 : mul_3 = 8'hF0;
	        			6'o51 : mul_3 = 8'hF3;
	        			6'o52 : mul_3 = 8'hF6;
	        			6'o53 : mul_3 = 8'hF5;
	        			6'o54 : mul_3 = 8'hFC;
	        			6'o55 : mul_3 = 8'hFF;
	        			6'o56 : mul_3 = 8'hFA;
	        			6'o57 : mul_3 = 8'hF9;



	        			6'o60 : mul_3 = 8'hA0;
	       				6'o61 : mul_3 = 8'hA3;
	       				6'o62 : mul_3 = 8'hA6;
	        			6'o63 : mul_3 = 8'hA5;
	       				6'o64 : mul_3 = 8'hAC;
	        			6'o65 : mul_3 = 8'hAF;
	        			6'o66 : mul_3 = 8'hAA;
	        			6'o67 : mul_3 = 8'hA9;


	        			6'o70 : mul_3 = 8'h90;
	        			6'o71 : mul_3 = 8'h93;
	        			6'o72 : mul_3 = 8'h96;
	       				6'o73 : mul_3 = 8'h95;
	        			6'o74 : mul_3 = 8'h9C;
	        			6'o75 : mul_3 = 8'h9F;
	        			6'o76 : mul_3 = 8'h9A;
	        			6'o77 : mul_3 = 8'h99;



					
					endcase
		
				end

			2'b01: 
				begin
					case({x[6:4],x[2:0]})


					6'o00 : mul_3 = 8'h18; 
	       				6'o01 : mul_3 = 8'h1B;
	       				6'o02 : mul_3 = 8'h1E;
	       				6'o03 : mul_3 = 8'h1D;
	        			6'o04 : mul_3 = 8'h14;
	       				6'o05 : mul_3 = 8'h17;
	       				6'o06 : mul_3 = 8'h12;
	       				6'o07 : mul_3 = 8'h11;


					6'o10 : mul_3 = 8'h28; 
	       				6'o11 : mul_3 = 8'h2B;
	       				6'o12 : mul_3 = 8'h2E;
	       				6'o13 : mul_3 = 8'h2D;
	        			6'o14 : mul_3 = 8'h24;
	       				6'o15 : mul_3 = 8'h27;
	       				6'o16 : mul_3 = 8'h22;
	       				6'o17 : mul_3 = 8'h21;



					6'o20 : mul_3 = 8'h78; 
	       				6'o21 : mul_3 = 8'h7B;
	       				6'o22 : mul_3 = 8'h7E;
	       				6'o23 : mul_3 = 8'h7D;
	        			6'o24 : mul_3 = 8'h74;
	       				6'o25 : mul_3 = 8'h77;
	       				6'o26 : mul_3 = 8'h72;
	       				6'o27 : mul_3 = 8'h71;


					6'o30 : mul_3 = 8'h48; 
	       				6'o31 : mul_3 = 8'h4B;
	       				6'o32 : mul_3 = 8'h4E;
	       				6'o33 : mul_3 = 8'h4D;
	        			6'o34 : mul_3 = 8'h44;
	       				6'o35 : mul_3 = 8'h47;
	       				6'o36 : mul_3 = 8'h42;
	       				6'o37 : mul_3 = 8'h41;


					6'o40 : mul_3 = 8'hD8; 
	       				6'o41 : mul_3 = 8'hDB;
	       				6'o42 : mul_3 = 8'hDE;
	       				6'o43 : mul_3 = 8'hDD;
	        			6'o44 : mul_3 = 8'hD4;
	       				6'o45 : mul_3 = 8'hD7;
	       				6'o46 : mul_3 = 8'hD2;
	       				6'o47 : mul_3 = 8'hD1;


					6'o50 : mul_3 = 8'hE8; 
	       				6'o51 : mul_3 = 8'hEB;
	       				6'o52 : mul_3 = 8'hEE;
	       				6'o53 : mul_3 = 8'hED;
	        			6'o54 : mul_3 = 8'hE4;
	       				6'o55 : mul_3 = 8'hE7;
	       				6'o56 : mul_3 = 8'hE2;
	       				6'o57 : mul_3 = 8'hE1;


					6'o60 : mul_3 = 8'hB8; 
	       				6'o61 : mul_3 = 8'hBB;
	       				6'o62 : mul_3 = 8'hBE;
	       				6'o63 : mul_3 = 8'hBD;
	        			6'o64 : mul_3 = 8'hB4;
	       				6'o65 : mul_3 = 8'hB7;
	       				6'o66 : mul_3 = 8'hB2;
	       				6'o67 : mul_3 = 8'hB1;


					6'o70 : mul_3 = 8'h88; 
	       				6'o71 : mul_3 = 8'h8B;
	       				6'o72 : mul_3 = 8'h8E;
	       				6'o73 : mul_3 = 8'h8D;
	        			6'o74 : mul_3 = 8'h84;
	       				6'o75 : mul_3 = 8'h87;
	       				6'o76 : mul_3 = 8'h82;
	       				6'o77 : mul_3 = 8'h81;



					endcase
		
				end


			2'b10: 
				begin
					case({x[6:4],x[2:0]})


					6'o00 : mul_3 = 8'h9B; 
	       				6'o01 : mul_3 = 8'h98;
	       				6'o02 : mul_3 = 8'h9D;
	       				6'o03 : mul_3 = 8'h9E;
	        			6'o04 : mul_3 = 8'h97;
	       				6'o05 : mul_3 = 8'h94;
	       				6'o06 : mul_3 = 8'h91;
	       				6'o07 : mul_3 = 8'h92;


					6'o10 : mul_3 = 8'hAB; 
	       				6'o11 : mul_3 = 8'hA8;
	       				6'o12 : mul_3 = 8'hAD;
	       				6'o13 : mul_3 = 8'hAE;
	        			6'o14 : mul_3 = 8'hA7;
	       				6'o15 : mul_3 = 8'hA4;
	       				6'o16 : mul_3 = 8'hA1;
	       				6'o17 : mul_3 = 8'hA2;


					6'o20 : mul_3 = 8'hFB; 
	       				6'o21 : mul_3 = 8'hF8;
	       				6'o22 : mul_3 = 8'hFD;
	       				6'o23 : mul_3 = 8'hFE;
	        			6'o24 : mul_3 = 8'hF7;
	       				6'o25 : mul_3 = 8'hF4;
	       				6'o26 : mul_3 = 8'hF1;
	       				6'o27 : mul_3 = 8'hF2;


					6'o30 : mul_3 = 8'hCB; 
	       				6'o31 : mul_3 = 8'hC8;
	       				6'o32 : mul_3 = 8'hCD;
	       				6'o33 : mul_3 = 8'hCE;
	        			6'o34 : mul_3 = 8'hC7;
	       				6'o35 : mul_3 = 8'hC4;
	       				6'o36 : mul_3 = 8'hC1;
	       				6'o37 : mul_3 = 8'hC2;


					6'o40 : mul_3 = 8'h5B; 
	       				6'o41 : mul_3 = 8'h58;
	       				6'o42 : mul_3 = 8'h5D;
	       				6'o43 : mul_3 = 8'h5E;
	        			6'o44 : mul_3 = 8'h57;
	       				6'o45 : mul_3 = 8'h54;
	       				6'o46 : mul_3 = 8'h51;
	       				6'o47 : mul_3 = 8'h52;


					6'o50 : mul_3 = 8'h6B; 
	       				6'o51 : mul_3 = 8'h68;
	       				6'o52 : mul_3 = 8'h6D;
	       				6'o53 : mul_3 = 8'h6E;
	        			6'o54 : mul_3 = 8'h67;
	       				6'o55 : mul_3 = 8'h64;
	       				6'o56 : mul_3 = 8'h61;
	       				6'o57 : mul_3 = 8'h62;


					6'o60 : mul_3 = 8'h3B; 
	       				6'o61 : mul_3 = 8'h38;
	       				6'o62 : mul_3 = 8'h3D;
	       				6'o63 : mul_3 = 8'h3E;
	        			6'o64 : mul_3 = 8'h37;
	       				6'o65 : mul_3 = 8'h34;
	       				6'o66 : mul_3 = 8'h31;
	       				6'o67 : mul_3 = 8'h32;


					6'o70 : mul_3 = 8'h0B; 
	       				6'o71 : mul_3 = 8'h08;
	       				6'o72 : mul_3 = 8'h0D;
	       				6'o73 : mul_3 = 8'h0E;
	        			6'o74 : mul_3 = 8'h07;
	       				6'o75 : mul_3 = 8'h04;
	       				6'o76 : mul_3 = 8'h01;
	       				6'o77 : mul_3 = 8'h02;



					
					endcase
		
				end


			2'b11: 
				begin
					case({x[6:4],x[2:0]})


					6'o00 : mul_3 = 8'h83; 
	       				6'o01 : mul_3 = 8'h80;
	       				6'o02 : mul_3 = 8'h85;
	       				6'o03 : mul_3 = 8'h86;
	        			6'o04 : mul_3 = 8'h8F;
	       				6'o05 : mul_3 = 8'h8C;
	       				6'o06 : mul_3 = 8'h89;
	       				6'o07 : mul_3 = 8'h8A;


					6'o10 : mul_3 = 8'hB3; 
	       				6'o11 : mul_3 = 8'hB0;
	       				6'o12 : mul_3 = 8'hB5;
	       				6'o13 : mul_3 = 8'hB6;
	        			6'o14 : mul_3 = 8'hBF;
	       				6'o15 : mul_3 = 8'hBC;
	       				6'o16 : mul_3 = 8'hB9;
	       				6'o17 : mul_3 = 8'hBA;


					6'o20 : mul_3 = 8'hE3; 
	       				6'o21 : mul_3 = 8'hE0;
	       				6'o22 : mul_3 = 8'hE5;
	       				6'o23 : mul_3 = 8'hE6;
	        			6'o24 : mul_3 = 8'hEF;
	       				6'o25 : mul_3 = 8'hEC;
	       				6'o26 : mul_3 = 8'hE9;
	       				6'o27 : mul_3 = 8'hEA;


					6'o30 : mul_3 = 8'hD3; 
	       				6'o31 : mul_3 = 8'hD0;
	       				6'o32 : mul_3 = 8'hD5;
	       				6'o33 : mul_3 = 8'hD6;
	        			6'o34 : mul_3 = 8'hDF;
	       				6'o35 : mul_3 = 8'hDC;
	       				6'o36 : mul_3 = 8'hD9;
	       				6'o37 : mul_3 = 8'hDA;



					6'o40 : mul_3 = 8'h43; 
	       				6'o41 : mul_3 = 8'h40;
	       				6'o42 : mul_3 = 8'h45;
	       				6'o43 : mul_3 = 8'h46;
	        			6'o44 : mul_3 = 8'h4F;
	       				6'o45 : mul_3 = 8'h4C;
	       				6'o46 : mul_3 = 8'h49;
	       				6'o47 : mul_3 = 8'h4A;


					6'o50 : mul_3 = 8'h73; 
	       				6'o51 : mul_3 = 8'h70;
	       				6'o52 : mul_3 = 8'h75;
	       				6'o53 : mul_3 = 8'h76;
	        			6'o54 : mul_3 = 8'h7F;
	       				6'o55 : mul_3 = 8'h7C;
	       				6'o56 : mul_3 = 8'h79;
	       				6'o57 : mul_3 = 8'h7A;


					6'o60 : mul_3 = 8'h23; 
	       				6'o61 : mul_3 = 8'h20;
	       				6'o62 : mul_3 = 8'h25;
	       				6'o63 : mul_3 = 8'h26;
	        			6'o64 : mul_3 = 8'h2F;
	       				6'o65 : mul_3 = 8'h2C;
	       				6'o66 : mul_3 = 8'h29;
	       				6'o67 : mul_3 = 8'h2A;


					6'o70 : mul_3 = 8'h13; 
	       				6'o71 : mul_3 = 8'h10;
	       				6'o72 : mul_3 = 8'h15;
	       				6'o73 : mul_3 = 8'h16;
	        			6'o74 : mul_3 = 8'h1F;
	       				6'o75 : mul_3 = 8'h1C;
	       				6'o76 : mul_3 = 8'h19;
	       				6'o77 : mul_3 = 8'h1A;


					endcase
		
				end
	endcase



  endfunction    
	
endmodule

// here we implement xoring of a word of 32 bit with another word after its transformation using a "g" function.
// "g" function is the used on the last 4 bytes of the 1408 bit long key vector
module expand_key_core(
    input wire clk,
    input wire reset,   
    input wire [127:0] key_in,
    input wire [7:0] rcon_index_in,
   	output wire[127:0] expanded_key_out
    );
     

    wire[127:0] expanded_key_next;	
    wire[127:0] expanded_key_temp_1,expanded_key_temp_2;
    wire[31:0] core_state,core_state_1,core_state_2;
	reg [31:0] core_state_3;
	reg [127:0] expanded_key_temp;
    wire[7:0] temp;
	wire[7:0] rcon_index;
    
 
    
    
   	assign rcon_index = rcon_index_in;
	    
	




// last 4 bytes of 1408 bit vector is from index [31:0]
    assign core_state[31:0]=key_in[31:0];
    
	
  // Circular left shift is performed on last 4 bytes
    assign temp=core_state[31:24];
    assign core_state_1[31:0] = {core_state[23:0],temp};

   // substitution is performed on the circular shifted vector 
   assign core_state_2[31:24] = subval(core_state_1[31:24]);
   assign core_state_2[23:16] = subval(core_state_1[23:16]);
   assign core_state_2[15:8] = subval(core_state_1[15:8]);
  assign  core_state_2[7:0] = subval(core_state_1[7:0]);

wire [31:0] core_temp;
// this substituted vector is then xored with the round index.
//function of round index is given below
assign core_temp = core_state_2[31:0]^{Rcon(rcon_index),24'h000000};

wire [31:0] zero_32;
assign zero_32 =32'b0;

wire [127:0] zero_128;
assign zero_128 =128'b0;


always @ (posedge clk)
begin

		case(reset)
			1'b0: begin core_state_3[31:0] <= zero_32; expanded_key_temp[127:0]<= zero_128;end
  			1'b1:begin  expanded_key_temp[127:0]<=key_in[127:0]; core_state_3[31:0] <= core_temp; end
		endcase

end

  assign  expanded_key_temp_2[127:96]=core_state_3[31:0]^expanded_key_temp[127:96];
  assign  expanded_key_temp_2[95:64]= expanded_key_temp_2[127:96]^expanded_key_temp[95:64];
  assign  expanded_key_temp_2[63:32]=expanded_key_temp_2[95:64]^expanded_key_temp[63:32];
 assign   expanded_key_temp_2[31:0]=expanded_key_temp_2[63:32]^expanded_key_temp[31:0];  

   assign expanded_key_next[127:0] = expanded_key_temp_2[127:0];
    
    assign expanded_key_out = expanded_key_next;

    
   
  // function implemented round index values which gets xored at different rounds 
    function [7:0] Rcon;
      input[7:0] RconCount;
      case (RconCount)
        8'h00 : Rcon = 8'h01;
        8'h01 : Rcon = 8'h02;
        8'h02 : Rcon = 8'h04;
        8'h03 : Rcon = 8'h08;
        8'h04 : Rcon = 8'h10;
        8'h05 : Rcon = 8'h20;
        8'h06 : Rcon = 8'h40;
        8'h07 : Rcon = 8'h80;
        8'h08 : Rcon = 8'h1B;
        8'h09 : Rcon = 8'h36;
      endcase
    endfunction
    
      function [7:0] subval;
      input[7:0] address;
      //This function implements the "subval", it takes in one byte
      //and returns this corresponding substituted byte
      begin
       
		case({address[7],address[3]})
			2'b00: 
				begin

					case({address[6:4],address[2:0]})

					6'o00 : subval = 8'h63;
	       				6'o01 : subval = 8'h7C;
	       				6'o02 : subval = 8'h77;
	       				6'o03 : subval = 8'h7B;
	        			6'o04 : subval = 8'hF2;
	       				6'o05 : subval = 8'h6B;
	       				6'o06 : subval = 8'h6F;
	       				6'o07 : subval = 8'hC5;

	      				6'o10 : subval = 8'hCA;
	       				6'o11 : subval = 8'h82;
	        			6'o12 : subval = 8'hC9;
	        			6'o13 : subval = 8'h7D;
	       				6'o14 : subval = 8'hFA;
	       				6'o15 : subval = 8'h59;
	        			6'o16 : subval = 8'h47;
	        			6'o17 : subval = 8'hF0;

					6'o20 : subval = 8'hB7;
	        			6'o21 : subval = 8'hFD;
	        			6'o22 : subval = 8'h93;
	        			6'o23 : subval = 8'h26;
	        			6'o24 : subval = 8'h36;
	        			6'o25 : subval = 8'h3F;
	        			6'o26 : subval = 8'hF7;
	        			6'o27 : subval = 8'hCC;

	        			6'o30 : subval = 8'h04;
	        			6'o31 : subval = 8'hC7;
	       				6'o32 : subval = 8'h23;
	        			6'o33 : subval = 8'hC3;
	        			6'o34 : subval = 8'h18;
	        			6'o35 : subval = 8'h96;
	        			6'o36 : subval = 8'h05;
	        			6'o37 : subval = 8'h9A;

	        			6'o40 : subval = 8'h09;
	        			6'o41 : subval = 8'h83;
	        			6'o42 : subval = 8'h2C;
	        			6'o43 : subval = 8'h1A;
	        			6'o44 : subval = 8'h1B;
	        			6'o45 : subval = 8'h6E;
	        			6'o46 : subval = 8'h5A;
	       				6'o47 : subval = 8'hA0;

	        			6'o50 : subval = 8'h53;
	        			6'o51 : subval = 8'hD1;
	        			6'o52 : subval = 8'h00;
	        			6'o53 : subval = 8'hED;
	        			6'o54 : subval = 8'h20;
	        			6'o55 : subval = 8'hFC;
	        			6'o56 : subval = 8'hB1;
	        			6'o57 : subval = 8'h5B;

	        			6'o60 : subval = 8'hD0;
	       				6'o61 : subval = 8'hEF;
	       				6'o62 : subval = 8'hAA;
	        			6'o63 : subval = 8'hFB;
	       				6'o64 : subval = 8'h43;
	        			6'o65 : subval = 8'h4D;
	        			6'o66 : subval = 8'h33;
	        			6'o67 : subval = 8'h85;

	        			6'o70 : subval = 8'h51;
	        			6'o71 : subval = 8'hA3;
	        			6'o72 : subval = 8'h40;
	       				6'o73 : subval = 8'h8F;
	        			6'o74 : subval = 8'h92;
	        			6'o75 : subval = 8'h9D;
	        			6'o76 : subval = 8'h38;
	        			6'o77 : subval = 8'hF5;



					
					endcase
		
				end

			2'b01: 
				begin
					case({address[6:4],address[2:0]})

		6'o00 : subval = 8'h30;
	        6'o01 : subval = 8'h01;
	        6'o02 : subval = 8'h67;
	        6'o03 : subval = 8'h2B;
	        6'o04 : subval = 8'hFE;
	        6'o05 : subval = 8'hD7;
	        6'o06 : subval = 8'hAB;
	        6'o07 : subval = 8'h76;

	        6'o10 : subval = 8'hAD;
	        6'o11 : subval = 8'hD4;
	        6'o12 : subval = 8'hA2;
	        6'o13 : subval = 8'hAF;
	        6'o14 : subval = 8'h9C;
	        6'o15 : subval = 8'hA4;
	        6'o16 : subval = 8'h72;
	        6'o17 : subval = 8'hC0;

	        6'o20 : subval = 8'h34;
	        6'o21 : subval = 8'hA5;
	        6'o22 : subval = 8'hE5;
	        6'o23 : subval = 8'hF1;
	        6'o24 : subval = 8'h71;
	        6'o25 : subval = 8'hD8;
	        6'o26 : subval = 8'h31;
	        6'o27 : subval = 8'h15;

	        6'o30 : subval = 8'h07;
	        6'o31 : subval = 8'h12;
	        6'o32 : subval = 8'h80;
	        6'o33 : subval = 8'hE2;
	        6'o34 : subval = 8'hEB;
	        6'o35 : subval = 8'h27;
	        6'o36 : subval = 8'hB2;
	        6'o37 : subval = 8'h75;

	        6'o40 : subval = 8'h52;
	        6'o41 : subval = 8'h3B;
	        6'o42 : subval = 8'hD6;
	        6'o43 : subval = 8'hB3;
	        6'o44 : subval = 8'h29;
	        6'o45 : subval = 8'hE3;
	        6'o46 : subval = 8'h2F;
	        6'o47 : subval = 8'h84;

	        6'o50 : subval = 8'h6A;
	        6'o51 : subval = 8'hCB;
	        6'o52 : subval = 8'hBE;
	        6'o53 : subval = 8'h39;
	        6'o54 : subval = 8'h4A;
	        6'o55 : subval = 8'h4C;
	        6'o56 : subval = 8'h58;
	        6'o57 : subval = 8'hCF;

	        6'o60 : subval = 8'h45;
	        6'o61 : subval = 8'hF9;
	        6'o62 : subval = 8'h02;
	        6'o63 : subval = 8'h7F;
	        6'o64 : subval = 8'h50;
	        6'o65 : subval = 8'h3C;
	        6'o66 : subval = 8'h9F;
	        6'o67 : subval = 8'hA8;

	        6'o70 : subval = 8'hBC;
	        6'o71 : subval = 8'hB6;
	        6'o72 : subval = 8'hDA;
	        6'o73 : subval = 8'h21;
	        6'o74 : subval = 8'h10;
	        6'o75 : subval = 8'hFF;
	        6'o76 : subval = 8'hF3;
	        6'o77 : subval = 8'hD2;



					endcase
		
				end


			2'b10: 
				begin
					case({address[6:4],address[2:0]})

	        6'o00 : subval = 8'hCD;
	        6'o01 : subval = 8'h0C;
	        6'o02 : subval = 8'h13;
	        6'o03 : subval = 8'hEC;
	        6'o04 : subval = 8'h5F;
	        6'o05 : subval = 8'h97;
	        6'o06 : subval = 8'h44;
	        6'o07 : subval = 8'h17;

	        6'o10 : subval = 8'h60;
	        6'o11 : subval = 8'h81;
	        6'o12 : subval = 8'h4F;
	        6'o13 : subval = 8'hDC;
	        6'o14 : subval = 8'h22;
	        6'o15 : subval = 8'h2A;
	        6'o16 : subval = 8'h90;
	        6'o17 : subval = 8'h88;

	        6'o20 : subval = 8'hE0;
	        6'o21 : subval = 8'h32;
	        6'o22 : subval = 8'h3A;
	        6'o23 : subval = 8'h0A;
	        6'o24 : subval = 8'h49;
	        6'o25 : subval = 8'h06;
	        6'o26 : subval = 8'h24;
	        6'o27 : subval = 8'h5C;

	        6'o30 : subval = 8'hE7;
	        6'o31 : subval = 8'hC8;
	        6'o32 : subval = 8'h37;
	        6'o33 : subval = 8'h6D;
	        6'o34 : subval = 8'h8D;
	        6'o35 : subval = 8'hD5;
	        6'o36 : subval = 8'h4E;
	        6'o37 : subval = 8'hA9;

	        6'o40 : subval = 8'hBA;
	        6'o41 : subval = 8'h78;
	        6'o42 : subval = 8'h25;
	        6'o43 : subval = 8'h2E;
	        6'o44 : subval = 8'h1C;
	        6'o45 : subval = 8'hA6;
	        6'o46 : subval = 8'hB4;
	        6'o47 : subval = 8'hC6;

	        6'o50 : subval = 8'h70;
	        6'o51 : subval = 8'h3E;
	        6'o52 : subval = 8'hB5;
	        6'o53 : subval = 8'h66;
	        6'o54 : subval = 8'h48;
	        6'o55 : subval = 8'h03;
	        6'o56 : subval = 8'hF6;
	        6'o57 : subval = 8'h0E;

	        6'o60 : subval = 8'hE1;
	        6'o61 : subval = 8'hF8;
	        6'o62 : subval = 8'h98;
	        6'o63 : subval = 8'h11;
	        6'o64 : subval = 8'h69;
	        6'o65 : subval = 8'hD9;
	        6'o66 : subval = 8'h8E;
	        6'o67 : subval = 8'h94;

	        6'o70 : subval = 8'h8C;
	        6'o71 : subval = 8'hA1;
	        6'o72 : subval = 8'h89;
	        6'o73 : subval = 8'h0D;
	        6'o74 : subval = 8'hBF;
	        6'o75 : subval = 8'hE6;
	        6'o76 : subval = 8'h42;
	        6'o77 : subval = 8'h68;



					
					endcase
		
				end


			2'b11: 
				begin
					case({address[6:4],address[2:0]})

	        6'o00 : subval = 8'hC4;
	        6'o01 : subval = 8'hA7;
	        6'o02 : subval = 8'h7E;
	        6'o03 : subval = 8'h3D;
	        6'o04 : subval = 8'h64;
	        6'o05 : subval = 8'h5D;
	        6'o06 : subval = 8'h19;
	        6'o07 : subval = 8'h73;

	        6'o10 : subval = 8'h46;
	        6'o11 : subval = 8'hEE;
	        6'o12 : subval = 8'hB8;
	        6'o13 : subval = 8'h14;
	        6'o14 : subval = 8'hDE;
	        6'o15 : subval = 8'h5E;
	        6'o16 : subval = 8'h0B;
	        6'o17 : subval = 8'hDB;

	        6'o20 : subval = 8'hC2;
	        6'o21 : subval = 8'hD3;
	        6'o22 : subval = 8'hAC;
	        6'o23 : subval = 8'h62;
	        6'o24 : subval = 8'h91;
	        6'o25 : subval = 8'h95;
	        6'o26 : subval = 8'hE4;
	        6'o27 : subval = 8'h79;

	        6'o30 : subval = 8'h6C;
	        6'o31 : subval = 8'h56;
	        6'o32 : subval = 8'hF4;
	        6'o33 : subval = 8'hEA;
	        6'o34 : subval = 8'h65;
	        6'o35 : subval = 8'h7A;
	        6'o36 : subval = 8'hAE;
	        6'o37 : subval = 8'h08;

	        6'o40 : subval = 8'hE8;
	        6'o41 : subval = 8'hDD;
	        6'o42 : subval = 8'h74;
	        6'o43 : subval = 8'h1F;
	        6'o44 : subval = 8'h4B;
	        6'o45 : subval = 8'hBD;
	        6'o46 : subval = 8'h8B;
	        6'o47 : subval = 8'h8A;

	        6'o50 : subval = 8'h61;
	        6'o51 : subval = 8'h35;
	        6'o52 : subval = 8'h57;
	        6'o53 : subval = 8'hB9;
	        6'o54 : subval = 8'h86;
	        6'o55 : subval = 8'hC1;
	        6'o56 : subval = 8'h1D;
	        6'o57 : subval = 8'h9E;

	        6'o60 : subval = 8'h9B;
	        6'o61 : subval = 8'h1E;
	        6'o62 : subval = 8'h87;
	        6'o63 : subval = 8'hE9;
	        6'o64 : subval = 8'hCE;
	        6'o65 : subval = 8'h55;
	        6'o66 : subval = 8'h28;
	        6'o67 : subval = 8'hDF;

	        6'o70 : subval = 8'h41;
	        6'o71 : subval = 8'h99;
	        6'o72 : subval = 8'h2D;
	        6'o73 : subval = 8'h0F;
	        6'o74 : subval = 8'hB0;
	        6'o75 : subval = 8'h54;
	        6'o76 : subval = 8'hBB;
	        6'o77 : subval = 8'h16;







					endcase

      end

		endcase
end
    endfunction   
endmodule

module final_expanded_key_top(
    input wire clk,
    input wire reset,
    input wire [127:0] key,
    output wire[1407:0] expanded_key
	);
	
	wire [1407:0] expanded_key_next;
		
	wire [7:0] rcon_index_1, rcon_index_2, rcon_index_3, rcon_index_4, rcon_index_5, rcon_index_6, rcon_index_7, rcon_index_8, rcon_index_9, rcon_index_10;
	
	wire [127:0] expanded_key_1_out, expanded_key_2_out, expanded_key_3_out, expanded_key_4_out, expanded_key_5_out, expanded_key_6_out, expanded_key_7_out, expanded_key_8_out, expanded_key_9_out, expanded_key_10_out;
	
	wire [127:0] expanded_key_2_in, expanded_key_3_in, expanded_key_4_in, expanded_key_5_in, expanded_key_6_in, expanded_key_7_in, expanded_key_8_in,expanded_key_9_in,expanded_key_10_in; 
	
// registers used for pipelining operation and to prevent overwriting of data in following cycles

// every round key of 128 bit we get is not simultaneous , so as to get all keys at a common positive edge of clock
// we use registers to carry the value forward till the last step or last key is formed.
// this prevents erasing of a part of key due to speed mismatch in data in and pipelining operation 

	reg [127:0]  key_reg,expanded_key_2_in_reg,expanded_key_3_in_reg,expanded_key_4_in_reg,expanded_key_5_in_reg,expanded_key_6_in_reg,expanded_key_7_in_reg,expanded_key_8_in_reg,expanded_key_9_in_reg,expanded_key_10_in_reg;
	
	reg [127:0] key_reg1,key_reg2,key_reg3,key_reg4,key_reg5,key_reg6,key_reg7,key_reg8,key_reg9,key_reg10,key_reg11,key_reg12,key_reg13,key_reg14,key_reg15,key_reg16,key_reg17,key_reg18,key_reg19,key_reg20;
	reg [127:0] expanded_key_2_in_reg1,expanded_key_2_in_reg2,expanded_key_2_in_reg3,expanded_key_2_in_reg4,expanded_key_2_in_reg5,expanded_key_2_in_reg6,expanded_key_2_in_reg7,expanded_key_2_in_reg8,expanded_key_2_in_reg9,expanded_key_2_in_reg10,expanded_key_2_in_reg11,expanded_key_2_in_reg12,expanded_key_2_in_reg13,expanded_key_2_in_reg14,expanded_key_2_in_reg15,expanded_key_2_in_reg16,expanded_key_2_in_reg17,expanded_key_2_in_reg18;
	reg [127:0] expanded_key_3_in_reg1,expanded_key_3_in_reg2,expanded_key_3_in_reg3,expanded_key_3_in_reg4,expanded_key_3_in_reg5,expanded_key_3_in_reg6,expanded_key_3_in_reg7,expanded_key_3_in_reg8,expanded_key_3_in_reg9,expanded_key_3_in_reg10,expanded_key_3_in_reg11,expanded_key_3_in_reg12,expanded_key_3_in_reg13,expanded_key_3_in_reg14,expanded_key_3_in_reg15,expanded_key_3_in_reg16;
	reg [127:0] expanded_key_4_in_reg1,expanded_key_4_in_reg2,expanded_key_4_in_reg3,expanded_key_4_in_reg4,expanded_key_4_in_reg5,expanded_key_4_in_reg6,expanded_key_4_in_reg7,expanded_key_4_in_reg8,expanded_key_4_in_reg9,expanded_key_4_in_reg10,expanded_key_4_in_reg11,expanded_key_4_in_reg12,expanded_key_4_in_reg13,expanded_key_4_in_reg14;
	reg [127:0] expanded_key_5_in_reg1,expanded_key_5_in_reg2,expanded_key_5_in_reg3,expanded_key_5_in_reg4,expanded_key_5_in_reg5,expanded_key_5_in_reg6,expanded_key_5_in_reg7,expanded_key_5_in_reg8,expanded_key_5_in_reg9,expanded_key_5_in_reg10,expanded_key_5_in_reg11,expanded_key_5_in_reg12;
	reg [127:0] expanded_key_6_in_reg1,expanded_key_6_in_reg2,expanded_key_6_in_reg3,expanded_key_6_in_reg4,expanded_key_6_in_reg5,expanded_key_6_in_reg6,expanded_key_6_in_reg7,expanded_key_6_in_reg8,expanded_key_6_in_reg9,expanded_key_6_in_reg10;
	reg [127:0] expanded_key_7_in_reg1,expanded_key_7_in_reg2,expanded_key_7_in_reg3,expanded_key_7_in_reg4,expanded_key_7_in_reg5,expanded_key_7_in_reg6,expanded_key_7_in_reg7,expanded_key_7_in_reg8;
	reg [127:0] expanded_key_8_in_reg1,expanded_key_8_in_reg2,expanded_key_8_in_reg3,expanded_key_8_in_reg4,expanded_key_8_in_reg5,expanded_key_8_in_reg6;
	reg [127:0] expanded_key_9_in_reg1,expanded_key_9_in_reg2,expanded_key_9_in_reg3,expanded_key_9_in_reg4;
	reg [127:0] expanded_key_10_in_reg1 ,expanded_key_10_in_reg2,expanded_key_10_out_reg;

	wire [127:0] zero_128;

		assign zero_128 =128'b0;	  
  
	    assign rcon_index_1 = 8'h00;
	   assign rcon_index_2 = 8'h01;
	   assign rcon_index_3 = 8'h02;
	   assign rcon_index_4 = 8'h03;
	   assign rcon_index_5 = 8'h04;
	   assign rcon_index_6 = 8'h05;
	   assign rcon_index_7 = 8'h06;
	  assign  rcon_index_8 = 8'h07;
	  assign  rcon_index_9 = 8'h08;
	  assign  rcon_index_10 = 8'h09;
	    
	    always @(posedge clk)
			begin

			   case(reset)
				1'b0:
					begin
						key_reg <= zero_128;
						expanded_key_2_in_reg <= zero_128;
						expanded_key_3_in_reg <=zero_128;
						expanded_key_4_in_reg <=zero_128;
						expanded_key_5_in_reg <=zero_128;
						expanded_key_6_in_reg <=zero_128;
						expanded_key_7_in_reg <=zero_128;
						expanded_key_8_in_reg <=zero_128;
						expanded_key_9_in_reg <=zero_128;
						expanded_key_10_in_reg <=zero_128;


					end

				1'b1:
					begin

// key at round 1 taken upto last key generation clock cycle.
						key_reg <= key;
						key_reg1<=key_reg;
						key_reg2<=key_reg1;
						key_reg3<=key_reg2;
						key_reg4<=key_reg3;
						key_reg5<=key_reg4;
						key_reg6<=key_reg5;
						key_reg7<=key_reg6;
						key_reg8<=key_reg7;
						key_reg9<=key_reg8;
						key_reg10<=key_reg9;
						key_reg11<=key_reg10;
						key_reg12<=key_reg11;
						key_reg13<=key_reg12;
						key_reg14<=key_reg13;
						key_reg15<=key_reg14;
						key_reg16<=key_reg15;
						key_reg17<=key_reg16;
						key_reg18<=key_reg17;
						key_reg19<=key_reg18;
						key_reg20<=key_reg19;

// key generated at round 1 taken upto last round clock cycle.				
						expanded_key_2_in_reg <=expanded_key_2_in;
						expanded_key_2_in_reg1 <=expanded_key_2_in_reg;
						expanded_key_2_in_reg2 <=expanded_key_2_in_reg1;
						expanded_key_2_in_reg3 <=expanded_key_2_in_reg2;
						expanded_key_2_in_reg4 <=expanded_key_2_in_reg3;
						expanded_key_2_in_reg5 <=expanded_key_2_in_reg4;
						expanded_key_2_in_reg6 <=expanded_key_2_in_reg5;
						expanded_key_2_in_reg7 <=expanded_key_2_in_reg6;
						expanded_key_2_in_reg8 <=expanded_key_2_in_reg7;
						expanded_key_2_in_reg9 <=expanded_key_2_in_reg8;
						expanded_key_2_in_reg10 <=expanded_key_2_in_reg9;
						expanded_key_2_in_reg11 <=expanded_key_2_in_reg10;
						expanded_key_2_in_reg12 <=expanded_key_2_in_reg11;
						expanded_key_2_in_reg13 <=expanded_key_2_in_reg12;
						expanded_key_2_in_reg14 <=expanded_key_2_in_reg13;
						expanded_key_2_in_reg15 <=expanded_key_2_in_reg14;
						expanded_key_2_in_reg16 <=expanded_key_2_in_reg15;
						expanded_key_2_in_reg17 <=expanded_key_2_in_reg16;
						expanded_key_2_in_reg18 <=expanded_key_2_in_reg17;
						
// key generated at round 2 taken upto last round clock cycle.		
						
						expanded_key_3_in_reg <=expanded_key_3_in;
						expanded_key_3_in_reg1 <=expanded_key_3_in_reg;
						expanded_key_3_in_reg2 <=expanded_key_3_in_reg1;
						expanded_key_3_in_reg3 <=expanded_key_3_in_reg2;
						expanded_key_3_in_reg4 <=expanded_key_3_in_reg3;
						expanded_key_3_in_reg5 <=expanded_key_3_in_reg4;
						expanded_key_3_in_reg6 <=expanded_key_3_in_reg5;
						expanded_key_3_in_reg7 <=expanded_key_3_in_reg6;
						expanded_key_3_in_reg8 <=expanded_key_3_in_reg7;
						expanded_key_3_in_reg9 <=expanded_key_3_in_reg8;
						expanded_key_3_in_reg10 <=expanded_key_3_in_reg9;
						expanded_key_3_in_reg11 <=expanded_key_3_in_reg10;
						expanded_key_3_in_reg12 <=expanded_key_3_in_reg11;
						expanded_key_3_in_reg13 <=expanded_key_3_in_reg12;
						expanded_key_3_in_reg14 <=expanded_key_3_in_reg13;
						expanded_key_3_in_reg15 <=expanded_key_3_in_reg14;
						expanded_key_3_in_reg16 <=expanded_key_3_in_reg15;
// key generated at round 3 taken upto last round clock cycle.		

						expanded_key_4_in_reg <=expanded_key_4_in;
						expanded_key_4_in_reg1 <=expanded_key_4_in_reg;
						expanded_key_4_in_reg2 <=expanded_key_4_in_reg1;
						expanded_key_4_in_reg3 <=expanded_key_4_in_reg2;
						expanded_key_4_in_reg4 <=expanded_key_4_in_reg3;
						expanded_key_4_in_reg5 <=expanded_key_4_in_reg4;
						expanded_key_4_in_reg6 <=expanded_key_4_in_reg5;
						expanded_key_4_in_reg7 <=expanded_key_4_in_reg6;
						expanded_key_4_in_reg8 <=expanded_key_4_in_reg7;
						expanded_key_4_in_reg9 <=expanded_key_4_in_reg8;
						expanded_key_4_in_reg10 <=expanded_key_4_in_reg9;
						expanded_key_4_in_reg11 <=expanded_key_4_in_reg10;
						expanded_key_4_in_reg12 <=expanded_key_4_in_reg11;
						expanded_key_4_in_reg13 <=expanded_key_4_in_reg12;
						expanded_key_4_in_reg14 <=expanded_key_4_in_reg13;

// key generated at round 4 taken upto last round clock cycle.		
						expanded_key_5_in_reg <=expanded_key_5_in;
						expanded_key_5_in_reg1 <=expanded_key_5_in_reg;
						expanded_key_5_in_reg2 <=expanded_key_5_in_reg1;
						expanded_key_5_in_reg3 <=expanded_key_5_in_reg2;
						expanded_key_5_in_reg4 <=expanded_key_5_in_reg3;
						expanded_key_5_in_reg5 <=expanded_key_5_in_reg4;
						expanded_key_5_in_reg6 <=expanded_key_5_in_reg5;
						expanded_key_5_in_reg7 <=expanded_key_5_in_reg6;
						expanded_key_5_in_reg8 <=expanded_key_5_in_reg7;
						expanded_key_5_in_reg9 <=expanded_key_5_in_reg8;
						expanded_key_5_in_reg10 <=expanded_key_5_in_reg9;
						expanded_key_5_in_reg11 <=expanded_key_5_in_reg10;
						expanded_key_5_in_reg12 <=expanded_key_5_in_reg11;

// key generated at round 5 taken upto last round clock cycle.		
						expanded_key_6_in_reg <=expanded_key_6_in;
						expanded_key_6_in_reg1 <=expanded_key_6_in_reg;
						expanded_key_6_in_reg2 <=expanded_key_6_in_reg1;
						expanded_key_6_in_reg3 <=expanded_key_6_in_reg2;
						expanded_key_6_in_reg4 <=expanded_key_6_in_reg3;
						expanded_key_6_in_reg5 <=expanded_key_6_in_reg4;
						expanded_key_6_in_reg6 <=expanded_key_6_in_reg5;
						expanded_key_6_in_reg7 <=expanded_key_6_in_reg6;
						expanded_key_6_in_reg8 <=expanded_key_6_in_reg7;
						expanded_key_6_in_reg9 <=expanded_key_6_in_reg8;
						expanded_key_6_in_reg10 <=expanded_key_6_in_reg9;

// key generated at round 6 taken upto last round clock cycle.		

						expanded_key_7_in_reg <=expanded_key_7_in;
						expanded_key_7_in_reg1 <=expanded_key_7_in_reg;
						expanded_key_7_in_reg2 <=expanded_key_7_in_reg1;
						expanded_key_7_in_reg3 <=expanded_key_7_in_reg2;
						expanded_key_7_in_reg4 <=expanded_key_7_in_reg3;
						expanded_key_7_in_reg5 <=expanded_key_7_in_reg4;
						expanded_key_7_in_reg6 <=expanded_key_7_in_reg5;
						expanded_key_7_in_reg7 <=expanded_key_7_in_reg6;
						expanded_key_7_in_reg8 <=expanded_key_7_in_reg7;
// key generated at round 7 taken upto last round clock cycle.		
						expanded_key_8_in_reg <=expanded_key_8_in;
						expanded_key_8_in_reg1 <=expanded_key_8_in_reg;
						expanded_key_8_in_reg2 <=expanded_key_8_in_reg1;
						expanded_key_8_in_reg3 <=expanded_key_8_in_reg2;
						expanded_key_8_in_reg4 <=expanded_key_8_in_reg3;
						expanded_key_8_in_reg5 <=expanded_key_8_in_reg4;
						expanded_key_8_in_reg6 <=expanded_key_8_in_reg5;

// key generated at round 8 taken upto last round clock cycle.		
						expanded_key_9_in_reg <=expanded_key_9_in;
						expanded_key_9_in_reg1 <=expanded_key_9_in_reg;
						expanded_key_9_in_reg2 <=expanded_key_9_in_reg1;
						expanded_key_9_in_reg3 <=expanded_key_9_in_reg2;
						expanded_key_9_in_reg4 <=expanded_key_9_in_reg3;
// key generated at round 9 taken upto last round clock cycle.		
						expanded_key_10_in_reg <=expanded_key_10_in;
						expanded_key_10_in_reg1 <=expanded_key_10_in_reg;
						expanded_key_10_in_reg2 <=expanded_key_10_in_reg1;
	
			
					end
			   endcase
			end

	assign    expanded_key_next[127:0] = key_reg19[127:0];
	assign    expanded_key_next[255:128] = expanded_key_2_in_reg17[127:0]; 
	assign    expanded_key_next[383:256] = expanded_key_3_in_reg15[127:0];
	assign    expanded_key_next[511:384] = expanded_key_4_in_reg13[127:0];
	assign    expanded_key_next[639:512] = expanded_key_5_in_reg11[127:0];
	assign    expanded_key_next[767:640] = expanded_key_6_in_reg9[127:0];
	assign    expanded_key_next[895:768] = expanded_key_7_in_reg7[127:0];
	assign    expanded_key_next[1023:896] = expanded_key_8_in_reg5[127:0];
	assign     expanded_key_next[1151:1024] = expanded_key_9_in_reg3[127:0];
	assign     expanded_key_next[1279:1152] = expanded_key_10_in_reg1[127:0];
	 
 
// round 1 of key expansion
    expand_key_core i_expand_key_core_1(
	    . clk(clk),
	    . reset(reset),
	    . key_in(key_reg),
	    . rcon_index_in(rcon_index_1),
	    . expanded_key_out(expanded_key_1_out));


assign    expanded_key_2_in[127:0] = expanded_key_1_out[127:0];

// round 2 of key expansion
    expand_key_core i_expand_key_core_2(
	    . clk(clk),
	    . reset(reset),
	    . key_in(expanded_key_2_in_reg),
	    . rcon_index_in(rcon_index_2),
	    . expanded_key_out(expanded_key_2_out));
 
	
	assign    expanded_key_3_in[127:0] = expanded_key_2_out[127:0];   
 // round 3 of key expansion   
    expand_key_core i_expand_key_core_3(
	    . clk(clk),
	    . reset(reset),
	    . key_in(expanded_key_3_in_reg),
	    . rcon_index_in(rcon_index_3),
	    . expanded_key_out(expanded_key_3_out));

	
	assign    expanded_key_4_in[127:0] = expanded_key_3_out[127:0];   
  // round 4 of key expansion  
    expand_key_core i_expand_key_core_4(
	    . clk(clk),
	    . reset(reset),
	    . key_in(expanded_key_4_in_reg),
	    . rcon_index_in(rcon_index_4),
	    . expanded_key_out(expanded_key_4_out));

	
	assign    expanded_key_5_in[127:0] = expanded_key_4_out[127:0];
   //round 5 of key expansion 
    expand_key_core i_expand_key_core_5(
	    . clk(clk),
	    . reset(reset),
	    . key_in(expanded_key_5_in_reg),
	    . rcon_index_in(rcon_index_5),
	    . expanded_key_out(expanded_key_5_out));


	
	assign    expanded_key_6_in[127:0] = expanded_key_5_out[127:0];
  // round 6 of key expansion  
    expand_key_core i_expand_key_core_6(
	    . clk(clk),
	    . reset(reset),
	    . key_in(expanded_key_6_in_reg),
	    . rcon_index_in(rcon_index_6),
	    . expanded_key_out(expanded_key_6_out));

	
	assign    expanded_key_7_in[127:0] = expanded_key_6_out[127:0];

   // round 7 of key expansion 
    expand_key_core i_expand_key_core_7(
	    . clk(clk),
	    . reset(reset),
	    . key_in(expanded_key_7_in_reg),
	    . rcon_index_in(rcon_index_7),
	    . expanded_key_out(expanded_key_7_out));

	
	assign     expanded_key_8_in[127:0] = expanded_key_7_out[127:0];
  // round 8 of key expansion  
    expand_key_core i_expand_key_core_8(
	    . clk(clk),
	    . reset(reset),
	    . key_in(expanded_key_8_in_reg),
	    . rcon_index_in(rcon_index_8),
	    . expanded_key_out(expanded_key_8_out));

	
	assign     expanded_key_9_in[127:0] = expanded_key_8_out[127:0];
	    

   // round 9 of key expansion 
    expand_key_core i_expand_key_core_9(
	    . clk(clk),
	    . reset(reset),
	    . key_in(expanded_key_9_in_reg),
	    . rcon_index_in(rcon_index_9),
	    . expanded_key_out(expanded_key_9_out));
    
	    
	
	assign  expanded_key_10_in[127:0] = expanded_key_9_out[127:0];

// final round of key expansion
    expand_key_core i_expand_key_core_10(
	    . clk(clk),
	    . reset(reset),
	    . key_in(expanded_key_10_in_reg),
	    . rcon_index_in(rcon_index_10),
	    . expanded_key_out(expanded_key_10_out));   
		
  assign    expanded_key_next[1407:1280] = expanded_key_10_out[127:0];
    assign expanded_key = expanded_key_next;
    
  
endmodule

// breakdown of expanded key vector into 10 round keys
module key_distribution(
	
	input wire[1407:0] expanded_key,
	output wire [127:0] initialkey,
	output wire [127:0] addroundkey_1,
	output wire [127:0] addroundkey_2,
	output wire [127:0] addroundkey_3,
	output wire [127:0] addroundkey_4,
	output wire [127:0] addroundkey_5,
	output wire [127:0] addroundkey_6,
	output wire [127:0] addroundkey_7,	
	output wire [127:0] addroundkey_8,
	output wire [127:0] addroundkey_9,
	output wire [127:0] addroundkey_10
	);
	
	
	    assign initialkey = expanded_key[127:0];
	   assign addroundkey_1 = expanded_key[255:128];
	   assign  addroundkey_2 = expanded_key[383:256];
	  assign   addroundkey_3 = expanded_key[511:384];
	  assign  addroundkey_4 = expanded_key[639:512];
	  assign   addroundkey_5 = expanded_key[767:640];
	  assign   addroundkey_6 = expanded_key[895:768];
	  assign  addroundkey_7 = expanded_key[1023:896];
	  assign   addroundkey_8 = expanded_key[1151:1024];
	 assign   addroundkey_9 = expanded_key[1279:1152];
	 assign    addroundkey_10 = expanded_key[1407:1280];
	    
   
    
endmodule


module aes_128_encrypt_round(
    input wire clk,
    input wire reset,
    input wire [127:0] r_key,
    input wire [127:0] state_in,
    output wire [127:0]state_out
	);
	
	wire [127:0] subbyte_out;
	wire [127:0] shiftrow_out;
	wire [127:0] mixcolumn_out;

	wire [127:0] zero_128;
	assign zero_128 = 128'b0;

	reg [127:0] subbyte_out_reg;
	reg [127:0] shiftrow_out_reg;
	reg [127:0] mixcolumn_out_reg;

	reg [127:0] round_key_reg;
	reg [127:0] round_key_reg1;
	reg [127:0] round_key_reg2;

	wire [127:0] add_out;
	
	wire [127:0] state_temp;
	
	always @ (posedge clk)

		begin

				case(reset)

						1'b0:
							begin
								subbyte_out_reg<=zero_128;
								shiftrow_out_reg<=zero_128;
								mixcolumn_out_reg<=zero_128;
							end

						1'b1:
							begin
								subbyte_out_reg<=subbyte_out;
								shiftrow_out_reg<=shiftrow_out;
								mixcolumn_out_reg<=mixcolumn_out;

								round_key_reg<=r_key;
								round_key_reg1<=round_key_reg;
								round_key_reg2<=round_key_reg1;
							

							end


				endcase

		end
sub_bytes i_sub_bytes(
. subbyte_in(state_in),
. subbyte_out(subbyte_out));
	
shift_rows i_shift_rows(
. shiftrow_in(subbyte_out_reg),
.shiftrow_out(shiftrow_out));


mix_columns i_mix_columns(
. mix_in(shiftrow_out_reg),
. mix_out(mixcolumn_out));

add_key i_add_key(
. r_key(round_key_reg2),
. add_in(mixcolumn_out_reg),
. add_out(add_out));
	
		
	
    	
		assign state_temp = add_out;
   
    
    assign state_out = state_temp;
	
endmodule

module aes_128_encrypt_final_round(
    input wire clk,
    input wire reset,    
    input wire [127:0] r_key,
    input wire [127:0] state_in,
    output wire [127:0] state_out
	);
	wire [127:0] subbyte_out;
	wire [127:0] shiftrow_out;
	wire [127:0] add_out;
	
	wire [127:0] state_out_temp;

wire [127:0] zero_128;
	assign zero_128 = 128'b0;

	reg [127:0] subbyte_out_reg;
	reg [127:0] shiftrow_out_reg;
	reg [127:0] round_key_reg;
	reg [127:0] round_key_reg1;
	
always @ (posedge clk)

		begin

				case(reset)

						1'b0:
							begin
								subbyte_out_reg<=zero_128;
								shiftrow_out_reg<=zero_128;
							
							end

						1'b1:
							begin
								subbyte_out_reg<=subbyte_out;
								shiftrow_out_reg<=shiftrow_out;
								

								round_key_reg<=r_key;
								round_key_reg1<=round_key_reg;
								

							end


				endcase

		end
	
sub_bytes i_sub_bytes(

. subbyte_in(state_in),
. subbyte_out(subbyte_out));

shift_rows i_shift_rows(

. shiftrow_in(subbyte_out_reg),
.shiftrow_out(shiftrow_out));

add_key i_add_key(

. r_key(round_key_reg1),
. add_in(shiftrow_out_reg),
. add_out(add_out));
	
		
	
		assign state_out_temp = add_out;
    
    assign state_out = state_out_temp;
	
endmodule

module aes_128_encrypt_top(
    input wire clk,
    input wire reset,
    input wire [127:0] key,
    input wire [127:0] addroundkey_1, 
    input wire [127:0] addroundkey_2, 
    input wire [127:0] addroundkey_3, 
    input wire [127:0] addroundkey_4, 
    input wire [127:0] addroundkey_5,
	input wire [127:0] addroundkey_6, 
	input wire [127:0] addroundkey_7, 
	input wire [127:0] addroundkey_8, 
	input wire [127:0] addroundkey_9, 
	input wire [127:0] addroundkey_10, 
    input wire [127:0] plain_text,
    output wire [127:0] encrypted_text
	);
	
wire [127:0] zero_128;
assign zero_128 =128'b0;


	wire [127:0] state_in;	
	wire [127:0] state_out_1;
	wire [127:0] state_in_2, state_out_2;
	wire [127:0] state_in_3, state_out_3;
	wire [127:0] state_in_4, state_out_4;
	wire [127:0] state_in_5, state_out_5;
	wire [127:0] state_in_6, state_out_6;
	wire [127:0] state_in_7, state_out_7;
	wire [127:0] state_in_8, state_out_8;
	wire [127:0] state_in_9, state_out_9;
	wire [127:0] final_state_in, final_state_out;
	

	
reg [127:0] state_in_reg;
reg [127:0] state_in_2_reg; 
reg [127:0] state_in_3_reg;
reg [127:0] state_in_4_reg; 
reg [127:0] state_in_5_reg;
reg [127:0] state_in_6_reg; 
reg [127:0] state_in_7_reg; 
reg [127:0] state_in_8_reg;
reg [127:0] state_in_9_reg;
reg [127:0] final_state_in_reg;
reg [127:0] final_state_out_reg;
	




		reg [127:0] key_reg;

		reg [127:0] addroundkey_1_reg;
		reg [127:0] addroundkey_1_reg1;

		reg [127:0] addroundkey_2_reg;
		reg [127:0] addroundkey_2_reg1;
		reg [127:0] addroundkey_2_reg2;
		reg [127:0] addroundkey_2_reg3;
		reg [127:0] addroundkey_2_reg4;
		reg [127:0] addroundkey_2_reg5;
		


		reg [127:0] addroundkey_3_reg;
		reg [127:0] addroundkey_3_reg1;
		reg [127:0] addroundkey_3_reg2;
		reg [127:0] addroundkey_3_reg3;
		reg [127:0] addroundkey_3_reg4;
		reg [127:0] addroundkey_3_reg5;
		reg [127:0] addroundkey_3_reg6;
		reg [127:0] addroundkey_3_reg7;
		reg [127:0] addroundkey_3_reg8;
		reg [127:0] addroundkey_3_reg9;
		


		reg [127:0] addroundkey_4_reg;
		reg [127:0] addroundkey_4_reg1;
		reg [127:0] addroundkey_4_reg2;
		reg [127:0] addroundkey_4_reg3;
		reg [127:0] addroundkey_4_reg4;
		reg [127:0] addroundkey_4_reg5;
		reg [127:0] addroundkey_4_reg6;
		reg [127:0] addroundkey_4_reg7;
		reg [127:0] addroundkey_4_reg8;
		reg [127:0] addroundkey_4_reg9;
		reg [127:0] addroundkey_4_reg10;
		reg [127:0] addroundkey_4_reg11;
		reg [127:0] addroundkey_4_reg12;
		reg [127:0] addroundkey_4_reg13;
		


		reg [127:0] addroundkey_5_reg;
		reg [127:0] addroundkey_5_reg1;
		reg [127:0] addroundkey_5_reg2;
		reg [127:0] addroundkey_5_reg3;
		reg [127:0] addroundkey_5_reg4;
		reg [127:0] addroundkey_5_reg5;
		reg [127:0] addroundkey_5_reg6;
		reg [127:0] addroundkey_5_reg7;
		reg [127:0] addroundkey_5_reg8;
		reg [127:0] addroundkey_5_reg9;
		reg [127:0] addroundkey_5_reg10;
		reg [127:0] addroundkey_5_reg11;
		reg [127:0] addroundkey_5_reg12;
		reg [127:0] addroundkey_5_reg13;
		reg [127:0] addroundkey_5_reg14;
		reg [127:0] addroundkey_5_reg15;
		reg [127:0] addroundkey_5_reg16;
		reg [127:0] addroundkey_5_reg17;
		


		reg [127:0] addroundkey_6_reg;
		reg [127:0] addroundkey_6_reg1;
		reg [127:0] addroundkey_6_reg2;
		reg [127:0] addroundkey_6_reg3;
		reg [127:0] addroundkey_6_reg4;
		reg [127:0] addroundkey_6_reg5;
		reg [127:0] addroundkey_6_reg6;
		reg [127:0] addroundkey_6_reg7;
		reg [127:0] addroundkey_6_reg8;
		reg [127:0] addroundkey_6_reg9;
		reg [127:0] addroundkey_6_reg10;
		reg [127:0] addroundkey_6_reg11;
		reg [127:0] addroundkey_6_reg12;
		reg [127:0] addroundkey_6_reg13;
		reg [127:0] addroundkey_6_reg14;
		reg [127:0] addroundkey_6_reg15;
		reg [127:0] addroundkey_6_reg16;
		reg [127:0] addroundkey_6_reg17;
		reg [127:0] addroundkey_6_reg18;
		reg [127:0] addroundkey_6_reg19;
		reg [127:0] addroundkey_6_reg20;
		reg [127:0] addroundkey_6_reg21;
		

		reg [127:0] addroundkey_7_reg;
		reg [127:0] addroundkey_7_reg1;
		reg [127:0] addroundkey_7_reg2;
		reg [127:0] addroundkey_7_reg3;
		reg [127:0] addroundkey_7_reg4;
		reg [127:0] addroundkey_7_reg5;
		reg [127:0] addroundkey_7_reg6;
		reg [127:0] addroundkey_7_reg7;
		reg [127:0] addroundkey_7_reg8;
		reg [127:0] addroundkey_7_reg9;
		reg [127:0] addroundkey_7_reg10;
		reg [127:0] addroundkey_7_reg11;
		reg [127:0] addroundkey_7_reg12;
		reg [127:0] addroundkey_7_reg13;
		reg [127:0] addroundkey_7_reg14;
		reg [127:0] addroundkey_7_reg15;
		reg [127:0] addroundkey_7_reg16;
		reg [127:0] addroundkey_7_reg17;
		reg [127:0] addroundkey_7_reg18;
		reg [127:0] addroundkey_7_reg19;
		reg [127:0] addroundkey_7_reg20;
		reg [127:0] addroundkey_7_reg21;
		reg [127:0] addroundkey_7_reg22;
		reg [127:0] addroundkey_7_reg23;
		reg [127:0] addroundkey_7_reg24;
		reg [127:0] addroundkey_7_reg25;
		

		reg [127:0] addroundkey_8_reg;
		reg [127:0] addroundkey_8_reg1;
		reg [127:0] addroundkey_8_reg2;
		reg [127:0] addroundkey_8_reg3;
		reg [127:0] addroundkey_8_reg4;
		reg [127:0] addroundkey_8_reg5;
		reg [127:0] addroundkey_8_reg6;
		reg [127:0] addroundkey_8_reg7;
		reg [127:0] addroundkey_8_reg8;
		reg [127:0] addroundkey_8_reg9;
		reg [127:0] addroundkey_8_reg10;
		reg [127:0] addroundkey_8_reg11;
		reg [127:0] addroundkey_8_reg12;
		reg [127:0] addroundkey_8_reg13;
		reg [127:0] addroundkey_8_reg14;
		reg [127:0] addroundkey_8_reg15;
		reg [127:0] addroundkey_8_reg16;
		reg [127:0] addroundkey_8_reg17;
		reg [127:0] addroundkey_8_reg18;
		reg [127:0] addroundkey_8_reg19;
		reg [127:0] addroundkey_8_reg20;
		reg [127:0] addroundkey_8_reg21;
		reg [127:0] addroundkey_8_reg22;
		reg [127:0] addroundkey_8_reg23;
		reg [127:0] addroundkey_8_reg24;
		reg [127:0] addroundkey_8_reg25;
		reg [127:0] addroundkey_8_reg26;
		reg [127:0] addroundkey_8_reg27;
		reg [127:0] addroundkey_8_reg28;
		reg [127:0] addroundkey_8_reg29;
		

		reg [127:0] addroundkey_9_reg;
		reg [127:0] addroundkey_9_reg1;
		reg [127:0] addroundkey_9_reg2;
		reg [127:0] addroundkey_9_reg3;
		reg [127:0] addroundkey_9_reg4;
		reg [127:0] addroundkey_9_reg5;
		reg [127:0] addroundkey_9_reg6;
		reg [127:0] addroundkey_9_reg7;
		reg [127:0] addroundkey_9_reg8;
		reg [127:0] addroundkey_9_reg9;
		reg [127:0] addroundkey_9_reg10;
		reg [127:0] addroundkey_9_reg11;
		reg [127:0] addroundkey_9_reg12;
		reg [127:0] addroundkey_9_reg13;
		reg [127:0] addroundkey_9_reg14;
		reg [127:0] addroundkey_9_reg15;
		reg [127:0] addroundkey_9_reg16;
		reg [127:0] addroundkey_9_reg17;
		reg [127:0] addroundkey_9_reg18;
		reg [127:0] addroundkey_9_reg19;
		reg [127:0] addroundkey_9_reg20;
		reg [127:0] addroundkey_9_reg21;
		reg [127:0] addroundkey_9_reg22;
		reg [127:0] addroundkey_9_reg23;
		reg [127:0] addroundkey_9_reg24;
		reg [127:0] addroundkey_9_reg25;
		reg [127:0] addroundkey_9_reg26;
		reg [127:0] addroundkey_9_reg27;
		reg [127:0] addroundkey_9_reg28;
		reg [127:0] addroundkey_9_reg29;
		reg [127:0] addroundkey_9_reg30;
		reg [127:0] addroundkey_9_reg31;
		reg [127:0] addroundkey_9_reg32;
		reg [127:0] addroundkey_9_reg33;
		


		reg [127:0] addroundkey_10_reg;
		reg [127:0] addroundkey_10_reg1;
		reg [127:0] addroundkey_10_reg2;
		reg [127:0] addroundkey_10_reg3;
		reg [127:0] addroundkey_10_reg4;
		reg [127:0] addroundkey_10_reg5;
		reg [127:0] addroundkey_10_reg6;
		reg [127:0] addroundkey_10_reg7;
		reg [127:0] addroundkey_10_reg8;
		reg [127:0] addroundkey_10_reg9;
		reg [127:0] addroundkey_10_reg10;
		reg [127:0] addroundkey_10_reg11;
		reg [127:0] addroundkey_10_reg12;
		reg [127:0] addroundkey_10_reg13;
		reg [127:0] addroundkey_10_reg14;
		reg [127:0] addroundkey_10_reg15;
		reg [127:0] addroundkey_10_reg16;
		reg [127:0] addroundkey_10_reg17;
		reg [127:0] addroundkey_10_reg18;
		reg [127:0] addroundkey_10_reg19;
		reg [127:0] addroundkey_10_reg20;
		reg [127:0] addroundkey_10_reg21;
		reg [127:0] addroundkey_10_reg22;
		reg [127:0] addroundkey_10_reg23;
		reg [127:0] addroundkey_10_reg24;
		reg [127:0] addroundkey_10_reg25;
		reg [127:0] addroundkey_10_reg26;
		reg [127:0] addroundkey_10_reg27;
		reg [127:0] addroundkey_10_reg28;
		reg [127:0] addroundkey_10_reg29;
		reg [127:0] addroundkey_10_reg30;
		reg [127:0] addroundkey_10_reg31;
		reg [127:0] addroundkey_10_reg32;
		reg [127:0] addroundkey_10_reg33;
		reg [127:0] addroundkey_10_reg34;
		reg [127:0] addroundkey_10_reg35;
		reg [127:0] addroundkey_10_reg36;
		reg [127:0] addroundkey_10_reg37;
		
		

		reg [127:0] plain_text_reg;
		reg [127:0] plain_text_reg1;
		reg [127:0] plain_text_reg2;
		reg [127:0] plain_text_reg3;
		reg [127:0] plain_text_reg4;
		reg [127:0] plain_text_reg5;
		reg [127:0] plain_text_reg6;
		reg [127:0] plain_text_reg7;
		reg [127:0] plain_text_reg8;
		reg [127:0] plain_text_reg9;
		reg [127:0] plain_text_reg10;
		reg [127:0] plain_text_reg11;
		reg [127:0] plain_text_reg12;
		reg [127:0] plain_text_reg13;
		reg [127:0] plain_text_reg14;
		reg [127:0] plain_text_reg15;
		reg [127:0] plain_text_reg16;
		reg [127:0] plain_text_reg17;
		reg [127:0] plain_text_reg18;
		reg [127:0] plain_text_reg19;
		reg [127:0] plain_text_reg20;
		reg [127:0] plain_text_reg21;
		reg [127:0] plain_text_reg22;

	always @(posedge clk)
    begin
        
		case(reset)
		1'b0:
		begin
		key_reg<=zero_128;

		addroundkey_1_reg<=zero_128;
		addroundkey_1_reg1<=zero_128;

		addroundkey_2_reg<=zero_128;
		addroundkey_2_reg1<=zero_128;
		addroundkey_2_reg2<=zero_128;


		addroundkey_3_reg<=zero_128;
		addroundkey_3_reg1<=zero_128;
		addroundkey_3_reg2<=zero_128;
		addroundkey_3_reg3<=zero_128;


		addroundkey_4_reg<=zero_128;
		addroundkey_4_reg1<=zero_128;
		addroundkey_4_reg2<=zero_128;
		addroundkey_4_reg3<=zero_128;
		addroundkey_4_reg4<=zero_128;


		addroundkey_5_reg<=zero_128;
		addroundkey_5_reg1<=zero_128;
		addroundkey_5_reg2<=zero_128;
		addroundkey_5_reg3<=zero_128;
		addroundkey_5_reg4<=zero_128;
		addroundkey_5_reg5<=zero_128;


		addroundkey_6_reg<=zero_128;
		addroundkey_6_reg1<=zero_128;
		addroundkey_6_reg2<=zero_128;
		addroundkey_6_reg3<=zero_128;
		addroundkey_6_reg4<=zero_128;
		addroundkey_6_reg5<=zero_128;
		addroundkey_6_reg6<=zero_128;

		addroundkey_7_reg<=zero_128;
		addroundkey_7_reg1<=zero_128;
		addroundkey_7_reg2<=zero_128;
		addroundkey_7_reg3<=zero_128;
		addroundkey_7_reg4<=zero_128;
		addroundkey_7_reg5<=zero_128;
		addroundkey_7_reg6<=zero_128;
		addroundkey_7_reg7<=zero_128;

		addroundkey_8_reg<=zero_128;
		addroundkey_8_reg1<=zero_128;
		addroundkey_8_reg2<=zero_128;
		addroundkey_8_reg3<=zero_128;
		addroundkey_8_reg4<=zero_128;
		addroundkey_8_reg5<=zero_128;
		addroundkey_8_reg6<=zero_128;
		addroundkey_8_reg7<=zero_128;
		addroundkey_8_reg8<=zero_128;

		addroundkey_9_reg<=zero_128;
		addroundkey_9_reg1<=zero_128;
		addroundkey_9_reg2<=zero_128;
		addroundkey_9_reg3<=zero_128;
		addroundkey_9_reg4<=zero_128;
		addroundkey_9_reg5<=zero_128;
		addroundkey_9_reg6<=zero_128;
		addroundkey_9_reg7<=zero_128;
		addroundkey_9_reg8<=zero_128;
		addroundkey_9_reg9<=zero_128;


		addroundkey_10_reg<=zero_128;
		addroundkey_10_reg1<=zero_128;
		addroundkey_10_reg2<=zero_128;
		addroundkey_10_reg3<=zero_128;
		addroundkey_10_reg4<=zero_128;
		addroundkey_10_reg5<=zero_128;
		addroundkey_10_reg6<=zero_128;
		addroundkey_10_reg7<=zero_128;
		addroundkey_10_reg8<=zero_128;
		addroundkey_10_reg9<=zero_128;
		addroundkey_10_reg10<=zero_128;
		end

		1'b1:
		begin

		key_reg<=key;

		addroundkey_1_reg<=addroundkey_1;
		addroundkey_1_reg1<=addroundkey_1_reg;
		

		addroundkey_2_reg<=addroundkey_2;
		addroundkey_2_reg1<=addroundkey_2_reg;
		addroundkey_2_reg2<=addroundkey_2_reg1;
		addroundkey_2_reg3<=addroundkey_2_reg2;
		addroundkey_2_reg4<=addroundkey_2_reg3;
		addroundkey_2_reg5<=addroundkey_2_reg4;
		


		addroundkey_3_reg<=addroundkey_3;
		addroundkey_3_reg1<=addroundkey_3_reg;
		addroundkey_3_reg2<=addroundkey_3_reg1;
		addroundkey_3_reg3<=addroundkey_3_reg2;
		addroundkey_3_reg4<=addroundkey_3_reg3;
		addroundkey_3_reg5<=addroundkey_3_reg4;
		addroundkey_3_reg6<=addroundkey_3_reg5;
		addroundkey_3_reg7<=addroundkey_3_reg6;
		addroundkey_3_reg8<=addroundkey_3_reg7;
		addroundkey_3_reg9<=addroundkey_3_reg8;
		


		addroundkey_4_reg<=addroundkey_4;
		addroundkey_4_reg1<=addroundkey_4_reg;
		addroundkey_4_reg2<=addroundkey_4_reg1;
		addroundkey_4_reg3<=addroundkey_4_reg2;
		addroundkey_4_reg4<=addroundkey_4_reg3;
		addroundkey_4_reg5<=addroundkey_4_reg4;
		addroundkey_4_reg6<=addroundkey_4_reg5;
		addroundkey_4_reg7<=addroundkey_4_reg6;
		addroundkey_4_reg8<=addroundkey_4_reg7;
		addroundkey_4_reg9<=addroundkey_4_reg8;
		addroundkey_4_reg10<=addroundkey_4_reg9;
		addroundkey_4_reg11<=addroundkey_4_reg10;
		addroundkey_4_reg12<=addroundkey_4_reg11;
		addroundkey_4_reg13<=addroundkey_4_reg12;
		


		addroundkey_5_reg<=addroundkey_5;
		addroundkey_5_reg1<=addroundkey_5_reg;
		addroundkey_5_reg2<=addroundkey_5_reg1;
		addroundkey_5_reg3<=addroundkey_5_reg2;
		addroundkey_5_reg4<=addroundkey_5_reg3;
		addroundkey_5_reg5<=addroundkey_5_reg4;
		addroundkey_5_reg6<=addroundkey_5_reg5;
		addroundkey_5_reg7<=addroundkey_5_reg6;
		addroundkey_5_reg8<=addroundkey_5_reg7;
		addroundkey_5_reg9<=addroundkey_5_reg8;
		addroundkey_5_reg10<=addroundkey_5_reg9;
		addroundkey_5_reg11<=addroundkey_5_reg10;
		addroundkey_5_reg12<=addroundkey_5_reg11;
		addroundkey_5_reg13<=addroundkey_5_reg12;
		addroundkey_5_reg14<=addroundkey_5_reg13;
		addroundkey_5_reg15<=addroundkey_5_reg14;
		addroundkey_5_reg16<=addroundkey_5_reg15;
		addroundkey_5_reg17<=addroundkey_5_reg16;
		


		addroundkey_6_reg<=addroundkey_6;
		addroundkey_6_reg1<=addroundkey_6_reg;
		addroundkey_6_reg2<=addroundkey_6_reg1;
		addroundkey_6_reg3<=addroundkey_6_reg2;
		addroundkey_6_reg4<=addroundkey_6_reg3;
		addroundkey_6_reg5<=addroundkey_6_reg4;
		addroundkey_6_reg6<=addroundkey_6_reg5;
		addroundkey_6_reg7<=addroundkey_6_reg6;
		addroundkey_6_reg8<=addroundkey_6_reg7;
		addroundkey_6_reg9<=addroundkey_6_reg8;
		addroundkey_6_reg10<=addroundkey_6_reg9;
		addroundkey_6_reg11<=addroundkey_6_reg10;
		addroundkey_6_reg12<=addroundkey_6_reg11;
		addroundkey_6_reg13<=addroundkey_6_reg12;
		addroundkey_6_reg14<=addroundkey_6_reg13;
		addroundkey_6_reg15<=addroundkey_6_reg14;
		addroundkey_6_reg16<=addroundkey_6_reg15;
		addroundkey_6_reg17<=addroundkey_6_reg16;
		addroundkey_6_reg18<=addroundkey_6_reg17;
		addroundkey_6_reg19<=addroundkey_6_reg18;
		addroundkey_6_reg20<=addroundkey_6_reg19;
		addroundkey_6_reg21<=addroundkey_6_reg20;
		

		addroundkey_7_reg<=addroundkey_7;
		addroundkey_7_reg1<=addroundkey_7_reg;
		addroundkey_7_reg2<=addroundkey_7_reg1;
		addroundkey_7_reg3<=addroundkey_7_reg2;
		addroundkey_7_reg4<=addroundkey_7_reg3;
		addroundkey_7_reg5<=addroundkey_7_reg4;
		addroundkey_7_reg6<=addroundkey_7_reg5;
		addroundkey_7_reg7<=addroundkey_7_reg6;
		addroundkey_7_reg8<=addroundkey_7_reg7;
		addroundkey_7_reg9<=addroundkey_7_reg8;
		addroundkey_7_reg10<=addroundkey_7_reg9;
		addroundkey_7_reg11<=addroundkey_7_reg10;
		addroundkey_7_reg12<=addroundkey_7_reg11;
		addroundkey_7_reg13<=addroundkey_7_reg12;
		addroundkey_7_reg14<=addroundkey_7_reg13;
		addroundkey_7_reg15<=addroundkey_7_reg14;
		addroundkey_7_reg16<=addroundkey_7_reg15;
		addroundkey_7_reg17<=addroundkey_7_reg16;
		addroundkey_7_reg18<=addroundkey_7_reg17;
		addroundkey_7_reg19<=addroundkey_7_reg18;
		addroundkey_7_reg20<=addroundkey_7_reg19;
		addroundkey_7_reg21<=addroundkey_7_reg20;
		addroundkey_7_reg22<=addroundkey_7_reg21;
		addroundkey_7_reg23<=addroundkey_7_reg22;
		addroundkey_7_reg24<=addroundkey_7_reg23;
		addroundkey_7_reg25<=addroundkey_7_reg24;
		

		addroundkey_8_reg<=addroundkey_8;
		addroundkey_8_reg1<=addroundkey_8_reg;
		addroundkey_8_reg2<=addroundkey_8_reg1;
		addroundkey_8_reg3<=addroundkey_8_reg2;
		addroundkey_8_reg4<=addroundkey_8_reg3;
		addroundkey_8_reg5<=addroundkey_8_reg4;
		addroundkey_8_reg6<=addroundkey_8_reg5;
		addroundkey_8_reg7<=addroundkey_8_reg6;
		addroundkey_8_reg8<=addroundkey_8_reg7;
		addroundkey_8_reg9<=addroundkey_8_reg8;
		addroundkey_8_reg10<=addroundkey_8_reg9;
		addroundkey_8_reg11<=addroundkey_8_reg10;
		addroundkey_8_reg12<=addroundkey_8_reg11;
		addroundkey_8_reg13<=addroundkey_8_reg12;
		addroundkey_8_reg14<=addroundkey_8_reg13;
		addroundkey_8_reg15<=addroundkey_8_reg14;
		addroundkey_8_reg16<=addroundkey_8_reg15;
		addroundkey_8_reg17<=addroundkey_8_reg16;
		addroundkey_8_reg18<=addroundkey_8_reg17;
		addroundkey_8_reg19<=addroundkey_8_reg18;
		addroundkey_8_reg20<=addroundkey_8_reg19;
		addroundkey_8_reg21<=addroundkey_8_reg20;
		addroundkey_8_reg22<=addroundkey_8_reg21;
		addroundkey_8_reg23<=addroundkey_8_reg22;
		addroundkey_8_reg24<=addroundkey_8_reg23;
		addroundkey_8_reg25<=addroundkey_8_reg24;
		addroundkey_8_reg26<=addroundkey_8_reg25;
		addroundkey_8_reg27<=addroundkey_8_reg26;
		addroundkey_8_reg28<=addroundkey_8_reg27;
		addroundkey_8_reg29<=addroundkey_8_reg28;
		

		addroundkey_9_reg<=addroundkey_9;
		addroundkey_9_reg1<=addroundkey_9_reg;
		addroundkey_9_reg2<=addroundkey_9_reg1;
		addroundkey_9_reg3<=addroundkey_9_reg2;
		addroundkey_9_reg4<=addroundkey_9_reg3;
		addroundkey_9_reg5<=addroundkey_9_reg4;
		addroundkey_9_reg6<=addroundkey_9_reg5;
		addroundkey_9_reg7<=addroundkey_9_reg6;
		addroundkey_9_reg8<=addroundkey_9_reg7;
		addroundkey_9_reg9<=addroundkey_9_reg8;
		addroundkey_9_reg10<=addroundkey_9_reg9;
		addroundkey_9_reg11<=addroundkey_9_reg10;
		addroundkey_9_reg12<=addroundkey_9_reg11;
		addroundkey_9_reg13<=addroundkey_9_reg12;
		addroundkey_9_reg14<=addroundkey_9_reg13;
		addroundkey_9_reg15<=addroundkey_9_reg14;
		addroundkey_9_reg16<=addroundkey_9_reg15;
		addroundkey_9_reg17<=addroundkey_9_reg16;
		addroundkey_9_reg18<=addroundkey_9_reg17;
		addroundkey_9_reg19<=addroundkey_9_reg18;
		addroundkey_9_reg20<=addroundkey_9_reg19;
		addroundkey_9_reg21<=addroundkey_9_reg20;
		addroundkey_9_reg22<=addroundkey_9_reg21;
		addroundkey_9_reg23<=addroundkey_9_reg22;
		addroundkey_9_reg24<=addroundkey_9_reg23;
		addroundkey_9_reg25<=addroundkey_9_reg24;
		addroundkey_9_reg26<=addroundkey_9_reg25;
		addroundkey_9_reg27<=addroundkey_9_reg26;
		addroundkey_9_reg28<=addroundkey_9_reg27;
		addroundkey_9_reg29<=addroundkey_9_reg28;
		addroundkey_9_reg30<=addroundkey_9_reg29;
		addroundkey_9_reg31<=addroundkey_9_reg30;
		addroundkey_9_reg32<=addroundkey_9_reg31;
		addroundkey_9_reg33<=addroundkey_9_reg32;
		


		addroundkey_10_reg<=addroundkey_10;
		addroundkey_10_reg1<=addroundkey_10_reg;
		addroundkey_10_reg2<=addroundkey_10_reg1;
		addroundkey_10_reg3<=addroundkey_10_reg2;
		addroundkey_10_reg4<=addroundkey_10_reg3;
		addroundkey_10_reg5<=addroundkey_10_reg4;
		addroundkey_10_reg6<=addroundkey_10_reg5;
		addroundkey_10_reg7<=addroundkey_10_reg6;
		addroundkey_10_reg8<=addroundkey_10_reg7;
		addroundkey_10_reg9<=addroundkey_10_reg8;
		addroundkey_10_reg10<=addroundkey_10_reg9;
		addroundkey_10_reg11<=addroundkey_10_reg10;
		addroundkey_10_reg12<=addroundkey_10_reg11;
		addroundkey_10_reg13<=addroundkey_10_reg12;
		addroundkey_10_reg14<=addroundkey_10_reg13;
		addroundkey_10_reg15<=addroundkey_10_reg14;
		addroundkey_10_reg16<=addroundkey_10_reg15;
		addroundkey_10_reg17<=addroundkey_10_reg16;
		addroundkey_10_reg18<=addroundkey_10_reg17;
		addroundkey_10_reg19<=addroundkey_10_reg18;
		addroundkey_10_reg20<=addroundkey_10_reg19;
		addroundkey_10_reg21<=addroundkey_10_reg20;
		addroundkey_10_reg22<=addroundkey_10_reg21;
		addroundkey_10_reg23<=addroundkey_10_reg22;
		addroundkey_10_reg24<=addroundkey_10_reg23;
		addroundkey_10_reg25<=addroundkey_10_reg24;
		addroundkey_10_reg26<=addroundkey_10_reg25;
		addroundkey_10_reg27<=addroundkey_10_reg26;
		addroundkey_10_reg28<=addroundkey_10_reg27;
		addroundkey_10_reg29<=addroundkey_10_reg28;
		addroundkey_10_reg30<=addroundkey_10_reg29;
		addroundkey_10_reg31<=addroundkey_10_reg30;
		addroundkey_10_reg32<=addroundkey_10_reg31;
		addroundkey_10_reg33<=addroundkey_10_reg32;
		addroundkey_10_reg34<=addroundkey_10_reg33;
		addroundkey_10_reg35<=addroundkey_10_reg34;
		addroundkey_10_reg36<=addroundkey_10_reg35;
		addroundkey_10_reg37<=addroundkey_10_reg36;
		
		

		plain_text_reg<=plain_text;
		plain_text_reg1<=plain_text_reg;
		plain_text_reg2<=plain_text_reg1;
		plain_text_reg3<=plain_text_reg2;
		plain_text_reg4<=plain_text_reg3;
		plain_text_reg5<=plain_text_reg4;
		plain_text_reg6<=plain_text_reg5;
		plain_text_reg7<=plain_text_reg6;
		plain_text_reg8<=plain_text_reg7;
		plain_text_reg9<=plain_text_reg8;
		plain_text_reg10<=plain_text_reg9;
		plain_text_reg11<=plain_text_reg10;
		plain_text_reg12<=plain_text_reg11;
		plain_text_reg13<=plain_text_reg12;
		plain_text_reg14<=plain_text_reg13;
		plain_text_reg15<=plain_text_reg14;
		plain_text_reg16<=plain_text_reg15;
		plain_text_reg17<=plain_text_reg16;
		plain_text_reg18<=plain_text_reg17;
		plain_text_reg19<=plain_text_reg18;
		plain_text_reg20<=plain_text_reg19;
		plain_text_reg21<=plain_text_reg20;
		plain_text_reg22<=plain_text_reg21;


		state_in_reg <= state_in;
	    state_in_2_reg <= state_out_1;
	    state_in_3_reg <= state_out_2;
	    state_in_4_reg <= state_out_3;
	    state_in_5_reg <= state_out_4;
	    state_in_6_reg <= state_out_5;
	    state_in_7_reg <= state_out_6;
	    state_in_8_reg <= state_out_7;
	    state_in_9_reg <= state_out_8;
	    final_state_in_reg <= state_out_9;
		final_state_out_reg<=final_state_out;

		end
	
	endcase
	    
    end
	
	
    
  //1  
    add_key i_add_key(
	   
	    . r_key(key_reg),
	    . add_in(plain_text_reg20),
	    . add_out(state_in));

 //2 3 4 5   
	aes_128_encrypt_round i_aes_128_encrypt_round_1(
		. clk(clk), 
		. reset(reset),
		. r_key(addroundkey_1_reg1),
		. state_in(state_in_reg),
		.state_out(state_out_1));

	// 6 7 8 9
	aes_128_encrypt_round i_aes_128_encrypt_round_2(
		. clk(clk), 
		. reset(reset),
		. r_key(addroundkey_2_reg5),
		. state_in(state_in_2_reg),
		.state_out(state_out_2));
    //10 11 12 13
    aes_128_encrypt_round i_aes_128_encrypt_round_3(
	    . clk(clk), 
	    . reset(reset),
		. r_key(addroundkey_3_reg9),
		. state_in(state_in_3_reg),
		.state_out(state_out_3));
    //14 15 16 17
    aes_128_encrypt_round i_aes_128_encrypt_round_4(
	    . clk(clk), 
	    . reset(reset),
		. r_key(addroundkey_4_reg13),
		. state_in(state_in_4_reg),
		.state_out(state_out_4));
    //18 19 20 21
    aes_128_encrypt_round i_aes_128_encrypt_round_5(
	    . clk(clk), 
	    . reset(reset),
		. r_key(addroundkey_5_reg17),
		. state_in(state_in_5_reg),
		.state_out(state_out_5));
	//22 23 24 25
	aes_128_encrypt_round i_aes_128_encrypt_round_6(
	    . clk(clk), 
	    . reset(reset),
		. r_key(addroundkey_6_reg21),
		. state_in(state_in_6_reg),
		.state_out(state_out_6));
	//26 27 28 29
	aes_128_encrypt_round i_aes_128_encrypt_round_7(
	    . clk(clk), 
	    . reset(reset),
		. r_key(addroundkey_7_reg25),
		. state_in(state_in_7_reg),
		.state_out(state_out_7));
    // 30 31 32 33
    aes_128_encrypt_round i_aes_128_encrypt_round_8(
	    . clk(clk), 
	    . reset(reset),
		. r_key(addroundkey_8_reg29),
		. state_in(state_in_8_reg),
		.state_out(state_out_8));
    //34 35 36 37
    aes_128_encrypt_round i_aes_128_encrypt_round_9(
	    . clk(clk), 
	    . reset(reset),
		. r_key(addroundkey_9_reg33),
		. state_in(state_in_9_reg),
		.state_out(state_out_9));
    // 38 39 40
     aes_128_encrypt_final_round i_aes_128_encrypt_final_round(
	    . clk(clk), 
	    . reset(reset),
		. r_key(addroundkey_10_reg37),
		. state_in(final_state_in_reg),
		. state_out(final_state_out));

    assign encrypted_text = final_state_out_reg;

	endmodule

module aes128_encryption_top(
    input wire clk,
    input wire reset, 
    input wire [127:0] key, 
    input wire [127:0] plain_text,
    output wire [127:0] encrypted_text
	);
	
	
wire [127:0] initialkey;	
wire [127:0] addroundkey_1, addroundkey_2, addroundkey_3, addroundkey_4, addroundkey_5;
wire [127:0] addroundkey_6, addroundkey_7, addroundkey_8, addroundkey_9, addroundkey_10;
	
	
	wire [1407:0] final_expanded_key;	
	wire [127:0] encrypted_out;
 
	
    
    
	final_expanded_key_top i_final_expanded_key_top(
		.clk(clk), 
	    .reset(reset),		
		.key(key),
		.expanded_key(final_expanded_key));

	key_distribution i_key_scheduler(
	
	    . expanded_key(final_expanded_key),
		.initialkey(initialkey),
	    . addroundkey_1(addroundkey_1),
	    . addroundkey_2(addroundkey_2),
	    . addroundkey_3(addroundkey_3),
	    . addroundkey_4(addroundkey_4),
	    . addroundkey_5(addroundkey_5),
	    . addroundkey_6(addroundkey_6),
	    . addroundkey_7(addroundkey_7),
	    . addroundkey_8(addroundkey_8),
	    . addroundkey_9(addroundkey_9),
	    . addroundkey_10(addroundkey_10));

	aes_128_encrypt_top i_aes_128_encrypt_top(
		. clk(clk),
		. reset(reset),
		. key(initialkey),
		. addroundkey_1(addroundkey_1),
	    . addroundkey_2(addroundkey_2),
	    . addroundkey_3(addroundkey_3),
	    . addroundkey_4(addroundkey_4),
	    . addroundkey_5(addroundkey_5),
	    . addroundkey_6(addroundkey_6),
	    . addroundkey_7(addroundkey_7),
	    . addroundkey_8(addroundkey_8),
	    . addroundkey_9(addroundkey_9),
	    . addroundkey_10(addroundkey_10),
		. plain_text(plain_text), 
		. encrypted_text(encrypted_out));

assign encrypted_text = encrypted_out[127:0];
    

endmodule 

