module ALU (
    input [1:0] opcode,
    input [7:0] A,
    input [7:0] B,
    output [7:0] result
);
    assign result = (opcode == 2'b00) ? (A & B) :
                    (opcode == 2'b01) ? (A | B) :
                    (opcode == 2'b10) ? ~(A & B) :
                    (opcode == 2'b11) ? ~(A | B) :
                    8'b00000000;
endmodule

module RegisterFile (
    input clk,
    input [2:0] write_reg,
    input [7:0] write_data,
    input write_enable,
    input [2:0] read_reg,
    output [7:0] read_data
);
    reg [7:0] registers [7:0];

    always @(posedge clk) begin
        if (write_enable) begin
            registers[write_reg] <= write_data;
        end
    end

    assign read_data = registers[read_reg];
endmodule

module Processor (
    input clk,
    input [1:0] opcode,
    input [7:0] A,
    input [7:0] B,
    input [2:0] write_reg,
    input write_enable,
    input [2:0] read_reg,
    output [7:0] read_data
);
    wire [7:0] alu_result;

    ALU alu_inst (
        .opcode(opcode),
        .A(A),
        .B(B),
        .result(alu_result)
    );

    RegisterFile regfile_inst (
        .clk(clk),
        .write_reg(write_reg),
        .write_data(alu_result),
        .write_enable(write_enable),
        .read_reg(read_reg),
        .read_data(read_data)
    );
endmodule