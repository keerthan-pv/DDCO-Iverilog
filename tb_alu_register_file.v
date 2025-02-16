module Testbench;
    reg clk;
    reg [1:0] opcode;
    reg [7:0] A, B;
    reg [2:0] write_reg, read_reg;
    reg write_enable;
    wire [7:0] read_data;

    Processor proc (
        .clk(clk),
        .opcode(opcode),
        .A(A),
        .B(B),
        .write_reg(write_reg),
        .write_enable(write_enable),
        .read_reg(read_reg),
        .read_data(read_data)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0, Testbench);

        $monitor("At time %t, opcode = %b, A = %b, B = %b, write_reg = %b, read_reg = %b, read_data = %b", 
                 $time, opcode, A, B, write_reg, read_reg, read_data);

        opcode = 2'b00;
        A = 8'b10101010;
        B = 8'b11001100;
        write_reg = 8'b001;
        write_enable = 1;
        #10;

        read_reg = 8'b001;
        write_enable = 0;
        #10;

        opcode = 2'b01;
        A = 8'b10101010;
        B = 8'b11001100;
        write_reg = 8'b010;
        write_enable = 1;
        #10;

        read_reg = 8'b010;
        write_enable = 0;
        #10;
        
        opcode = 2'b10;
        A = 8'b10101010;
        B = 8'b11001100;
        write_reg = 8'b011;
        write_enable = 1;
        #10;

        read_reg = 8'b011;
        write_enable = 0;
        #10;

        opcode = 2'b11;
        A = 8'b10101010;
        B = 8'b11001100;
        write_reg = 8'b100;
        write_enable = 1;
        #10;

        read_reg = 8'b100;
        write_enable = 0;
        #10;

        $finish;
    end
endmodule
