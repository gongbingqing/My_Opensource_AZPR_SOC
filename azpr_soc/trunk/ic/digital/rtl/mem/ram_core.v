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
//File Name      : ram_core.v 
//Project Name   : azpr_soc
//Description    : the system ram_core.
//Github Address : github.com/C-L-G/azpr_soc/trunk/ic/digital/rtl/mem/ram_core.v
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
//2016.11.22 - lichangbeiju - Add basic ram_core write and read logic.
//*---------------------------------------------------------------------------------------------------
//File Include : system header file
`include "../sys_include.h"

`include "rom.h" 
module ram_core #(
   parameter MEM_WIDTH      = 32,
   parameter MEM_ADDR_BITS  = 11
)(
    input   wire                            clockA,
    input   wire                            clockB,
    input   wire                            write_enableA,
    input   wire                            write_enableB,
    input   wire    [MEM_ADDR_BITS-1:0]     addressA, 
    input   wire    [MEM_ADDR_BITS-1:0]     addressB, 
    input   wire    [MEM_WIDTH-1:0]         input_dataA, 
    input   wire    [MEM_WIDTH-1:0]         input_dataB, 
    output  reg     [MEM_WIDTH-1:0]         output_dataA,
    output  reg     [MEM_WIDTH-1:0]         output_dataB
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

    //------------------------------------------------------------------------------------------------
    // 2.2 the memory register
    //------------------------------------------------------------------------------------------------  
    //(* RAM_STYLE="{AUTO | BLOCK |  BLOCK_POWER1 | BLOCK_POWER2}" *)
    (* RAM_STYLE="BLOCK" *)
    reg     [MEM_WIDTH-1:0]     sym_ram     [(2**MEM_ADDR_BITS)-1:0];

    wire                        enableA         ;
    wire                        enableB         ;

    wire    [MEM_ADDR_BITS-1:0] begin_address   ;
    wire    [MEM_ADDR_BITS-1:0] end_address     ;
    //************************************************************************************************
    // 3.Main code
    //************************************************************************************************

    //------------------------------------------------------------------------------------------------
    // 3.1 the memory read and write logic
    //------------------------------------------------------------------------------------------------
    assign enableA = `ENABLE;
    assign enableB = `ENABLE;

    assign begin_address    = 'd0;
    assign end_address      = (2**MEM_ADDR_BITS)-1;

   //  The forllowing code is only necessary if you wish to initialize the RAM 
   //  contents via an external file (use $readmemb for binary data)
   initial
//        $readmemh("led.coe", sym_ram, begin_address, end_address);
        $readmemh("led.mem", sym_ram);

   always @(posedge clockA)
      if (enableA) begin
         if (write_enableA)
            sym_ram[addressA] <= input_dataA;
         output_dataA <= sym_ram[addressA];
      end
      
   always @(posedge clockB)
      if (enableB) begin
         if (write_enableB)
            sym_ram[addressB] <= input_dataB;
         output_dataB <= sym_ram[addressB];
      end
    
    
endmodule    
//****************************************************************************************************
//End of Module
//****************************************************************************************************
