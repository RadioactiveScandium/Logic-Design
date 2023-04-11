`timescale 1ns/1ps
module pulse_gen_test ();
  logic rstn,clk,pulse_sig;
  bit sig;  
  pulse_gen dut (
                  .*
                );
  initial begin
    clk = 1'b0;
    sig = 1'b0;
  end
  always #5 clk = ~clk;
  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,pulse_gen_test);
  end
  initial begin  
    rstn = 1'b0; #20;
    rstn = 1'b1; #13;
    /* Randomizing the input sig to have any value between 0 and 1 */
    repeat (20) begin
                sig = $urandom_range(0,1);
                #20; 
                $display("Time = \t\tRstn = %0b\t\tSig = %0d",  $time, rstn, sig);  
                
    end
    #10000;
    $finish;
  end
endmodule