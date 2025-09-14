// Copyright 2023 Luke Vassallo
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

module galois_lfsr #(parameter N = 32)(
    input clk,
    input rst,
    input en,
    input ld,
    input sel0,
    input sel1,
    input [N-1:0] taps,
    input [N-1:0] lfsr_i,
    output [N-1:0] lfsr_o,
    output k
);
    reg [N-1:0] lfsr;
    
    always @(posedge clk) begin
        if (rst) begin
            lfsr <= {N{1'b1}};
        end else if (ld) begin
            lfsr <= lfsr_i;
        end else if (en) begin
            lfsr <= {lfsr[N-2:0], 1'b0} ^ (taps & {N{lfsr[N-1]}});
        end
    end
    
    wire [31:0] lfsr_o32;
    wire [15:0] lfsr_o16;
    
    assign lfsr_o32 = lfsr;
    assign lsfr_o16 = lfsr[31:16];
    
    assign lfsr_o = !sel0 ? {16'b0,lfsr_o16} : lfsr_o32;
    
    assign k = lfsr[N-1];
    
endmodule
