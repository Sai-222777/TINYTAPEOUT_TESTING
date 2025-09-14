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

module signature(
    input clk,
    input reset,
    input ld,
    input en,
    output reg q
);
    reg [7:0] counter;
    
    always @(posedge clk) begin
        if (reset) begin
            counter <= 8'h55;
            q <= 1'b0;
        end else if (ld) begin
            counter <= 8'h55;
            q <= 1'b0;
        end else if (en) begin
            counter <= counter + 1;
            q <= ^counter; // XOR all bits
        end
    end
endmodule
