module lcd(
	
	input [31:0] dataa; // nao usado
	input [31:0] datab; // nao usado
	input clk;
	input clk_en;
          
	output reg [9:0] instructions;
	output enable;
);
	assign enable = 1'b1;
	#40000 // delay 40ms
	instructions <= 10'b0000110000; //function set
	
	#40000
	instructions <= 10'b0000110000; //function set
	
	#40000
	instructions <= 10'b000001----; //internal osc frequency
	
	#40000
	instructions <= 10'b000111----; //contrast set
	
	#40000
	instructions <= 10'b000101----; //power icon contrast control
	
	#40000
	instructions <= 10'b000110----; //follower control
	
	#40000
	instructions <= 10'b0000001---; //display on off control
	
	#40000
	
	
endmodule 