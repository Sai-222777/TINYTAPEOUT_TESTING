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

module tt_um_lukevassallo_xor_cipher (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    assign uio_out = 0;
    assign uio_oe = 0;

//xor_cipher uut (
//    .clk(ui_in[0]),
//    .rst(ui_in[1]),
  
//    .data_stream(ui_in[2]),
//    .external_k(ui_in[3]),
    
//    .e(uo_out[0]),
//    .d(uo_out[1]),
    
//    .cfg_en(ui_in[4]),
//    .cfg_i(ui_in[5]),
//    .en(ui_in[6]),
//    .cfg_o(uo_out[2]),
//    .heartbeat(uo_out[7:3])
//);
dual_xor_stream_cipher #( .M(32) ) uut  (
    .clk(ui_in[0]),
    .rst(ui_in[1]),
    .tx_p(ui_in[2]),
    .rx_e(ui_in[3]),
    .cfg_en(ui_in[4]),
    .cfg_i(ui_in[5]),
    .tx_en(ui_in[6]),
    .rx_en(ui_in[7]),
    
    .tx_e(uo_out[0]),
    .rx_p(uo_out[1]),
    .dbg_tx_p(uo_out[2]),
    .dbg_rx_e(uo_out[3]), 

    .cfg_o(uo_out[4]),
    .heartbeat(uo_out[7:5])
);
endmodule
