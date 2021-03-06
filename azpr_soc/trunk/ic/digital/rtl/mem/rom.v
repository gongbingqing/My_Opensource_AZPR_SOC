//****************************************************************************************************  
//*---------------Copyright (c) 2016 C-L-G.FPGA1988.lichangbeiju. All rights reserved-----------------
//
//                   --              It to be define                --
//                   --                    ...                      --
//                   --                    ...                      --
//                   --                    ...                      --
//**************************************************************************************************** 
//File Information
//**************************************************************************************************** 
//File Name      : rom.v 
//Project Name   : azpr_soc
//Description    : the system rom.
//Github Address : github.com/C-L-G/azpr_soc/trunk/ic/digital/rtl/mem/rom.v
//License        : CPL
//**************************************************************************************************** 
//Version Information
//**************************************************************************************************** 
//Create Date    : 01-07-2016 17:00(1th Fri,July,2016)
//First Author   : lichangbeiju
//Modify Date    : 02-09-2016 14:20(1th Sun,July,2016)
//Last Author    : lichangbeiju
//Version Number : 002   
//Last Commit    : 03-09-2016 14:30(1th Sun,July,2016)
//**************************************************************************************************** 
//Change History(latest change first)
//yyyy.mm.dd - Author - Your log of change
//**************************************************************************************************** 
//2016.12.28 - lichangbeiju - Add the coe file read logic : led.coe read.
//2016.12.08 - lichangbeiju - Change the include.
//2016.11.22 - lichangbeiju - Add basic rom write and read logic.
//*---------------------------------------------------------------------------------------------------
//File Include : system header file
`include "../sys_include.h"

`include "rom.h" 
module rom #(
   parameter MEM_WIDTH      = 32,
   parameter MEM_ADDR_BITS  = 11
)(
    input  wire                clk,         //
    input  wire                reset,       //
    input  wire                cs_n,        //
    input  wire                as_n,        //
    input  wire [`RomAddrBus]  addr,        //
    output wire [`WordDataBus] rd_data,     //
    output reg                 rdy_n        //
);
    //************************************************************************************************
    // 1.Parameter and constant define
    //************************************************************************************************

    //************************************************************************************************
    // 2.Register and wire declaration
    //************************************************************************************************
    //------------------------------------------------------------------------------------------------
    // 2.1 the output reg
    //------------------------------------------------------------------------------------------------  
    //wire                            clockA          ;
    //wire                            clockB          ;
    //wire                            write_enableA   ;
    //wire                            write_enableB   ;
    //wire    [MEM_ADDR_BITS-1:0]     addressA        ; 
    //wire    [MEM_ADDR_BITS-1:0]     addressB        ; 
    //wire    [MEM_WIDTH-1:0]         input_dataA     ; 
    //wire    [MEM_WIDTH-1:0]         input_dataB     ; 
    //reg     [MEM_WIDTH-1:0]         output_dataA    ;
    //reg     [MEM_WIDTH-1:0]         output_dataB    ;
    //------------------------------------------------------------------------------------------------
    // 2.2 the memory register
    //------------------------------------------------------------------------------------------------  

    //************************************************************************************************
    // 3.Main code
    //************************************************************************************************
    
    //------------------------------------------------------------------------------------------------
    // 3.1 the memory read and write logic
    //------------------------------------------------------------------------------------------------
  
     //  The forllowing code is only necessary if you wish to initialize the RAM 
   //  contents via an external file (use $readmemb for binary data)
    always @(posedge clk or `RESET_EDGE reset) begin
        if (reset == `RESET_ENABLE)
            begin
                rdy_n   <= `DISABLE_N;
            end 
        else begin
            if ((cs_n == `ENABLE_N) && (as_n == `ENABLE_N))
                begin
                    rdy_n   <= `ENABLE_N;
                end 
            else
                begin
                    rdy_n   <= `DISABLE_N;
                end
        end
    end
        
    ram_core ram_core(
        .clockA             (clk                ),               
        .addressA           (addr               ),   
        .write_enableA      (1'b0               ),   
        .output_dataA       (rd_data            )           
    );
    
    
endmodule    
//****************************************************************************************************
//End of Module
//****************************************************************************************************
